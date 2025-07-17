package Controller;

import java.io.IOException;
import java.util.List;

import dto.boardDTO;
import dto.movieDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.BoardService;
import service.MovieService;
import views.ModelAndView;

public class MainController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		// TODO Auto-generated method stub
		//지우면안됨 검색할때필요(header)
		List<movieDTO> mlist = MovieService.getInstance().selectMovieTopList(20);
		request.setAttribute("mlist", mlist);
		//
		List<boardDTO> blist = BoardService.getInstance().selectBoardTopList(10);
		request.setAttribute("blist", blist);
		
		return new ModelAndView("main.jsp", false);
	}

}
