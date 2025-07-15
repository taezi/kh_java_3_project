package Controller;

import java.io.IOException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import views.ModelAndView;

public class SearchIdController implements Controller {

	@Override
	public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
		// input에 입력한 이름과 별명을 불러와서 회원 목록에 검색한 후에 응답한다.
		return new ModelAndView("SearchId.jsp", false);
	}

}
