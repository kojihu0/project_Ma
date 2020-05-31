package com.project_Ma.home.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.MainQnADAO;
import com.project_Ma.home.VO.MainQnAPageVO;
import com.project_Ma.home.VO.MainQnAVO;

public class Command_AdminServiceCenterAjax implements Command_Interface {

	public Command_AdminServiceCenterAjax() {
	
	}

	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
	   	MainQnAVO 		 vo  = new MainQnAVO();
		MainQnAPageVO 	pVo  = new MainQnAPageVO(); 
		MainQnADAO 		dao  = new MainQnADAO();
		
		
		pVo.setOnePageRecord(4);
		pVo.setLastPageRecord(4);
		 
		//---페이지 번호 구하기.
		String pageNumStr = request.getParameter("pageNum"); 
 
		System.out.println("admin_command_ajax pageNum=" + pageNumStr);
		  
		if(pageNumStr != null) {
			pVo.setPageNum(Integer.parseInt(pageNumStr));
		}else {
			pVo.setPageNum(1);
		} 
		 
		//세션 정보 받아오기.
		HttpSession ses = request.getSession();
		String logId = ((String)ses.getAttribute("user_id"));
		
		//--- 질문 리스트 받아오기. 
		pVo.setTotalRecord(dao.getTotalRecord(pVo));
		List<MainQnAVO> selectAllList = dao.selectMainQnA(pVo);
		
		//---질문리스트, 답변 리스트, 서버에 세텡.
		request.setAttribute("selectAllList", selectAllList);
		request.setAttribute("pVo", pVo);
		request.setAttribute("logId", logId);

		
		return "/admin/admin_QnA.jsp";
	}

}
