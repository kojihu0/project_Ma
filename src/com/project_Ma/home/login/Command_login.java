package com.project_Ma.home.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project_Ma.home.Command_Interface;

public class Command_login implements Command_Interface {

	public Command_login() {
	}

	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String logStart = request.getParameter("logStart");
		
		request.setAttribute("logStart", logStart);
		
		return "/login/login.jsp";
	}

}
