package Controller;

import java.io.IOException;
import java.util.List;

import dto.movieDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.MovieService;
import views.ModelAndView;

public class SearchPwViewController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {

		//비밀번호 찾기 화면만 전환. SearchPwView.jsp 

		//지우면안됨 검색할때필요(header)
		List<movieDTO> mlist = MovieService.getInstance().selectMovieTopList(20);
		request.setAttribute("mlist", mlist);
		//
		

		return new ModelAndView("SearchPwView.jsp", false);
	}

}
