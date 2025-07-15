package Controller;

import java.io.IOException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import views.ModelAndView;

public class SearchPwController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		// searchPwView.jsp 정보 (아이디:이메일, 이름, 별명) 받아서 회원목록 검색. 맞으면 비번 출력, 없으면 잘못입력했다 메세지 송출
		return new ModelAndView("SearchPw.jsp", false);
	}

}
