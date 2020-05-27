package com.project_Ma.home.mypage;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.MemberDataDAO;
import com.project_Ma.home.VO.MemberVO;
public class Command_User_Edit implements Command_Interface {
	public Command_User_Edit() {
	}
	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			//세션의 아이디와 일치하는 정보 선택하여 뷰페이지 보낸다 
		HttpSession ses = request.getSession();
		
		MemberVO vo = new MemberVO();
		vo.setUser_id((String) ses.getAttribute("user_id"));
		MemberDataDAO dao = new MemberDataDAO();
		dao.userDataSelect(vo);
		request.setAttribute("vo", vo);
		
		return "/mypage/mypage.jsp";
	}

}
