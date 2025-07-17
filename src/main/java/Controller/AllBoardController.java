package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import dto.boardDTO;
import dto.movieDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.BoardService;
import service.MovieService;
import views.ModelAndView;
import vo.PaggingVO;

public class AllBoardController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		/* 0712 페이징하는부분 추가함 */
		String page = request.getParameter("page");
		String contentEa = request.getParameter("contentEa");
		
		String query = request.getParameter("query"); //0717 검색어 받음
		
		int pageNo = 1;
		int pageContentEa = 30;
		
		try {
			if(page != null && !page.isEmpty())
				pageNo= Integer.parseInt(page);
			if(contentEa != null && !contentEa.isEmpty())
				pageContentEa = Integer.parseInt(contentEa);
		}catch (NumberFormatException e) {
			System.out.println("페이지 번호 및 게시글 개수가 숫자가 아닙니다.");
		} 
		
		int count = BoardService.getInstance().SelectBoardTotalCount(query); //0717검색어때매 매개변수 수정
		PaggingVO pagging = new PaggingVO(count, pageNo, pageContentEa);
		/* 0712 페이징하는부분 여기까지임 */
		
		ArrayList<boardDTO> list = BoardService.getInstance().AllBoard(pageNo, pageContentEa, query); /* 0712 페이징하는부분 추가하면서 매개변수도 추가함 */
																									//0717 검색어때매 매개변수 수정
		request.setAttribute("list", list);
		request.setAttribute("pagging", pagging);
		
		request.setAttribute("query", query);//0717 검색어 보냄

		//지우면안됨 검색할때필요(header)
		List<movieDTO> mlist = MovieService.getInstance().selectMovieTopList(20);
		request.setAttribute("mlist", mlist);
		//
		
		return new ModelAndView("boardInfo.jsp", false);
	}

}
