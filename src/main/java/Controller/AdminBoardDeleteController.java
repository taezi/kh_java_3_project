package Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.BoardService;
import views.ModelAndView;

public class AdminBoardDeleteController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		String usersid = request.getParameter("usersid");
		
		System.out.println("🧪 전달된 bno: " + request.getParameter("bno"));
		System.out.println("🧪 전달된 usersid: " + request.getParameter("usersid"));
		
		Map<String, Object> map = new HashMap<>();
		map.put("bno", bno);
		map.put("usersid", usersid);
		
		BoardService.getInstance().AdminBoardDelete(map);
		
		return new ModelAndView("/Admin.do", true);
	}

}
