package com.project_Ma.home.payment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project_Ma.home.Command_Interface;

public class Command_PaymentCompleted implements Command_Interface {

	public Command_PaymentCompleted() {
		
	}

	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		return "/payment/paymentCompleted.jsp";
	}

}
