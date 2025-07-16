package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.json.JSONObject; // org.json 라이브러리 필요

import service.MovieTrailerFetcher; // MovieTrailerFetcher가 service 패키지에 있으므로 정확한 경로로 import

import views.ModelAndView; // 기존 컨트롤러와 동일한 인터페이스를 사용한다면 필요

public class MovieUrlController implements Controller { // Controller 인터페이스 구현

    @Override
    public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("application/json"); // JSON 응답임을 명시
        response.setCharacterEncoding("UTF-8");      // 인코딩 설정
        PrintWriter out = response.getWriter();      // 응답을 보낼 PrintWriter 객체

        String movieIdStr = request.getParameter("movieId"); // "movieId" 파라미터 값 가져오기
        System.out.println(movieIdStr);
        String trailerUrl = null;
        JSONObject jsonResponse = new JSONObject(); // JSON 응답 객체 생성

        if (movieIdStr != null && !movieIdStr.isEmpty()) {
            try {
                int movieId = Integer.parseInt(movieIdStr); // String을 int로 변환
                MovieTrailerFetcher fetcher = new MovieTrailerFetcher();
                trailerUrl = fetcher.getFirstMovieTrailer(movieId); // 예고편 URL 가져오기
                System.out.println(trailerUrl);

                if (trailerUrl != null) {
                    jsonResponse.put("success", true); // 성공 여부
                    jsonResponse.put("trailerUrl", trailerUrl); // 예고편 URL
                } else {
                    jsonResponse.put("success", false);
                    jsonResponse.put("message", "해당 영화의 예고편을 찾을 수 없습니다.");
                }

            } catch (NumberFormatException e) {
                // movieId가 숫자가 아닐 경우
                jsonResponse.put("success", false);
                jsonResponse.put("message", "유효하지 않은 영화 ID 형식입니다.");
                System.err.println("NumberFormatException for movieId: " + movieIdStr + " - " + e.getMessage());
            } catch (Exception e) {
                // 기타 예외 발생 시
                jsonResponse.put("success", false);
                jsonResponse.put("message", "예고편 정보 처리 중 서버 오류가 발생했습니다: " + e.getMessage());
                System.err.println("Error in MovieUrl controller: " + e.getMessage());
                e.printStackTrace();
            }
        } else {
            // movieId 파라미터가 없을 경우
            jsonResponse.put("success", false);
            jsonResponse.put("message", "영화 ID가 제공되지 않았습니다.");
        }

        out.print(jsonResponse.toString()); // JSON 응답 전송
        out.flush(); // 버퍼 비우기

        // AJAX 요청에 대한 응답이므로, 뷰(JSP)로 포워딩할 필요가 없습니다.
        // 따라서 null을 반환하거나, 프레임워크의 규칙에 따라 AJAX 응답임을 나타내는 ModelAndView를 반환합니다.
        // 예를 들어, views.ModelAndView 객체가 forward를 false로 설정할 경우에만 JSON을 반환하게 설정되어 있다면,
        // 아래와 같이 null을 반환하거나, 특정 뷰 이름을 반환하지 않는 방식으로 처리합니다.
        // 만약 프레임워크가 무조건 ModelAndView를 반환해야 한다면, 비어있는 ModelAndView 또는 특정 AJAX 응답용 ModelAndView를 반환해야 합니다.
        return null; // AJAX 응답을 직접 처리했으므로 뷰로 포워딩하지 않음
    }
}