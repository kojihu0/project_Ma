package com.project_Ma.home.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project_Ma.home.Command_Interface;

public class Command_CampaignUpdate implements Command_Interface {

	public Command_CampaignUpdate() {
		
	}

	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		return "/mypage/campaignUpdate.jsp";
	}

}
