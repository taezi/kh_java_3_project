package Controller;

import java.io.IOException;

import dto.movieDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.MovieService;
import views.ModelAndView;
import vo.RepGenreNmVO;

public class MovieInfoController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String movieid = request.getParameter("movieid");
		movieDTO movie = MovieService.getInstance().movieInfo(movieid);
		
		String genreName = RepGenreNmVO.convertGenreCodes(movie.getRepGenreNm());
		movie.setRepGenreNm(genreName);
		
		request.setAttribute("movie", movie);
		
		return new ModelAndView("movieInfo.jsp", false);
	}

}
