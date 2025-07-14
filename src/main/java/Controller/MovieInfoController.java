package Controller;

import java.io.IOException;
import java.util.List;

import dto.movieCommentDTO;
import dto.movieDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.MovieService;
import views.ModelAndView;
import vo.RepGenreNmVO;

public class MovieInfoController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		
		//영화 상세정보 넘기는 곳
		String movieid = request.getParameter("movieid");
		movieDTO movie = MovieService.getInstance().movieInfo(movieid);
		
		String genreName = RepGenreNmVO.convertGenreCodes(movie.getRepGenreNm());
		movie.setRepGenreNm(genreName);
		
		request.setAttribute("movie", movie);
		
		//영화 댓글 넘기는 곳
		List<movieCommentDTO> commentList = MovieService.getInstance().movieComment(movieid);
		request.setAttribute("commentList", commentList);
		
		return new ModelAndView("movieInfo.jsp", false);
		
	}

}
