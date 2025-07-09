package Controller;

import java.io.IOException;
import java.util.List;

import dto.userDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.UserService;
import views.ModelAndView;

public class registerController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String username = request.getParameter("username");
		String nickname = request.getParameter("nickname");
		
		userDTO dto = new userDTO(id, passwd, username, nickname);
		
		UserService.getInstance().registerInsert(dto);
		return new ModelAndView("/index.jsp", true);
	}

}
