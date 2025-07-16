package Controller;

import java.io.IOException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.UserService;
import views.ModelAndView;

public class UserDeleteController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		
		String usersid = request.getParameter("usersid");
		
		UserService.getInstance().deleteUser(usersid);
		
		return new ModelAndView("/Admin.do", true);
	}

}
