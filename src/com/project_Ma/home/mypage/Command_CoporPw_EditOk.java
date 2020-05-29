package com.project_Ma.home.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.MemberDataDAO;
import com.project_Ma.home.VO.MemberVO;

public class Command_CoporPw_EditOk implements Command_Interface {

	public Command_CoporPw_EditOk() {
	}

	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			MemberVO vo = new MemberVO();
			vo.setUser_id("user_id");
			vo.setUser_pw("user_pw");
			
			MemberDataDAO dao = new MemberDataDAO();
			int cnt = dao.userPwUpdate(vo);
			
			request.setAttribute("cnt", cnt);
		return "/mypage/copor_pwEditOk.jsp";
	}

}
