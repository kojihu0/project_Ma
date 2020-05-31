package com.project_Ma.home.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.MainNewsDAO;
import com.project_Ma.home.DAO.adminNewsDAO;
import com.project_Ma.home.VO.MainQnAPageVO;
import com.project_Ma.home.VO.NewVO;

public class Command_AdminNews implements Command_Interface {

	public Command_AdminNews() {
		
	}

	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
			request.setCharacterEncoding("UTF-8");
	
			List<NewVO> listNews    = new ArrayList<NewVO>();
			List<NewVO> listEvent   = new ArrayList<NewVO>();
			List<NewVO> listArticle = new ArrayList<NewVO>();
			
			NewVO 		 	 vo  = new NewVO();
			MainQnAPageVO	pVo  = new MainQnAPageVO();
			MainNewsDAO 	dao  = new MainNewsDAO();
			adminNewsDAO    aDao = new adminNewsDAO();
			
			pVo.setOnePageRecord(4);
			pVo.setLastPageRecord(4);
			
System.out.println("asdasdasd" + request.getParameter("regi")); 
			int num = 0;
			if(request.getParameter("regi") != null) {
				System.out.println("asdasd");
				int no = Integer.parseInt(request.getParameter("category"));
				vo.setNews_title(request.getParameter("title"));
				vo.setNews_category(Integer.parseInt(request.getParameter("category")));
				vo.setNews_content(request.getParameter("content"));
				
				System.out.println("no = "+ no);
				System.out.println("vo.getNews_title = "+ vo.getNews_title());
				System.out.println("vo.getNews_category = "+ vo.getNews_category());
				System.out.println("vo.getNews_content = "+ vo.getNews_content());
				
				
				num = aDao.insertNews(no, vo);			
			}
			String pageNumStr = request.getParameter("pageNum");
			
			if(pageNumStr != null) {
				pVo.setPageNum(Integer.parseInt(pageNumStr));
			}else {
				pVo.setPageNum(1);
			} 
			pVo.setTotalRecord(dao.getTotalRecord(pVo, 1));
			
			listNews 	= dao.selectNotice(pVo);
			listEvent 	= dao.selectEvent(pVo);
			listArticle = dao.selectAticle(pVo);
			
			request.setAttribute("listNews", listNews);
			request.setAttribute("listEvent", listEvent);
			request.setAttribute("listArticle", listArticle);

			request.setAttribute("pVo", pVo);
		
		
		
		return "/admin/admin_news.jsp";
	}

}
