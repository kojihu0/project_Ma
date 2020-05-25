package com.project_Ma.home.DAO;

import java.util.List;

import com.project_Ma.home.VO.CampaignVO;

public interface CampaignService {
	//��ü���
	public List<CampaignVO> allCamList();
	public List<CampaignVO> allCamList(CampaignVO vo);
	//1������
	public void selectCam(CampaignVO vo);
	//���
	public int insertCam(CampaignVO vo);
	//����
	public int updateCam(CampaignVO vo);
	//����
	public int deleteCam(CampaignVO vo);
}
