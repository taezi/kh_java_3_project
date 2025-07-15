package Controller;

import java.io.IOException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import views.ModelAndView;

public class SearchPwViewController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		//비밀번호 찾기 화면만 전환. SearchPwView
		return new ModelAndView("SearchPwView.jsp", false);
	}

}
