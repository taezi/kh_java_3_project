package Controller;

import java.io.IOException;
import java.util.List;

import dto.movieDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.MovieService;
import views.ModelAndView;

public class SearchViewController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		// TODO Auto-generated method stub
		String keyword = request.getParameter("query");
		List<movieDTO> mlist = MovieService.getInstance().searchMovie(keyword);
		request.setAttribute("mlist", mlist);
		
		return new ModelAndView("moviesearch.jsp", false);
	}

}
