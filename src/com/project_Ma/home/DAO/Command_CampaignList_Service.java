package com.project_Ma.home.DAO;

import java.util.List;

import com.project_Ma.home.VO.CampaignSponVO;

public interface Command_CampaignList_Service {
	//�ݵ���� 
	public List<CampaignSponVO> CampaignSponList(String user_id);
	
	//�ݵ� ���ø���Ʈ 
	public List<CampaignSponVO> CampaignWishList(String user_id);
	
}
