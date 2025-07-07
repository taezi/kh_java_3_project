package Controller;

import java.io.IOException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import views.ModelAndView;

public interface Controller {
	public ModelAndView execute (
			HttpServletResponse response, HttpServletRequest request
			)throws IOException;
}
