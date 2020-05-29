package com.project_Ma.home.DAO;

import java.util.ArrayList;
import java.util.List;

import com.project_Ma.home.ConnectionDB;
import com.project_Ma.home.RewardService;
import com.project_Ma.home.VO.RewardVO;

public class RewardDAO extends ConnectionDB implements RewardService {

	public RewardDAO() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<RewardVO> allRewardList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RewardVO> allRewardList(int camNo) {
		List<RewardVO> rewardList = new ArrayList<RewardVO>();
		try {
			connDB();
			sql = "select r2.reward_no, r2.cam_no, r2.reward_name, r2.reward_quantity, r2.reward_price, r2.reward_content,"
					+ " to_char(r2.delivery_ex_date, 'yyyy-mm'), r2.delivery_ex_date_detail, r2.delivery_price, cnt_donate"
					+ " from(select r.reward_no, count(p.user_id) cnt_donate"
					+ "   from reward r left outer join payment p"
					+ "   on r.reward_no=p.reward_no where r.cam_no=? group by p.reward_no, r.reward_no order by r.reward_no) r1, reward r2"
					+ " where r1.reward_no=r2.reward_no";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, camNo);
			result = pstmt.executeQuery();
			while(result.next()) {
				RewardVO vo = new RewardVO();
				vo.setReward_no(result.getInt(1));
				vo.setCam_no(result.getInt(2));
				vo.setReward_name(result.getString(3));
				vo.setReward_quantity(result.getInt(4));
				vo.setReward_price(result.getInt(5));
				vo.setReward_content(result.getString(6));
				vo.setDelivery_ex_date(result.getString(7));
				vo.setDelivery_ex_date_detail(result.getString(8));
				vo.setDelivery_price(result.getInt(9));
				vo.setDonateCnt(result.getInt(10));
				rewardList.add(vo);
			}
		} catch (Exception e) {
			System.out.println("리워드선택에러");
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return rewardList;
	}

	@Override
	public int insertRewardList(RewardVO vo) {
//		int result = 0;
//		try {
//			connDB();
//			sql = "insert into reward(reward_no, cam_no, reward_name, reward_quantity, reward_price, reward_content, delivery_ex_date, delivery_ex_date_detail, delivery_price)"
//					+ " values(reward_sq.nextval, ?, ?, ?, ?, ?, to_date(?, 'yyyy-mm'), ?, ?)";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, vo.getCamNo());
//			pstmt.setString(2, vo.getRewardName());
//			pstmt.setInt(3, vo.getRewardQuantity());
//			pstmt.setInt(4, vo.getRewardPrice());
//			pstmt.setString(5, vo.getRewardContent());
//			pstmt.setString(6, vo.getDeliveryExDate());
//			pstmt.setString(7, vo.getDeliveryExDateDetail());
//			pstmt.setInt(8, vo.getDeliveryPrice());
//			
//			result = pstmt.executeUpdate();
//		} catch (Exception e) {
//			System.out.println("리워드 등록 에러");
//			e.printStackTrace();
//		} finally {
//			closeDB();
//		}
		return 0;
	}

	@Override
	public int updateRewardList(RewardVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteRewardList(RewardVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
