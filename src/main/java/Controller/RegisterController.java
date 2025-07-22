package Controller;

import java.io.IOException;
import java.util.List;

import dto.userDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.UserService;
import views.ModelAndView;

public class RegisterController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String username = request.getParameter("username");
		String nickname = request.getParameter("nickname");
		
		userDTO dto = new userDTO(id, passwd,  username, nickname);
			
		String script;
		try {
			UserService.getInstance().registerInsert(dto);
			//가입성공 알림창
			script = """
			<script>
			alert('회원가입이 완료되었습니다.');
			location.href='index.jsp';
			</script>
			""";
		} catch (Exception e) {
			//가입실패 - 중복 예외처리
			script = """
			<script>
            alert('이미 등록된 이메일입니다. 다른 이메일을 사용해주세요.');
            history.back();
            </script>
            """;
			}
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().write(script);
		//script 알림 추가후 중복되서 null로 처리 shin_07.16
		return null; //new ModelAndView("/index.jsp", true);
	}

}
