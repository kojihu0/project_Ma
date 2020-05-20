package com.project_Ma.home;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Command_Index implements Command_Interface {
	
	public Command_Index() {
		
	}
	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		return "index.jsp"; 
	}

}
