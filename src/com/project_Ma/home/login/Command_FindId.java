package com.project_Ma.home.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.MemberDAO;
import com.project_Ma.home.VO.MemberVO;

public class Command_FindId implements Command_Interface {
	MemberVO vo = new MemberVO();
	public Command_FindId() {
	}

	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		return "/login/find_Id.jsp"; 
	}

}
