package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
		
		//지우면안됨 검색할때필요(header)
		List<movieDTO> mlist = MovieService.getInstance().selectMovieTopList(20);
		request.setAttribute("mlist", mlist);
		//
		
		return new ModelAndView("movieAllInfo.jsp", false);
	}

}
