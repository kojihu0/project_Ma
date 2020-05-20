/**
 * 
 */
package com.project_Ma.home.DAO;

import java.util.List;

import com.project_Ma.home.VO.RewardVO;

/**
 * @author BIT3-11
 *
 */
public interface RewardService {
	//전체목록
	public List<RewardVO> allRewardList();
	//캠페인에대한 목록
	public List<RewardVO> allRewardList(int camNo);
	//등록
	public int insertRewardList(RewardVO vo);
	//수정
	public int updateRewardList(RewardVO vo);
	//삭제
	public int deleteRewardList(RewardVO vo);
}
