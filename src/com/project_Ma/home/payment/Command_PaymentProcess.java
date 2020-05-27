package com.project_Ma.home.payment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.VO.CampaignVO;
import com.project_Ma.home.VO.RewardVO;

public class Command_PaymentProcess implements Command_Interface {
	CampaignVO cvo = new CampaignVO();
	RewardVO rvo = new RewardVO(); 
	public Command_PaymentProcess() {
	}

	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		cvo.setCam_reward_status(Integer.parseInt("reward_status"));
		rvo.setReward_no(Integer.parseInt("reward_no"));
		
		request.setAttribute("cvo", cvo);
		request.setAttribute("rvo", rvo);
		return "payment/paymentProcess.jsp"; 
	}

}
