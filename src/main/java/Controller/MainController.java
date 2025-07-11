package Controller;

import java.io.IOException;
import java.util.List;

import dto.movieDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import service.MovieService;
import views.ModelAndView;

public class MainController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		// TODO Auto-generated method stub
		
		List<movieDTO> list = MovieService.getInstance().selectMovieTopList(20);
		request.setAttribute("list", list);
		
		
		return new ModelAndView("main.jsp", false);
	}

}
