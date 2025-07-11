package Controller;

import java.io.IOException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import views.ModelAndView;

public class LogoutController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false); 
		
	
		if (session != null) {
			session.invalidate(); 
		}
		
		return new ModelAndView("/Main.do?logout=success", true); 
	}

}
