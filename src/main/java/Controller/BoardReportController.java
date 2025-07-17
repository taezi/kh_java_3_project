package Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.BoardService;
import service.MovieService;
import views.ModelAndView;

public class BoardReportController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		String usersid = request.getParameter("usersid");
		
		

		Map<String, Object> map = new HashMap<>();
		map.put("usersid", usersid);
		map.put("bno", bno);

		BoardService.getInstance().boardReportPlus(map);

		
		return null;
	}

}
