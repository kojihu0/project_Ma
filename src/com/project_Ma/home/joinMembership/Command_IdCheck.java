package com.project_Ma.home.joinMembership;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.JoinMemberShipDAO;

public class Command_IdCheck implements Command_Interface {

	public Command_IdCheck() {

	}

	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String user_id = request.getParameter("user_id");
			JoinMemberShipDAO dao = new JoinMemberShipDAO();
			int cnt = dao.idCheck(user_id);
					request.setAttribute("user_id", user_id);
			request.setAttribute("cnt",cnt);
		return "/joinMembership/idCheck.jsp";
	}

}
