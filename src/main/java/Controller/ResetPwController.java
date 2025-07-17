package Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import dto.userDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.UserService;
import views.ModelAndView;

public class ResetPwController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
        String id = request.getParameter("id");
        String passwd = request.getParameter("passwd");

        Map<String, Object> map = new HashMap<>();
        map.put("usersid", id);
        map.put("passwd", passwd);

        boolean isUpdated = UserService.getInstance().userPwUpdate(map);

        if (isUpdated) {
            request.getSession().setAttribute("okPwMsg", "비밀번호 변경을 완료했습니다. 다시 로그인해주세요.");
            return new ModelAndView("/index.jsp", true);
        } else {
            request.setAttribute("errorMsg", "비밀번호 변경에 실패했습니다. 다시 시도해주세요.");
            return new ModelAndView("/ResetPwView.jsp", false);
        }
	}

}
