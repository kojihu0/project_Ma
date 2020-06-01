package com.project_Ma.home;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project_Ma.home.DAO.IndexDAO;
import com.project_Ma.home.VO.IndexVO;
import com.project_Ma.home.VO.MemberVO;

public class Command_Index implements Command_Interface {
	
	IndexDAO 	  dao 		   = new IndexDAO();
	List<IndexVO> list		   = new ArrayList<IndexVO>();
	List<IndexVO> exOpenList   = new ArrayList<IndexVO>();
	List<IndexVO> deadLineList = new ArrayList<IndexVO>();
	
	MemberVO vo = new MemberVO();
	public Command_Index() {
		
	}
	@Override
	public String processStart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
 	
		//===========================================
		//mid_Div_Campaign -> 최근 3개의 캠페인 사진.
		list = dao.selectCampaign();
		//open예정인 캠페인 목록 가져오기.
		exOpenList = dao.selectExpectOpenCampaign();
		//남은 일수가 얼마 안남은 목록 가져오기.
		deadLineList = dao.selectDeadLineCampaign();
		//===========================================
		String kakaoLoginName = request.getParameter("user_id");
		if(kakaoLoginName != null && kakaoLoginName != "") {
				vo.setLoginStatus("Y");
				vo.setRank_code(1);
				HttpSession session = request.getSession();
				session.setAttribute("user_name", kakaoLoginName);
				session.setAttribute("loginStatus", vo.getLoginStatus());
				session.setAttribute("rank_code", vo.getRank_code());
		}
		String naverLoginName 	= request.getParameter("name");
		if(naverLoginName != null && naverLoginName != "") {
			vo.setLoginStatus("Y");
			vo.setRank_code(1);
			HttpSession session = request.getSession();
			
			session.setAttribute("user_name", naverLoginName);
			session.setAttribute("loginStatus", vo.getLoginStatus());
			session.setAttribute("rank_code", vo.getRank_code());
		}
		
		//===========================================
		
		//메인의 3가지 캠페인
		request.setAttribute("list", list);
		//메인의 오픈 예정 캠페인
		request.setAttribute("exOpenList", exOpenList);
		//메인의 마감 임박 캠페인
		request.setAttribute("deadLineList", deadLineList);
		
		return "index.jsp"; 
	}

}
