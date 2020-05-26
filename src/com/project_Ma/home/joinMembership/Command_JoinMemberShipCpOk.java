package com.project_Ma.home.joinMembership;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.JoinMemberShipDAO;
import com.project_Ma.home.VO.MemberVO;

public class Command_JoinMemberShipCpOk implements Command_Interface {

	public Command_JoinMemberShipCpOk() {
	
	}

	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			MemberVO vo = new MemberVO();
			vo.setUser_id(request.getParameter("user_id"));
			vo.setUser_pw(request.getParameter("user_pw"));
			vo.setUser_name(request.getParameter("user_name"));
			vo.setCorpo_name(request.getParameter("corpo_name"));
			vo.setCorpo_regi_no(Integer.parseInt(request.getParameter("corpo_regi_no")));
			vo.setCorpo_no(Long.parseLong(request.getParameter("corpo_no")));
			vo.setUser_tel(request.getParameter("user_tel"));
			vo.setUser_email(request.getParameter("user_email"));
			
			JoinMemberShipDAO dao = new JoinMemberShipDAO();
			int cnt = dao.coporateInsert(vo);
			System.out.println(cnt);
		
			
			request.setAttribute("cnt", cnt);
		return "/joinMembership/join_MemberShipCpOk.jsp";
	}

}
