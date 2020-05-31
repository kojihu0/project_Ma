package com.project_Ma.home.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.MainQnADAO;
import com.project_Ma.home.VO.MainQnAPageVO;
import com.project_Ma.home.VO.MainQnAVO;

public class Command_AdminServiceCenter implements Command_Interface {

	public Command_AdminServiceCenter() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MainQnAVO 		 vo = new MainQnAVO();
		MainQnAPageVO 	pVo = new MainQnAPageVO();
		MainQnADAO 		dao = new MainQnADAO();
	//=================
		request.setCharacterEncoding("UTF-8");
	//=================
	if(request.getParameter("qNo") != null) {
		int no = Integer.parseInt(request.getParameter("qNo"));
		dao.selectRecord(vo, no); 
		request.setAttribute("vo", vo);
	}
	//=================
	if(request.getParameter("answerContent") != null) {
		 vo.setService_content(request.getParameter("answerContent"));
		 vo.setService_parent_no(Integer.parseInt(request.getParameter("service_no")));
		int result = dao.insertAnswer(vo);
	
		System.out.println(result + " = 등록이 안되는 건가?");
		
	}
		return "/admin/admin_servicecenter.jsp";
	}

}
