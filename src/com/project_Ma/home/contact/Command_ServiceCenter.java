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
		
		MainQnAPageVO 	pVo  = new MainQnAPageVO(); 
		MainQnADAO 		dao  = new MainQnADAO();
		
		//---페이지 번호 구하기.
		String pageNumStr = request.getParameter("pageNum"); 
		
		if(pageNumStr != null) {
			pVo.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		//--- 질문 리스트 받아오기.
		pVo.setTotalRecord(dao.getTotalRecord(pVo));
		List<MainQnAVO> selectAllList = dao.selectMainQnA(pVo);
		//---질문리스트, 답변 리스트, 서버에 세텡.
		request.setAttribute("selectAllList", selectAllList);
		request.setAttribute("pVo", pVo);
			
		return "/contact/serviceCenter.jsp";
	}

}
