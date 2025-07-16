package Controller;

import java.io.IOException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.BoardService;
import views.ModelAndView;

public class BoardCommentDeleteController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		int bcno = Integer.parseInt(request.getParameter("bcno"));
		int bno = Integer.parseInt(request.getParameter("bno")); // 되돌아갈 게시글 번호

		BoardService.getInstance().DeleteBoardComment(bcno);

		return new ModelAndView("/BoardView.do?bno=" + bno, true); // 리다이렉트
	}
}
