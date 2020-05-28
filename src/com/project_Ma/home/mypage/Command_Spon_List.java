package com.project_Ma.home.mypage;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.CampaignListDAO;
import com.project_Ma.home.VO.CampaignSponVO;


public class Command_Spon_List implements Command_Interface {

	public Command_Spon_List() {
	}
	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession ses = request.getSession();
		CampaignSponVO vo = new CampaignSponVO();
		vo.setUser_id((String) ses.getAttribute("user_id"));
		CampaignListDAO dao = new CampaignListDAO();
		String user_id = (String)ses.getAttribute("user_id");
		System.out.println(user_id);
		List<CampaignSponVO> list = dao.CampaignSponList(user_id);
		System.out.println("!11111111111111111");
		request.setAttribute("list", list);
		return "/mypage/mypageSpon.jsp";
	}

}
