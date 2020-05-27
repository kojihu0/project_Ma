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

public class Command_serviceAjax implements Command_Interface {

	public Command_serviceAjax() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		   request.setCharacterEncoding("UTF-8");
			MainQnAVO 		 vo  = new MainQnAVO();
			MainQnAPageVO 	pVo  = new MainQnAPageVO(); 
			MainQnADAO 		dao  = new MainQnADAO();
			
			//---페이지 번호 구하기.
			String pageNumStr = request.getParameter("pageNum"); 
	 
			System.out.println("command_ajax pageNum=" + pageNumStr);
			  
			if(pageNumStr != null) {
				pVo.setPageNum(Integer.parseInt(pageNumStr));
			}else {
				pVo.setPageNum(1);
			} 
			 
			//--- 질문 리스트 받아오기.
			pVo.setTotalRecord(dao.getTotalRecord(pVo));
			List<MainQnAVO> selectAllList = dao.selectMainQnA(pVo);
			
			//---질문리스트, 답변 리스트, 서버에 세텡.
			request.setAttribute("selectAllList", selectAllList);
			request.setAttribute("pVo", pVo);
	
				
		return "/contact/mainQnA_page.jsp";
	}

}
