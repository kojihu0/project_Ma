package com.project_Ma.home.campaign;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project_Ma.home.Command_Interface;

public class CommandCamCommentOk implements Command_Interface {

	public CommandCamCommentOk() {
	}

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.getParameter("no");
		
		return "/campaign/camCommentOk.jsp";
	}

}
