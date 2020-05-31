package com.project_Ma.home.campaign;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.CamDetailDAO;
import com.project_Ma.home.VO.CamNoticeVO;

public class CommandCamNoticeOk implements Command_Interface {

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		CamNoticeVO vo = new CamNoticeVO();
		HttpSession session = req.getSession();
		vo.setCamNo(Integer.parseInt(req.getParameter("cam_no")));
		vo.setCamNoticeTitle(req.getParameter("cam_notice_title"));
		vo.setCamNoticeContent(req.getParameter("cam_notice_content"));
		
		CamDetailDAO dao = new CamDetailDAO();
		int cnt = dao.insertCamNotice(vo);
		
		req.setAttribute("cnt", cnt);
		req.setAttribute("cam_no", vo.getCamNo());
		
		return "/campaign/camNoticeOk.jsp";
	}

}
