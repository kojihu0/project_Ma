package com.project_Ma.home.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.MemberDAO;
import com.project_Ma.home.VO.MemberVO;

public class Command_FindPwOk implements Command_Interface {
	MemberVO vo = new MemberVO();
	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		vo.setUser_email_id(request.getParameter("user_email_id"));
		vo.setUser_email_domain(request.getParameter("user_email_domain"));
		vo.setUser_id(request.getParameter("user_id"));
		vo.setRank_code(Integer.parseInt(request.getParameter("member2")));

		MemberDAO dao = new MemberDAO();
		dao.getPwFind(vo);
		
		request.setAttribute("vo", vo);
		
		return "/login/find_PwOk.jsp";
	}

}
