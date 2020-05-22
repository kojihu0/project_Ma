package com.project_Ma.home.joinMembership;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project_Ma.home.Command_Interface;

public class Command_EmailCheck implements Command_Interface {

	public Command_EmailCheck() {
	}

	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sesId = request.getSession().getId();
		String emailCode = request.getParameter("user_email2");
		if(sesId.equals(emailCode)) {
			request.setAttribute("code", "yes");
			
		}
		return "/joinMembership/emailCode.jsp";
	}

}
