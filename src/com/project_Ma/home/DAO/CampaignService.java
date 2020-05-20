package com.project_Ma.home.DAO;

import java.util.List;

import com.project_Ma.home.VO.CampaignVO;

public interface CampaignService {
	//전체목록
	public List<CampaignVO> allCamList();
	public List<CampaignVO> allCamList(CampaignVO vo);
	//1개선택
	public void selectCam(CampaignVO vo);
	//등록
	public int insertCam(CampaignVO vo);
	//수정
	public int updateCam(CampaignVO vo);
	//삭제
	public int deleteCam(CampaignVO vo);
}
