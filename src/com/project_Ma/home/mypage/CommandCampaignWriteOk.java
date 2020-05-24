package com.project_Ma.home.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.VO.CampaignVO;

public class CommandCampaignWriteOk implements Command_Interface {

	public CommandCampaignWriteOk() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String imgPath = req.getServletContext().getRealPath("/img/campaign");
		System.out.println(imgPath);
		
		CampaignVO vo = new CampaignVO();
		HttpSession session = req.getSession();
		vo.setUserid((String) session.getAttribute("user_id"));
		vo.setCamTitle(req.getParameter("cam_title"));
		vo.setCamStart(req.getParameter("cam_start"));
		vo.setCamEnd(req.getParameter("cam_end"));
		vo.setGoalPrice(Integer.parseInt(req.getParameter("goal_price")));
		vo.setMinPrice(Integer.parseInt(req.getParameter("min_price")));
		vo.setMaxPrice(Integer.parseInt(req.getParameter("max_price")));
		vo.setCamImgPath(req.getParameter("cam_img_path"));
		vo.setCamRewardStatus(Integer.parseInt(req.getParameter("cam_reward_status")));
		vo.setCamContent(req.getParameter("cam_content"));
		vo.setCamDesc(req.getParameter("cam_desc"));
		
		return "/mypage/campaignWriteOk";
	}

}
