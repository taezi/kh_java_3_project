package Controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;

import dto.boardCommentDTO;
import dto.boardDTO;
import dto.movieDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.BoardService;
import service.MovieService;
import views.ModelAndView;

public class BoardViewController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		
		HttpSession session = request.getSession();	//session : 사용자별로 데이터를 저장하는 공간
		HashSet<Integer> history = (HashSet<Integer>) session.getAttribute("history"); //"history" : 세션에 저장된 객체의 키(key), 이걸 꺼내면 Object 타입으로 리턴됨
																					    //history : 보통 "지금까지 본 글 번호들"을 저장하는 용도로 쓰임
		if(history == null) {														  
			history = new HashSet<Integer>();										   
			session.setAttribute("history", history);
		}
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		if(history.add(bno)) //HashSet타입.add() : 해당값이 없으면 넣고 true, 이미있으면 아무것도 안하고 false를 리턴함.
			BoardService.getInstance().UpdateBoardCount(bno);
		
		boardDTO board = BoardService.getInstance().BoardView(bno);
		List<boardCommentDTO> clist = BoardService.getInstance().BoardCommentView(bno, 1);
		
		request.setAttribute("board", board);
		request.setAttribute("clist", clist);
		
		//지우면안됨 검색할때필요(header)
		List<movieDTO> mlist = MovieService.getInstance().selectMovieTopList(20);
		request.setAttribute("mlist", mlist);
		//
		
		return new ModelAndView("boardView.jsp", false);
	}

}
