package com.project_Ma.home.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.MemberDataDAO;
import com.project_Ma.home.VO.MemberVO;

public class Command_Copor_EditOk implements Command_Interface {

	public Command_Copor_EditOk() {
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
		vo.setCorpo_name(request.getParameter("corpo_name"));
		vo.setCorpo_no(Long.parseLong(request.getParameter("corpo_no")));
		vo.setCorpo_regi_no(Long.parseLong(request.getParameter("corpo_regi_no")));
		vo.setUser_id(request.getParameter("user_id"));
		
		MemberDataDAO dao = new MemberDataDAO();
		int cnt = dao.corpoDataUpdate(vo);
		request.setAttribute("cnt", cnt);
		return "/mypage/coporEditOk.jsp";
	}

}
