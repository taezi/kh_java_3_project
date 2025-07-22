package Controller;

import java.io.IOException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dto.userDTO;
import service.UserService;
import views.ModelAndView; // 당신의 커스텀 ModelAndView 클래스

public class MyPageUpdateController implements Controller {

    
    private UserService userService = new UserService(); 

    @Override
    public ModelAndView execute(HttpServletResponse response, HttpServletRequest request) throws IOException {
        String subCommand = request.getParameter("command"); 

        System.out.println("DEBUG: MyPageUpdateController - Received subCommand: " + subCommand); 

        if ("checkNickname".equals(subCommand)) {
            return handleCheckNickname(request, response);
        } else if ("updateNickname".equals(subCommand)) {
            return handleUpdateNickname(request, response);
        } else {
           
            System.out.println("DEBUG: MyPageUpdateController - No specific subCommand. Forwarding to myPageView.jsp");
            return new ModelAndView("myPageView.jsp", false);
        }
    }

    private ModelAndView handleCheckNickname(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        String nickname = request.getParameter("nickname");

        StringBuilder jsonResponse = new StringBuilder();
        jsonResponse.append("{");

        if (nickname == null || nickname.trim().isEmpty()) {
            jsonResponse.append("\"isAvailable\": false,");
            jsonResponse.append("\"message\": \"닉네임을 입력해주세요.\"");
        } else {
            
            boolean isAvailable = userService.isNicknameAvailable(nickname.trim());
            jsonResponse.append("\"isAvailable\": ").append(isAvailable).append(",");
            if (isAvailable) {
                jsonResponse.append("\"message\": \"사용 가능한 닉네임입니다.\"");
            } else {
                jsonResponse.append("\"message\": \"이미 사용 중인 닉네임입니다.\"");
            }
        }
        jsonResponse.append("}");

        response.getWriter().write(jsonResponse.toString());
        return null; 
    }

    private ModelAndView handleUpdateNickname(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        userDTO currentUser = (userDTO) session.getAttribute("user");
        String newNickname = request.getParameter("newNickname");

        
        if (currentUser == null) {
            session.setAttribute("tempMsg", "로그인이 필요합니다.");
            session.setAttribute("tempMsgType", "error");
            return new ModelAndView("myPageView.jsp", true); 
        }

        
        if (newNickname == null || newNickname.trim().isEmpty()) {
            request.setAttribute("msg", "새 닉네임을 입력해주세요.");
            request.setAttribute("msgType", "error");
            return new ModelAndView("myPageView.jsp", false); 
        }
        newNickname = newNickname.trim();

        
        if (currentUser.getNickName().equals(newNickname)) {
            request.setAttribute("msg", "현재 닉네임과 동일합니다. 다른 닉네임을 입력해주세요.");
            request.setAttribute("msgType", "warning");
            return new ModelAndView("myPageView.jsp", false); 
        }

       
        if (!userService.isNicknameAvailable(newNickname)) {
            request.setAttribute("msg", "이미 사용 중인 닉네임입니다.");
            request.setAttribute("msgType", "error");
            return new ModelAndView("myPageView.jsp", false); 
        }

        
        userDTO userToUpdate = new userDTO();
        userToUpdate.setUsersid(currentUser.getUsersid()); 
        userToUpdate.setNickName(newNickname); 

        int result = userService.updateNickname(userToUpdate);

        if (result > 0) {
           
            currentUser.setNickName(newNickname);
            session.setAttribute("user", currentUser);

            session.setAttribute("tempMsg", "닉네임이 성공적으로 변경되었습니다.");
            session.setAttribute("tempMsgType", "success");
            
            return new ModelAndView("myPageView.jsp", false); 
        } else {
            request.setAttribute("msg", "닉네임 변경에 실패했습니다.");
            request.setAttribute("msgType", "error");
            return new ModelAndView("myPageView.jsp", false); 
        }
    }
}