package com.project_Ma.home.campaign;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.CamWishDAO;
import com.project_Ma.home.VO.WishlistVO;

public class CommandCamWishOk implements Command_Interface {

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		int camNo = Integer.parseInt(req.getParameter("cam_no"));
		String currentUser = (String) session.getAttribute("user_id");
		String action = req.getParameter("action");
		WishlistVO vo = new WishlistVO();
		vo.setUserid(currentUser);
		vo.setCamNo(camNo);
		
		CamWishDAO dao = new CamWishDAO();
		int cnt = 0;
		if(action.equals("add")) {
			cnt = dao.insertCamWishlist(vo);
		}
		else if(action.equals("delete")) {
			cnt = dao.deleteCamWishlist(vo);
		}
		
		req.setAttribute("action", action);
		req.setAttribute("cnt", cnt);
		req.setAttribute("cam_no", vo.getCamNo());
		
		return "/campaign/camWishOk.jsp";
	}

}
