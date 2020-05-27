package com.project_Ma.home.payment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.PaymentDAO;
import com.project_Ma.home.VO.RewardVO;

public class Command_PaymentProcessOk implements Command_Interface {
	RewardVO vo = new RewardVO();
	public Command_PaymentProcessOk() {
		
	}

	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		vo.setReward_no(Integer.parseInt(request.getParameter("reward_no")));
		
		PaymentDAO dao = new PaymentDAO();
		dao.payment(vo);
		
		request.setAttribute("vo", vo);
		
		return "/payment/paymentProcess.jsp";
	}

}
