package com.project_Ma.home.joinMembership;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.JoinMemberShipDAO;

public class Command_Regi_no_Check implements Command_Interface {

	public Command_Regi_no_Check() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		long corpo_regi_no = Long.parseLong(request.getParameter("corpo_regi_no"));
				System.out.println(corpo_regi_no);
		JoinMemberShipDAO dao = new JoinMemberShipDAO();
		
		long cnt = dao.cpNumCheck(corpo_regi_no);
		System.out.println(cnt);
		request.setAttribute("corpo_regi_no", corpo_regi_no);
		request.setAttribute("cnt",cnt);
		return "/joinMembership/regi_no.jsp";
	}


}
