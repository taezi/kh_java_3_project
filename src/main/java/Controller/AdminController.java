package Controller;

import java.io.IOException;
import java.util.List;
import dto.movieDTO;
import dto.boardCommentDTO;
import dto.movieCommentDTO;
import dto.userDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.BoardService;
import service.MovieService;
import service.UserService;

import views.ModelAndView;

public class AdminController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {

		
		//지우면안됨 검색할때필요(header)
		List<movieDTO> mlist = MovieService.getInstance().selectMovieTopList(20);
		request.setAttribute("mlist", mlist);
		//

		List<movieCommentDTO> reportList = MovieService.getInstance().getReportList();
		
		request.setAttribute("reportList", reportList);
		
		List<userDTO> userList = UserService.getInstance().getAllUsers();
		request.setAttribute("userList", userList);
		
		List<boardCommentDTO> boardReportList = BoardService.getInstance().getReport();
		request.setAttribute("boardReportList", boardReportList);



		return new ModelAndView("admin.jsp", false);
	}

}
