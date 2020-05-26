package com.project_Ma.home.DAO;

import java.util.List;

import com.project_Ma.home.VO.CampaignSponVO;

public interface Command_CampaignList_Service {
	//펀딩목록 
	public List<CampaignSponVO> CampaignSponList(String user_id);
	
	//펀딩 위시리스트 
	public List<CampaignSponVO> CampaignWishList(String user_id);
	
}
