package com.project_Ma.home.news;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.filters.SetCharacterEncodingFilter;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.MainNewsDAO;
import com.project_Ma.home.VO.MainQnAPageVO;
import com.project_Ma.home.VO.NewVO;

public class Command_Article implements Command_Interface {

	public Command_Article() {
		
	}
	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		List<NewVO>  list = new ArrayList<NewVO>();
		NewVO 		   vo = new NewVO();
		MainNewsDAO   dao = new MainNewsDAO();
		MainQnAPageVO pVo = new MainQnAPageVO();
		
		pVo.setOnePageRecord(10);
		pVo.setLastPageRecord(10);
		
		String pageNumStr = request.getParameter("pageNum");
		
		if(pageNumStr != null) {
			pVo.setPageNum(Integer.parseInt(pageNumStr));
		}else {
			pVo.setPageNum(1);
		}
		pVo.setTotalRecord(dao.getTotalRecord(pVo, 3));
		
		list = dao.selectAticle(pVo);
		
		System.out.println("뭐가 문제지?" + vo.getNews_date());
		
		request.setAttribute("list", list);
		request.setAttribute("pVo", pVo);
		
		return "/news/article.jsp";
	}

}
