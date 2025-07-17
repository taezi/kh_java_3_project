package Controller;

import java.io.IOException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.BoardService;
import views.ModelAndView;

public class BoardDeleteController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));

		BoardService.getInstance().DeleteBoard(bno);

		return new ModelAndView("/AllBoard.do", true);
	}

}
