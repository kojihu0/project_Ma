package com.project_Ma.home.DAO;

import java.util.ArrayList;
import java.util.List;

import com.project_Ma.home.ConnectionDB;
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
			sql = "select reward_no, cam_no, reward_name, reward_quantity, reward_price, reward_content,"
					+ " to_char(delivery_ex_date, 'yyyy-mm') delivery_ex_date, delivery_ex_date_detail, delivery_price"
					+ " from reward where cam_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, camNo);
			result = pstmt.executeQuery();
			while(result.next()) {
				RewardVO vo = new RewardVO();
				vo.setRewardNo(result.getInt(1));
				vo.setCamNo(result.getInt(2));
				vo.setRewardName(result.getString(3));
				vo.setRewardQuantity(result.getInt(4));
				vo.setRewardPrice(result.getInt(5));
				vo.setRewardContent(result.getString(6));
				vo.setDeliveryExDate(result.getString(7));
				vo.setDeliveryExDateDetail(result.getString(8));
				vo.setDeliveryPrice(result.getInt(9));
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
		int result = 0;
		try {
			connDB();
			sql = "insert into reward(reward_no, cam_no, reward_name, reward_quantity, reward_price, reward_content, delivery_ex_date, delivery_ex_date_detail, delivery_price)"
					+ " values(reward_sq.nextval, ?, ?, ?, ?, ?, to_date(?, 'yyyy-mm'), ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getCamNo());
			pstmt.setString(2, vo.getRewardName());
			pstmt.setInt(3, vo.getRewardQuantity());
			pstmt.setInt(4, vo.getRewardPrice());
			pstmt.setString(5, vo.getRewardContent());
			pstmt.setString(6, vo.getDeliveryExDate());
			pstmt.setString(7, vo.getDeliveryExDateDetail());
			pstmt.setInt(8, vo.getDeliveryPrice());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("리워드 등록 에러");
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return result;
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
