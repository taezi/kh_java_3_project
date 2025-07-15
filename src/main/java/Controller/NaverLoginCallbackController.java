package Controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.JSONObject;

import dto.userDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.UserService;
import views.ModelAndView;

public class NaverLoginCallbackController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {

		String code = request.getParameter("code");
		String state = request.getParameter("state");

		
//		----------------------------------------------------------------------------
		
		String clientId = "eKoX27wwR93fBr4I64mw";
		String clientSecret = "S5wd7Wbik9";
		String redirectURI = URLEncoder.encode("http://localhost:8888/kh_java_3_project/NaverLoginCallback.do", "UTF-8");

		String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code"
		        + "&client_id=" + clientId
		        + "&client_secret=" + clientSecret
		        + "&redirect_uri=" + redirectURI
		        + "&code=" + code
		        + "&state=" + state;

		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection)url.openConnection();
		con.setRequestMethod("GET");

		int responseCode = con.getResponseCode();
		BufferedReader br;
		if(responseCode == 200) { // 정상 호출
		    br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else {  // 에러 발생
		    br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		String inputLine;
		StringBuffer responseText = new StringBuffer();
		while ((inputLine = br.readLine()) != null) {
		    responseText.append(inputLine);
		}
		br.close();

		
//		----------------------------------------------------------------------------------
		
		// access_token 파싱 (라이브러리 없이 substring 방식)
		String tokenJson = responseText.toString();
		String accessToken = tokenJson.split("\"access_token\":\"")[1].split("\"")[0];

		// 사용자 정보 요청
		String header = "Bearer " + accessToken; // Bearer 다음에 공백 꼭 들어가야 함

		String apiURL2 = "https://openapi.naver.com/v1/nid/me";
		URL url2 = new URL(apiURL2);
		HttpURLConnection con2 = (HttpURLConnection) url2.openConnection();
		con2.setRequestMethod("GET");
		con2.setRequestProperty("Authorization", header);

		int responseCode2 = con2.getResponseCode();
		BufferedReader br2;
		if (responseCode2 == 200) {
		    br2 = new BufferedReader(new InputStreamReader(con2.getInputStream()));
		} else {
		    br2 = new BufferedReader(new InputStreamReader(con2.getErrorStream()));
		}

		String inputLine2;
		StringBuffer responseUser = new StringBuffer();
		while ((inputLine2 = br2.readLine()) != null) {
		    responseUser.append(inputLine2);
		}
		br2.close();
		
//		----------------------------------------------------------------------------------------
		
		// JSON 파싱
		JSONObject json = new JSONObject(responseUser.toString());
		JSONObject res = json.getJSONObject("response");

		String id = res.getString("email");      // usersid
		String username = res.getString("name");        // userName
		String nickname = res.getString("nickname"); // nickName

		// DTO 생성
		userDTO dto = new userDTO(id, "naver", username, nickname);

		// DB에 insert or 이미 있으면 무시
		UserService service = UserService.getInstance();
		userDTO user = service.findById(id);

		// 세션에 저장
		if (user == null) {
		    // 없으면 insert 후 조회
		    service.registerInsert(dto);
		    user = dto; // dto에 있는 정보로 로그인 처리
		} else {
		    // 이미 있으면 insert 안 하고 기존 user 사용
		    dto = user;
		}

		request.getSession().setAttribute("user", dto);
		// 포워딩
		return new ModelAndView("/index.jsp", true);
	}

}
