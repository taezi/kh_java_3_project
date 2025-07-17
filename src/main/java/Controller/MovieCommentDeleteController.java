package Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.MovieService;
import views.ModelAndView;

public class MovieCommentDeleteController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		int mcno = Integer.parseInt(request.getParameter("mcno"));
		String usersid = request.getParameter("usersid");
		String movieid = request.getParameter("movieid");
		
	    Map<String, Object> map = new HashMap<>();
	    map.put("mcno", mcno);
	    map.put("usersid", usersid);
	    map.put("movieid", movieid);

		MovieService.getInstance().CommentMovieDelete(map);

		return new ModelAndView("/Admin.do", true);
	}

}
