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
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
	    StringBuilder errorMessage = new StringBuilder();

	    
	    if (title == null || title.trim().isEmpty()) {
	        errorMessage.append("제목을 입력하세요.\\n");
	    }

	    
	    if (content == null || content.trim().isEmpty()) {
	        errorMessage.append("내용을 입력하세요.");
	    }

	   
	    if (errorMessage.length() > 0) {
	        response.setContentType("text/html; charset=UTF-8");
	        response.getWriter().write("<script>alert('" + errorMessage.toString() + "'); history.back();</script>");
	        return null;
	    }
		
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
