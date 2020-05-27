package com.project_Ma.home.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project_Ma.home.Command_Interface;

public class Command_logOut implements Command_Interface {
	
   public Command_logOut() {
      
   }

   @Override
   public String processStart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      HttpSession session = request.getSession();
      session.invalidate();
      return "/index.jsp";
   }

}