package Controller;

import java.io.IOException;
import java.util.ArrayList;

import dto.boardDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.BoardService;
import views.ModelAndView;
import vo.PaggingVO;

public class AllBoardController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		/* 0712 페이징하는부분 추가함 */
		String page = request.getParameter("page");
		String contentEa = request.getParameter("contentEa");
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
		
		int count = BoardService.getInstance().SelectBoardTotalCount();
		PaggingVO pagging = new PaggingVO(count, pageNo, pageContentEa);
		/* 0712 페이징하는부분 여기까지임 */
		
		ArrayList<boardDTO> list = BoardService.getInstance().AllBoard(pageNo, pageContentEa); /* 0712 페이징하는부분 추가하면서 매개변수도 추가함 */
		
		request.setAttribute("list", list);
		
		return new ModelAndView("boardInfo.jsp", false);
	}

}
