package com.project_Ma.home.campaign;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.CampaignDAO;
import com.project_Ma.home.VO.CampaignVO;
import com.project_Ma.home.VO.PagingVO;

public class Command_ExCam implements Command_Interface {

	public Command_ExCam() {
		
	}

	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pageNumStr = request.getParameter("pageNum");
		PagingVO pageVO = new PagingVO();
		if(pageNumStr != null) {
			pageVO.setPageNum(Integer.parseInt(pageNumStr));
		}
		pageVO.setArrayKey(request.getParameter("arrayKey"));
		
		CampaignDAO dao = new CampaignDAO();
		
		pageVO.setTotalRecord(dao.getExTotalRecord(pageVO));
		
		List<CampaignVO> list = dao.exCampaigns(pageVO);
		
		request.setAttribute("list", list);
		request.setAttribute("pageVO", pageVO);
		
		return "/campaign/ex_Campaign.jsp";
	}

}
