/**
 * 
 */
package com.project_Ma.home;

import java.util.List;

import com.project_Ma.home.VO.RewardVO;

/**
 * @author BIT3-11
 *
 */
public interface RewardService {
	//��ü���
	public List<RewardVO> allRewardList();
	//ķ���ο����� ���
	public List<RewardVO> allRewardList(int camNo);
	//���
	public int insertRewardList(RewardVO vo);
	//����
	public int updateRewardList(RewardVO vo);
	//����
	public int deleteRewardList(RewardVO vo);
}
