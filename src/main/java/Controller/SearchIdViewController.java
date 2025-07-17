package Controller;

import java.io.IOException;
import java.util.List;

import dto.movieDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.MovieService;
import views.ModelAndView;

public class SearchIdViewController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		// login - SearchId(아이디찾기클릭후)
		return new ModelAndView("SearchIdView.jsp", false);
	}

}
