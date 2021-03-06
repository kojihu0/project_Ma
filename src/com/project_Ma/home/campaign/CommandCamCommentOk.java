package com.project_Ma.home.campaign;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.CamDetailDAO;
import com.project_Ma.home.VO.CamCommentVO;

public class CommandCamCommentOk implements Command_Interface {

	public CommandCamCommentOk() {
	}

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		CamCommentVO vo = new CamCommentVO();
		HttpSession session = req.getSession();
		vo.setCamNo(Integer.parseInt(req.getParameter("cam_no")));
		vo.setUserid((String) session.getAttribute("user_id"));
		vo.setCommentContent(req.getParameter("comment_content"));
		if(req.getParameter("comment_ans")!=null && !req.getParameter("comment_ans").equals("") && req.getParameter("comment_ans").equals("answer")) {
			vo.setCommentParentNo(Integer.parseInt(req.getParameter("comment_parent_no")));
		}
		else {
			vo.setCommentParentNo(0);
		}
		CamDetailDAO dao = new CamDetailDAO();
		int cnt=dao.insertCamComment(vo);
		
		req.setAttribute("cnt", cnt);
		req.setAttribute("cam_no", vo.getCamNo());
		return "/campaign/camCommentOk.jsp";
	}

}
