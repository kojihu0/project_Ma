package com.project_Ma.home;

import java.util.List;

import com.project_Ma.home.VO.CampaignSponVO;

public interface Command_CampaignList_Service {
	//후원 목록 
	public List<CampaignSponVO> campaignSponList(String user_id);
	//위시리스트 
	public List<CampaignSponVO> campaignWishList(String user_id);
	//위시리스트 삭제  
	public int campaignWishListDel(CampaignSponVO vo);
	//캠페인 등록 리스트 
	public List<CampaignSponVO> campaignWriteList(String user_id);
	//캠페인 등록 정보 출력 
	public void campaignRecord(CampaignSponVO vo);
	
	public List<CampaignSponVO> coporWishList(String user_id);
	
	public int coporWishListDel(CampaignSponVO vo);
}
