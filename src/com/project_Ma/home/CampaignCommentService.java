package com.project_Ma.home;

import java.util.List;

import com.project_Ma.home.VO.CamCommentVO;

public interface CampaignCommentService {
	//��ü���
	public List<CamCommentVO> camCommentList();
	
	public List<CamCommentVO> camCommentList(int camNo);
	//���
	public int insertCamComment(CamCommentVO vo);
	//����
	public int updateCamComment(CamCommentVO vo);
	//����
	public int deleteCamComment(CamCommentVO vo);
}
