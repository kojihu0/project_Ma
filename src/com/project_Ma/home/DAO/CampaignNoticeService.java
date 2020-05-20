package com.project_Ma.home.DAO;

import java.util.List;

import com.project_Ma.home.VO.CamNoticeVO;

public interface CampaignNoticeService {
	//전체목록
	public List<CamNoticeVO> allCamNotice();
	//캠페인에 대한 목록
	public List<CamNoticeVO> allCamNotice(int camNo);
	//등록
	public int insertCam(CamNoticeVO vo);
	//수정
	public int updateCam(CamNoticeVO vo);
	//삭제
	public int deleteCam(CamNoticeVO vo);
}
