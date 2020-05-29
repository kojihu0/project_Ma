package com.project_Ma.home.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.CampaignListDAO;
import com.project_Ma.home.VO.CamDetailVO;
import com.project_Ma.home.VO.CampaignSponVO;

public class Command_CampaignControlPage implements Command_Interface {

	public Command_CampaignControlPage() {
	
	}

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession ses = req.getSession();
		CampaignListDAO dao = new CampaignListDAO();
		List<CamDetailVO> list = dao.camCtrlList((String)ses.getAttribute("user_id"));
		req.setAttribute("list", list);
		return "/mypage/campaignControlPage.jsp";
	}

}
