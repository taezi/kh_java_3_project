package Controller;

import java.io.IOException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.BoardService;
import views.ModelAndView;

public class BoardCommentUpdateController implements Controller {
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		int bcno = Integer.parseInt(request.getParameter("bcno"));
		String bcpost = request.getParameter("bcpost");

		BoardService.getInstance().UpdateBoardComment(bcno, bcpost);
		return null; // ajax는 응답 없음
	}
}