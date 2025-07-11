package Controller;

import java.io.IOException;

import dto.movieDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.MovieService;
import views.ModelAndView;

public class MovieInfoController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String movieid = request.getParameter("movieid");
		movieDTO movie = MovieService.getInstance().movieInfo(movieid);
		request.setAttribute("movie", movie);
		
		return new ModelAndView("movieInfo.jsp", false);
	}

}
