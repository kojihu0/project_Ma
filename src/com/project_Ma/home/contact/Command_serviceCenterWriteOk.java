package com.project_Ma.home.contact;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.MainQnADAO;
import com.project_Ma.home.VO.MainQnAPageVO;
import com.project_Ma.home.VO.MainQnAVO;

public class Command_serviceCenterWriteOk implements Command_Interface {

	public Command_serviceCenterWriteOk() {
		
	}

	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//charSet
		request.setCharacterEncoding("UTF-8");
		//VO, DAO
		MainQnAVO 		 vo  = new MainQnAVO(); 
		MainQnADAO 		dao  = new MainQnADAO();
		//vo에 글제목 저장, 비밀여부 설정.
		vo.setService_title(request.getParameter("main_qna_title"));
		String secret =  request.getParameter("main_is_secret");
		
		if(secret == null) { 
			vo.setService_secret(0);
		}else {
			vo.setService_secret(1);
		}
		//세션 정보 받아오기.
		HttpSession ses = request.getSession();
		vo.setUser_id((String)ses.getAttribute("user_id"));
		System.out.println("vo.getUserId == "  + vo.getUser_id());
				
		vo.setService_content(request.getParameter("main_qna_question"));

		//데이터 삽입.
		int result = dao.insertMainQnA(vo);
		request.setAttribute("vo", vo); 
		
		return "/contact/serviceCenter.jsp";
	}

}
