package com.project_Ma.home.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project_Ma.home.Command_Interface;

public class CommandCampaignWriteOk implements Command_Interface {

	public CommandCampaignWriteOk() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return "/mypage/campaignWriteOk";
	}

}
