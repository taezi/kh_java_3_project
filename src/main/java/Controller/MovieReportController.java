package Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.MovieService;
import views.ModelAndView;

public class MovieReportController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String usersid = request.getParameter("usersid");
		String movieid = request.getParameter("movieid");
		
		System.out.println("신고 요청 ▶ usersid: " + usersid + ", movieid: " + movieid);
		
		Map<String, String> map = new HashMap<>();
		map.put("usersid", usersid);
		map.put("movieid", movieid);
		MovieService.getInstance().movieReportPlus(map);
		
		return null;
	}

}
