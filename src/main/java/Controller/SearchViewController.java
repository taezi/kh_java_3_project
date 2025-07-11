package Controller;

import java.io.IOException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import views.ModelAndView;

public class SearchViewController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		// TODO Auto-generated method stub
		String searchKeyword = request.getParameter("query");
		request.setAttribute("searchKeyword", searchKeyword);
		
		return new ModelAndView("search.jsp", false);
	}

}
