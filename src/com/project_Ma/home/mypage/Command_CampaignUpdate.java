package com.project_Ma.home.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.CamDetailDAO;
import com.project_Ma.home.DAO.CamWishDAO;
import com.project_Ma.home.DAO.RewardDAO;
import com.project_Ma.home.VO.CamCommentVO;
import com.project_Ma.home.VO.CamDetailVO;
import com.project_Ma.home.VO.CamNoticeVO;
import com.project_Ma.home.VO.CamQnaVO;
import com.project_Ma.home.VO.PaymentVO;
import com.project_Ma.home.VO.RewardVO;
import com.project_Ma.home.VO.WishlistVO;

public class Command_CampaignUpdate implements Command_Interface {

	public Command_CampaignUpdate() {
		
	}

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String currentUser = (String)session.getAttribute("user_id");
		
		CamDetailVO vo = new CamDetailVO();
		
		vo.setCamNo(Integer.parseInt(req.getParameter("cam_no")));
		int camNo = vo.getCamNo();
		CamDetailDAO dao = new CamDetailDAO();
		dao.selectCam(vo);
		List<CamNoticeVO> noticeLst = dao.camNoticeList(camNo);
		//List<PaymentVO> donatorLst = dao.camDonatorList(camNo);
		//List<CamCommentVO> commentLst = dao.camCommentList(camNo);
		List<CamQnaVO> qnaLst = dao.camQnaList(camNo);
		
		RewardDAO rdao = new RewardDAO();
		List<RewardVO> rwList = rdao.allRewardList(camNo);
		
		System.out.println(vo.getUserid());
		req.setAttribute("vo", vo); //캠페인정보
		req.setAttribute("rwList", rwList); //리워드정보
		req.setAttribute("noticeLst", noticeLst);//업데이트(공지사항)
		//req.setAttribute("donatorLst", donatorLst);//후원자목록
//		req.setAttribute("commentLst", commentLst); //응원글
		req.setAttribute("qnaLst", qnaLst); //질문답변
		
		return "/mypage/campaignUpdate.jsp";
	}

}
