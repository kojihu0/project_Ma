package com.project_Ma.home;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command_Interface {
	public String processStart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}
