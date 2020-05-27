package com.project_Ma.home.joinMembership;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.JoinMemberShipDAO;
import com.project_Ma.home.VO.MemberVO;

public class Command_JoinMembershipOk implements Command_Interface {

	public Command_JoinMembershipOk() {
	}

	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			MemberVO vo = new MemberVO();
			vo.setUser_id(request.getParameter("user_id"));
			vo.setUser_pw(request.getParameter("user_pw"));
			vo.setUser_name(request.getParameter("user_name"));
			vo.setUser_email(request.getParameter("user_email"));
			vo.setUser_tel(request.getParameter("user_tel"));
			
			JoinMemberShipDAO dao = new JoinMemberShipDAO();
			int cnt = dao.userInsert(vo);
			request.setAttribute("cnt", cnt);		
		
		return "/joinMembership/join_MemberShipOk.jsp";
	}

}
