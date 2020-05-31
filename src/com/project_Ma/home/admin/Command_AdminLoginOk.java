package com.project_Ma.home.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.AdminDAO;
import com.project_Ma.home.VO.MemberVO;

public class Command_AdminLoginOk implements Command_Interface{

	public Command_AdminLoginOk() {
		
	}

	
	
	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("admin_id");
		String pw = request.getParameter("admin_pw");
		
		MemberVO mVo = new MemberVO();
		AdminDAO dao = new AdminDAO();
		
		String login = dao.loginCheck(id, pw);
		
		if(login == "Y") {
			HttpSession sess = request.getSession();
			sess.setAttribute("admin", "admin");
			sess.setAttribute("login", login);
			request.setAttribute("login", login);
		}else {
			HttpSession sess = request.getSession();
			sess.setAttribute("login", login);
			request.setAttribute("login", login);
		}
		return "/admin/admin_LoginOk.jsp";
	}
}
