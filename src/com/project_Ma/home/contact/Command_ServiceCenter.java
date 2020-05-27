package com.project_Ma.home.contact;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.MainQnADAO;
import com.project_Ma.home.VO.MainQnAPageVO;
import com.project_Ma.home.VO.MainQnAVO;

public class Command_ServiceCenter implements Command_Interface {

	public Command_ServiceCenter() {
		
	}
	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	    request.setCharacterEncoding("UTF-8");
		
	
			
		return "/contact/serviceCenter.jsp";
	}

}
