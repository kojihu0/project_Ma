package com.project_Ma.home.campaign;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project_Ma.home.Command_Interface;
import com.project_Ma.home.DAO.CampaignDAO;
import com.project_Ma.home.DAO.MypageCamDAO;
import com.project_Ma.home.DAO.RewardDAO;
import com.project_Ma.home.VO.CamCommentVO;
import com.project_Ma.home.VO.CamNoticeVO;
import com.project_Ma.home.VO.CamQnaVO;
import com.project_Ma.home.VO.CampaignVO;
import com.project_Ma.home.VO.MypageCamVO;
import com.project_Ma.home.VO.PaymentVO;
import com.project_Ma.home.VO.RewardVO;

public class Command_DeCam implements Command_Interface {

	public Command_DeCam() {
		
	}

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		MypageCamVO vo = new MypageCamVO();
		
		vo.setCamNo(Integer.parseInt(req.getParameter("no")));
		int camNo = vo.getCamNo();
		MypageCamDAO dao = new MypageCamDAO();
		dao.selectCam(vo);
		//List<CamNoticeVO> noticeLst = dao.camNoticeList(camNo);
		//List<PaymentVO> donatorLst = dao.camDonatorList(camNo);
		List<CamCommentVO> commentLst = dao.camCommentList(camNo);
		//List<CamQnaVO> qnaLst = dao.camQnaList(camNo);
		
		RewardDAO rdao = new RewardDAO();
		List<RewardVO> rwList = rdao.allRewardList(camNo);
		System.out.println(vo.getUserid());
		req.setAttribute("vo", vo); //캠페인정보
		req.setAttribute("rwList", rwList); //리워드정보
		//req.setAttribute("noticeLst", noticeLst);//업데이트(공지사항)
		//req.setAttribute("donatorLst", donatorLst);//후원자목록
		req.setAttribute("commentLst", commentLst); //응원글
		//req.setAttribute("qnaLst", qnaLst); //질문답변
		return "/campaign/detail_Campaign.jsp";
	}

}
