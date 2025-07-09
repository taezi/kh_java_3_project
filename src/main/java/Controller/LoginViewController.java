package Controller;

import java.io.IOException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import views.ModelAndView;

public class LoginViewController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		return new ModelAndView("login.jsp", false);
	}

}
