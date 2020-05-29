package com.project_Ma.home.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.MemberDAO;
import com.project_Ma.home.VO.MemberVO;

public class Command_loginOk implements Command_Interface {
	MemberVO vo = new MemberVO();
	MemberDAO dao = new MemberDAO();
	public Command_loginOk() {
		
	}

	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		vo.setUser_id(request.getParameter("user_id"));
		vo.setUser_pw(request.getParameter("user_pw"));
		
		dao.memberLogin(vo);
	
		HttpSession session = request.getSession();
		session.setAttribute("user_name", vo.getUser_name());
		session.setAttribute("user_id", vo.getUser_id());
		session.setAttribute("loginStatus", vo.getLoginStatus());
		session.setAttribute("rank_code", vo.getRank_code());

		return "/login/loginOk.jsp";
	}

}
