package Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import dto.userDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.UserService;
import views.ModelAndView;

public class SearchIdController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		// input에 입력한 이름과 별명을 불러와서 회원 목록에 검색한 후에 응답한다.
		// 데이터베이스 조회)을 수행, 매퍼(Mapper)**를 통해 데이터베이스에 접근하여 username과 nickname이 모두 일치하는 사용자가 있는지 쿼리
		String username = request.getParameter("username");
		String nickname = request.getParameter("nickname");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("username", username);
		map.put("nickname", nickname);
		userDTO user = UserService.getInstance().searchId(map);
		System.out.println(user); //확인용 - 확인후 주석예정
		System.out.println(map);	//확인용 - 확인후 주석예정
		//HttpSession session = request.getSession();
		
		if (user != null) {
			request.setAttribute("okIdMsg", "회원님의 아이디는 " + user.getUsersid() + " 입니다.");
			//다른방법: request.setAttribute("foundUserId", user.getUserid());
		}else {
			request.setAttribute("errorMsg", "입력하신 이름과 별명에 해당하는 아이디가 없습니다.");
		}
		
		return new ModelAndView("SearchId.jsp", false);
	}

}
