package Controller;

import java.io.IOException;
import java.util.ArrayList;

import dto.boardDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.BoardService;
import views.ModelAndView;

public class AllBoardController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		ArrayList<boardDTO> list = BoardService.getInstance().AllBoard();
		
		request.setAttribute("list", list);
		
		return new ModelAndView("boardInfo.jsp", false);
	}

}
