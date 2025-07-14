package Controller;

import java.io.IOException;

import dto.movieCommentDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.MovieService;
import views.ModelAndView;

public class movieCommentWriteController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String movieid = request.getParameter("movieid");
		String usersid = request.getParameter("usersid");
		String mpost = request.getParameter("mpost");
		
		movieCommentDTO comment = new movieCommentDTO();
		comment.setMovieid(movieid);
		comment.setUsersid(usersid);
		comment.setMpost(mpost);
		
		MovieService.getInstance().insertComment(comment);
		
		return new ModelAndView("/movieinfo.do?movieid=" + movieid, true);
	}

}
