package Controller;

import java.io.IOException;
import java.util.List;

import dto.movieCommentDTO;
import dto.userDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.MovieService;
import service.UserService;
import views.ModelAndView;

public class AdminController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		List<movieCommentDTO> reportList = MovieService.getInstance().getReportList();
		
		request.setAttribute("reportList", reportList);
		
		List<userDTO> userList = UserService.getInstance().getAllUsers();
		request.setAttribute("userList", userList);


		return new ModelAndView("admin.jsp", false);
	}

}
