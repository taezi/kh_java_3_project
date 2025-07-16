package Controller;

import java.io.IOException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.BoardService;
import views.ModelAndView;

import dto.userDTO;
import dto.boardCommentDTO;

public class BoardCommentInsertController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		String content = request.getParameter("content");
		userDTO member = (userDTO) request.getSession().getAttribute("user");
		String id = member.getUsersid();
				
		System.out.println(bno + " " + content + " " + id);
		
		boardCommentDTO comment = new boardCommentDTO();
		comment.setBno(bno); //comment.setBcno(bno);를 comment.setBno(bno); 이렇게 바꿨음
		comment.setBcpost(content);
		comment.setUsersId(id);
				
		BoardService.getInstance().BoardCommentInsert(comment);		
				
		return new ModelAndView("/BoardView.do?bno="+bno, true);
	}

}
