package com.project_Ma.home.campaign;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project_Ma.home.Command_Interface;

public class CommandCamQnaOk implements Command_Interface {

	public CommandCamQnaOk() {
	}

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int camNo = Integer.parseInt(req.getParameter("cam_no"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		return "/campaign/camQnaOk.jsp";
	}

}
