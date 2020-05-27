package com.project_Ma.home.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.MemberDataDAO;
import com.project_Ma.home.VO.MemberVO;

public class Command_User_EditOk implements Command_Interface {

	public Command_User_EditOk() {
		
	}

	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			MemberVO vo = new MemberVO();
			vo.setUser_name(request.getParameter("user_name"));
			vo.setUser_email(request.getParameter("user_email"));
			vo.setUser_tel(request.getParameter("user_tel"));
			vo.setAddr_no(request.getParameter("addr_no"));
			vo.setAddr_main(request.getParameter("addr_main"));
			vo.setAddr_sub(request.getParameter("addr_sub"));
			vo.setUser_id(request.getParameter("user_id"));
			
			MemberDataDAO dao = new MemberDataDAO();
			int cnt = dao.userDataUpdate(vo);
		
			request.setAttribute("cnt", cnt);
		return "/mypage/editOk.jsp";
	}

}
