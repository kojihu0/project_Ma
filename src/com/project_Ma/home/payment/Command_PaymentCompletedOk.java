package com.project_Ma.home.payment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.PaymentDAO;
import com.project_Ma.home.VO.PaymentVO;

public class Command_PaymentCompletedOk implements Command_Interface {
	PaymentVO vo = new PaymentVO();
	PaymentDAO dao = new PaymentDAO();
	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		vo.setFunding_price(Integer.parseInt(request.getParameter("funding_price")));
		if(request.getParameter("name_anonymous")==null) {
			vo.setName_anonymous(0);
		}else {
			vo.setName_anonymous(Integer.parseInt(request.getParameter("name_anonymous")));
		}
		if(request.getParameter("price_anonymous")==null) {
			vo.setPrice_anonymous(0);
		}else {
			vo.setPrice_anonymous(Integer.parseInt(request.getParameter("price_anonymous")));
		}
		if(request.getParameter("delivery_memo")==null || request.getParameter("delivery_memo")=="") {
			vo.setDelivery_memo("����");
		}else {
			vo.setDelivery_memo(request.getParameter("delivery_memo"));
		}
		vo.setReciever(request.getParameter("reciever"));
		vo.setId(request.getParameter("id"));
		vo.setDomain(request.getParameter("domain"));
		vo.setReward_phone1(request.getParameter("reward_phone1"));
		vo.setReward_phone2(request.getParameter("reward_phone2"));
		vo.setReward_addr_num(request.getParameter("reward_addr_num"));
		vo.setReward_addr_main(request.getParameter("reward_addr_main"));
		vo.setReward_addr_sub(request.getParameter("reward_addr_sub"));
		vo.setReward_tel1(request.getParameter("reward_tel1"));
		vo.setReward_tel2(request.getParameter("reward_tel2"));
		vo.setReward_tel3(request.getParameter("reward_tel3"));
		vo.setPayment_card_num(Integer.parseInt(request.getParameter("payment_card_num")));
		
		if(request.getParameter("mileage")==null || request.getParameter("mileage")=="") {
			vo.setMileage(0);
		}else {
			vo.setMileage(Integer.parseInt(request.getParameter("mileage")));
		}
		if(request.getParameter("add_price")==null || request.getParameter("add_price")=="") {
			vo.setAdd_price(0);
		}else{
			vo.setAdd_price(Integer.parseInt(request.getParameter("add_price")));
		}
		
		int result = dao.insertPayRecord(vo);
		request.setAttribute("result", result);
		request.setAttribute("vo", vo);
		return "/payment/paymentCompleted.jsp";
	}

}
