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
		WishlistVO vo = new WishlistVO();
		HttpSession session = req.getSession();
		int camNo = Integer.parseInt(req.getParameter("cam_no"));
		
		vo.setUserid((String) session.getAttribute("user_id"));
		vo.setCamNo(camNo);
		
		CamWishDAO dao = new CamWishDAO();
		int cnt = dao.insertCamWishlist(vo);
		
		req.setAttribute("cnt", cnt);
		req.setAttribute("cam_no", vo.getCamNo());
		
		return "/campaign/camWishOk.jsp";
	}

}
