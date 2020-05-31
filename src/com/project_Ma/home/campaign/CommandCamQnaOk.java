package com.project_Ma.home.campaign;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.CamDetailDAO;
import com.project_Ma.home.VO.CamQnaVO;

public class CommandCamQnaOk implements Command_Interface {

	public CommandCamQnaOk() {
	}

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		CamQnaVO vo = new CamQnaVO();
		HttpSession session = req.getSession();
		vo.setCamNo(Integer.parseInt(req.getParameter("cam_no")));
		vo.setUserid((String) session.getAttribute("user_id"));
		
		vo.setQnaContent(req.getParameter("qna_content"));
		if(req.getParameter("qna_secret")!=null && !req.getParameter("qna_secret").equals("")) {
			vo.setQnaSecret(Integer.parseInt(req.getParameter("qna_secret")));
		}
		else {
			vo.setQnaSecret(0);
		}
		if(req.getParameter("qna_ans")!=null && !req.getParameter("qna_ans").equals("") && req.getParameter("qna_ans").equals("answer")) {
			vo.setQnaTitle("답변");
			vo.setQnaParentNo(Integer.parseInt(req.getParameter("qna_parent_no")));
		}
		else {
			vo.setQnaTitle(req.getParameter("qna_title"));
			vo.setQnaParentNo(0);
		}
		CamDetailDAO dao = new CamDetailDAO();
		int cnt = dao.insertCamQna(vo);
		
		req.setAttribute("cnt", cnt);
		req.setAttribute("cam_no", vo.getCamNo());
		
		return "/campaign/camQnaOk.jsp";
	}

}
