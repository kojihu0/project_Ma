package com.project_Ma.home.campaign;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.CampaignDAO;
import com.project_Ma.home.DAO.RewardDAO;
import com.project_Ma.home.VO.CampaignVO;
import com.project_Ma.home.VO.RewardVO;

public class Command_DeCam implements Command_Interface {

	public Command_DeCam() {
		
	}

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		CampaignVO vo = new CampaignVO();
		RewardVO rvo = new RewardVO();
		
		vo.setCamNo(Integer.parseInt(req.getParameter("no")));
		
		CampaignDAO dao = new CampaignDAO();
		dao.selectCam(vo);
		
		RewardDAO rdao = new RewardDAO();
		List<RewardVO> rwList = rdao.allRewardList(vo.getCamNo());
		
		req.setAttribute("vo", vo);
		req.setAttribute("rwList", rwList);
		return "/campaign/detail_Campaign.jsp";
	}

}
