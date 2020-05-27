package com.project_Ma.home.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.MemberDataDAO;
import com.project_Ma.home.VO.MemberVO;

public class Command_Copor_DelOk implements Command_Interface {

	public Command_Copor_DelOk() {
	}

	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			MemberVO vo = new MemberVO();
			vo.setUser_name(request.getParameter("user_name"));
			vo.setUser_id(request.getParameter("user_id"));
			vo.setUser_pw(request.getParameter("user_pw"));
			
			MemberDataDAO dao = new MemberDataDAO();
			int cnt = dao.corpoDataDelete(vo);
			
			request.setAttribute("cnt", cnt);
			
			return "/mypage/user_del.jsp";
	}

}
