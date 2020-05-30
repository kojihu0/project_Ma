package com.project_Ma.home.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.CampaignListDAO;
import com.project_Ma.home.VO.CampaignSponVO;

public class Command_Copor_WishList_Del implements Command_Interface {

	public Command_Copor_WishList_Del() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession ses = request.getSession();
		CampaignSponVO vo = new CampaignSponVO();
		vo.setUser_id((String)ses.getAttribute("user_id"));
		vo.setCam_no(Integer.parseInt(request.getParameter("cam_no")));
		System.out.println(vo.getCam_no());
		CampaignListDAO dao = new CampaignListDAO();
		
		int cnt = dao.coporWishListDel(vo);
		request.setAttribute("cnt",cnt);
		return "/mypage/copor_WishList_Del.jsp";
	}

}
