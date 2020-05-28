package com.project_Ma.home.DAO;

import java.util.List;

import com.project_Ma.home.VO.CampaignSponVO;

public interface Command_CampaignList_Service {
	//후원 목록 
	public List<CampaignSponVO> CampaignSponList(String user_id);
	//위시리스트 
	public List<CampaignSponVO> CampaignWishList(String user_id);
	//위시리스트 삭제  
	public int CampaignWishListDel(CampaignSponVO vo);
	//캠페인 등록 리스트 
	public List<CampaignSponVO> campaignWriteList(String user_id);
	//캠페인 등록 정보 출력 
	public void campaignRecord(CampaignSponVO vo);
}
