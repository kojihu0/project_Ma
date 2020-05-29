package com.project_Ma.home.payment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.PaymentDAO;
import com.project_Ma.home.VO.PaymentVO;

public class Command_PaymentProcess implements Command_Interface {

	public Command_PaymentProcess() {
	}

	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession ses = request.getSession();
		PaymentVO vo = new PaymentVO();
		vo.setUser_id((String) ses.getAttribute("user_id"));
		PaymentDAO dao = new PaymentDAO();
		int cnt = dao.mileageValue(vo);
		request.setAttribute("vo", vo);
		return "payment/paymentProcess.jsp"; 
	}

}
