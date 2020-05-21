package com.project_Ma.home.DAO;

import java.util.List;

import com.project_Ma.home.VO.CamNoticeVO;

public interface CampaignNoticeService {
	//��ü���
	public List<CamNoticeVO> allCamNotice();
	//ķ���ο� ���� ���
	public List<CamNoticeVO> allCamNotice(int camNo);
	//���
	public int insertCam(CamNoticeVO vo);
	//����
	public int updateCam(CamNoticeVO vo);
	//����
	public int deleteCam(CamNoticeVO vo);
}
