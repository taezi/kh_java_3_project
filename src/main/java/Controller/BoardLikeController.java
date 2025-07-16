package Controller;

import java.io.IOException;
import java.util.Map;

import org.json.JSONObject;

import dto.userDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.BoardService;
import views.ModelAndView;

public class BoardLikeController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		HttpSession session = request.getSession();
		userDTO member = (userDTO) session.getAttribute("user");
		JSONObject json = new JSONObject();
		
		
		if(member == null) {
			json.put("resultCode", 0);
			json.put("msg", "로그인 하셔야 이용하실 수 있습니다.");
			response.getWriter().println(json);
			return null;
		}
		
		try { 
			System.out.println("성공 : " + member.getUsersid());
			BoardService.getInstance().InsertBoardLike(bno, member.getUsersid());
			System.out.println("해당 게시글에 좋아요 하셨습니다.");
			json.put("resultCode", 1);
			json.put("msg", "해당 게시글에 좋아요 하셨습니다.");
		} catch (Exception e) { //insert에서 에러 발생 시
			//좋아요 취소
			System.out.println("취소 : " + member.getUsersid());
			BoardService.getInstance().DeleteBoardLike(bno, member.getUsersid());
			json.put("resultCode", 1);
			json.put("msg", "해당 게시글에 좋아요를 취소하셨습니다.");
		}finally { //무조건 실행
			Map<String, Object> map = BoardService.getInstance().SelectBoardLikeHateCount(bno);
			System.out.println(map);
			json.put("count", new JSONObject(map));
		}
		
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().println(json);
		return null;
	}

}
