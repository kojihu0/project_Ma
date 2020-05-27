package com.project_Ma.home.payment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.VO.PaymentVO;

public class Command_PaymentAPI implements Command_Interface {
	PaymentVO vo = new PaymentVO();
	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		vo.setId(request.getParameter("id"));
		vo.setDomain(request.getParameter("domain"));
		vo.setReward_phone1(request.getParameter("phone1"));
		vo.setReward_phone2(request.getParameter("phone2"));
		vo.setReward_addr_num(request.getParameter("reward_addr_num"));
		vo.setReward_addr_main(request.getParameter("reward_addr_main"));
		vo.setReward_addr_sub(request.getParameter("reward_addr_sub"));
		
		request.setAttribute("vo", vo);
		return "/payment/paymentAPI.jsp";
	}

}
