package Controller;

import java.io.IOException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.BoardService;
import views.ModelAndView;

public class BoardUpdateController implements Controller {
	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		String titles = request.getParameter("titles");
		String bpost = request.getParameter("bpost");

		int result = BoardService.getInstance().BoardUpdate(bno, titles, bpost);

		response.setContentType("text/plain; charset=UTF-8");
		response.getWriter().println(result > 0 ? "success" : "fail");

		return null; // Ajax니까 JSP로 이동 안 함
	}
}