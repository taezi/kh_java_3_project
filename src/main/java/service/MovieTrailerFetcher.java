package service; // 패키지명은 실제 프로젝트 구조에 맞춰주세요.

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;


public class MovieTrailerFetcher {

    private static final String API_KEY = "d4e629de3558a8220fae4d8164a6b685"; // TMDb API 키
    private static final String TMDB_BASE_URL = "https://api.themoviedb.org/3/movie/";
    // 새 창으로 띄울 것이므로 watch?v= 도 괜찮고, embed/ 도 괜찮습니다.
    private static final String YOUTUBE_BASE_URL = "https://www.youtube.com/watch?v="; // 또는 "http://googleusercontent.com/youtube.com/watch?v="

    public String getFirstMovieTrailer(int movieId) {
        // ... (이전 답변에서 제공된 getFirstMovieTrailer 메서드 내용 동일) ...
        String apiUrl = TMDB_BASE_URL + movieId +
                        "?api_key=" + API_KEY +
                        "&append_to_response=videos" +
                        "&language=ko-KR";

        try {
            URL url = new URL(apiUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Accept", "application/json");

            int responseCode = connection.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                String inputLine;
                StringBuilder response = new StringBuilder();

                while ((inputLine = in.readLine()) != null) {
                    response.append(inputLine);
                }
                in.close();

                JSONObject jsonResponse = new JSONObject(response.toString());

                if (jsonResponse.has("videos")) {
                    JSONObject videos = jsonResponse.getJSONObject("videos");
                    if (videos.has("results")) {
                        JSONArray results = videos.getJSONArray("results");

                        for (int i = 0; i < results.length(); i++) {
                            JSONObject video = results.getJSONObject(i);
                            String site = video.getString("site");
                            String type = video.getString("type");
                            String key = video.getString("key");

                            if ("YouTube".equalsIgnoreCase(site) &&
                                ("Trailer".equalsIgnoreCase(type) || "Teaser".equalsIgnoreCase(type))) {
                                return YOUTUBE_BASE_URL + key;
                            }
                        }
                    }
                }
            } else {
                System.err.println("API 호출 실패: 응답 코드 " + responseCode);
                BufferedReader errorIn = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
                String errorLine;
                StringBuilder errorResponse = new StringBuilder();
                while ((errorLine = errorIn.readLine()) != null) {
                    errorResponse.append(errorLine);
                }
                errorIn.close();
                System.err.println("API 에러 메시지: " + errorResponse.toString());
            }
            connection.disconnect();

        } catch (Exception e) {
            System.err.println("예고편 정보 가져오기 중 오류 발생: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

}