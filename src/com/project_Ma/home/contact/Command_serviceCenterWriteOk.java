package com.project_Ma.home.contact;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.MainQnADAO;
import com.project_Ma.home.VO.MainQnAPageVO;
import com.project_Ma.home.VO.MainQnAVO;

public class Command_serviceCenterWriteOk implements Command_Interface {

	public Command_serviceCenterWriteOk() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		MainQnAVO 		 vo  = new MainQnAVO(); 
		MainQnADAO 		dao  = new MainQnADAO();
		
		System.out.println("이건 뭐지" + request.getParameter("main_is_secret"));
		vo.setService_title(request.getParameter("main_qna_title"));
		String secret =  request.getParameter("main_is_secret");
		
		if(secret == null) { 
			vo.setService_secret(0);

			System.out.println("여기 왜 안와?"); 
		}else {
			vo.setService_secret(1);
		}
		System.out.println("시크릿 : "+vo.getService_secret());
		
		vo.setService_content(request.getParameter("main_qna_question"));
			
			
		//데이터 삽입.
		int result = dao.insertMainQnA(vo);
		request.setAttribute("vo", vo); 
		
		return "/contact/serviceCenter.jsp";
	}

}
