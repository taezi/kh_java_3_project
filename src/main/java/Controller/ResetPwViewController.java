package Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import dto.userDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.UserService;
import views.ModelAndView;

public class ResetPwViewController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		// searchPwView.jsp 정보 (아이디:이메일, 이름, 별명) 받아서 회원목록 검색. 맞으면 비번 출력, 없으면 잘못입력했다 메세지 송출
		String id = request.getParameter("id");
		String username = request.getParameter("username");
		String nickname = request.getParameter("nickname");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("username", username);
		map.put("nickname", nickname);
		map.put("id", id);
		userDTO user = UserService.getInstance().searchPw(map);
		
		if (user != null) {
			request.setAttribute("okPwMsg", " 입력하신 정보가 일치합니다. 비밀번호 재설정을 진행해 주세요.");
			request.setAttribute("user", user);
		}else {
			request.setAttribute("errorPWMsg", "입력하신 아이디와 이름과 별명에 해당하는 비밀번호가 없습니다.");
			return new ModelAndView("SearchPwView.jsp", false);
		}
		
		
		return new ModelAndView("ResetPwView.jsp", false);
	}

}
