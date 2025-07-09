package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import views.ModelAndView;

import java.io.IOException;

import Controller.Controller;
import Controller.HandllerMapping;

@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	private String rootPath = "WEB-INF/views/";
	private static final long serialVersionUID = 1L;
       
    public DispatcherServlet() {    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int n = request.getRequestURI().lastIndexOf("/");
		String command = request.getRequestURI().substring(n + 1).replace(".do", "");
		System.out.println("커맨드:" + command);
		
		Controller controller = HandllerMapping.getInstance().createController(command);
		ModelAndView view = null;
		
		if(controller != null) {
			view = controller.execute(response, request);
		}
		
		if(view != null) {
			if(view.isRedirect()) {
				response.sendRedirect(request.getContextPath() + view.getPath());
			}else {
				request.getRequestDispatcher(rootPath + view.getPath()).forward(request, response);
			}
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
