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

public class Command_Copor_WishList implements Command_Interface {

	public Command_Copor_WishList() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession ses = request.getSession();
		CampaignSponVO vo = new CampaignSponVO();
		vo.setUser_id((String)ses.getAttribute("user_id"));
		CampaignListDAO dao = new CampaignListDAO();
		String user_id = (String) ses.getAttribute("user_id");
		List<CampaignSponVO> list = dao.coporWishList(user_id);
		request.setAttribute("list", list);
		return "/mypage/copor_WishList.jsp";
	}

}
