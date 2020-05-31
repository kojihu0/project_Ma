package com.project_Ma.home.news;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.MainNewsDAO;
import com.project_Ma.home.VO.LeadLagVO;
import com.project_Ma.home.VO.MainQnAPageVO;
import com.project_Ma.home.VO.NewVO;

public class Command_NewsContent implements Command_Interface {

	public Command_NewsContent() {
		
	}
	
	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		NewVO 			 nVo  = new NewVO();
		MainNewsDAO 	 dao  = new MainNewsDAO();
		MainQnAPageVO	 pVo  = new MainQnAPageVO();
		LeadLagVO        pnVo = new LeadLagVO();
		
		
		pVo.setOnePageRecord(10);
		pVo.setLastPageRecord(10);
		
		if(request.getParameter("pageNum") != null) {
			//페이지 정보
			pVo.setPageNum(Integer.parseInt(request.getParameter("pageNum")));
		}
		if(request.getParameter("news_category") != null) {
			//페이지 카테고리.
			nVo.setNews_category(Integer.parseInt(request.getParameter("news_category")));
		}
		//현재 뉴스 넘버를 불러오고
		nVo.setNews_no(Integer.parseInt(request.getParameter("news_no")));
		//해당 뉴스 정보를 대입하고.
		dao.selectOneRecord(nVo);
		//해당 뉴스에 들어가면 조회수 + 1하고.
		dao.updateCount(nVo.getNews_no());
		//이전 글, 다음글 정보. 
		pnVo = dao.leadLagSelect(nVo.getNews_no());
		
		request.setAttribute("nVo", nVo);
		request.setAttribute("pVo", pVo);
		request.setAttribute("pnVo", pnVo);
		
		return "/news/newsContent.jsp"; 
	}
}
