package Controller;

import java.io.IOException;
import java.util.ArrayList;

import dto.movieDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.MovieService;
import views.ModelAndView;
import vo.RepGenreNmVO;

public class AllMovieController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		ArrayList<movieDTO> list = MovieService.getInstance().AllMovie();
		
		for(movieDTO dto : list) {
			dto.setRepGenreNm(RepGenreNmVO.convertGenreCodes(dto.getRepGenreNm()));
		}
		
		request.setAttribute("list", list);
		
		return new ModelAndView("movieAllInfo.jsp", false);
	}

}
