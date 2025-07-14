package Controller;

import java.io.IOException;

import dto.boardDTO;
import dto.userDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.BoardService;
import views.ModelAndView;


public class BoardWriteController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		//title, content 파라미터롤 읽어옴
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		userDTO member = (userDTO) request.getSession().getAttribute("user");
		String id = member.getUsersid();
		System.out.println(title + "\n" + content + "\n" + id);
		
		//1. 글번호 뽑음
		int bno = BoardService.getInstance().selectBoardNo();
		//2. 게시판 테이블에 등록 작업
		boardDTO board = new boardDTO();
		board.setBno(bno);
		board.setTitles(title);
		board.setBpost(content);
		board.setUsersId(id);
		BoardService.getInstance().insertBoard(board);
		
		
		
		return new ModelAndView("/AllBoard.do", true);
	}

}
