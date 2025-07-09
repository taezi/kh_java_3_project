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

public class loginController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		ModelAndView view = null;
		String usersid = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("usersid", usersid);
		map.put("passwd", passwd);
		userDTO user = UserService.getInstance().userLogin(map);
		System.out.println(user);
		System.out.println(map);
		
		if(user == null) {
			view = new ModelAndView("/registerView.do", true);
			System.out.println("로그인 실패");
		}else {
			view = new ModelAndView("/index.jsp", true);
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			System.out.println(session);
			System.out.println("로그인 성공");
			System.out.println("세션 유저: " + session.getAttribute("user"));
		}
		
		return view;
	}

}
