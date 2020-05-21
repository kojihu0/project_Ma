package com.project_Ma.home.DAO;

import java.util.List;

import com.project_Ma.home.VO.CamCommentVO;

public interface CampaignCommentService {
	//전체목록
	public List<CamCommentVO> camCommentList();
	
	public List<CamCommentVO> camCommentList(int camNo);
	//등록
	public int insertCamComment(CamCommentVO vo);
	//수정
	public int updateCamComment(CamCommentVO vo);
	//삭제
	public int deleteCamComment(CamCommentVO vo);
}
