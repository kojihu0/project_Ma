package com.project_Ma.home.payment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.PaymentDAO;
import com.project_Ma.home.VO.CampaignVO;
import com.project_Ma.home.VO.PaymentVO;


public class Command_PaymentProcess implements Command_Interface {
	CampaignVO cvo = new CampaignVO();
	PaymentVO vo = new PaymentVO();
	PaymentDAO dao = new PaymentDAO();
	public Command_PaymentProcess() {
	}

	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		cvo.setCam_reward_status(Integer.parseInt("reward_status"));
		cvo.setCam_no(Integer.parseInt("camNo"));
		vo.setReward_no(Integer.parseInt("reward_no"));
		HttpSession session = request.getSession();
		
		vo.setUser_id((String)session.getAttribute("user_id"));
		dao.getFundingPrice(vo);
		
		request.setAttribute("cvo", cvo);
		request.setAttribute("vo", vo);
		return "payment/paymentProcess.jsp"; 
	}

}
