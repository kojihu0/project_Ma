package com.project_Ma.home.DAO;

import java.sql.SQLException;
import java.sql.Savepoint;
import java.util.List;

import com.project_Ma.home.ConnectionDB;
import com.project_Ma.home.VO.CampaignVO;
import com.project_Ma.home.VO.RewardVO;

public class CampaignDAO extends ConnectionDB implements CampaignService{

	public CampaignDAO() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<CampaignVO> allCamList() {
		
		return null;
	}

	@Override
	public List<CampaignVO> allCamList(CampaignVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void selectCam(CampaignVO vo) {
		try {
			connDB();
			sql = "select cam_no, user_id, cam_title, to_char(cam_start, 'yyyy-mm-dd') cam_start, to_char(cam_end, 'yyyy-mm-dd') cam_end, cam_goal_price, cam_min_price, cam_max_price,"
					+ " cam_img, cam_reward_status, cam_content, cam_desc, cam_regi"
					+ " from campaign where cam_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getCamNo());
			result = pstmt.executeQuery();
			if(result.next()) {
				vo.setCamNo(result.getInt(1));
				vo.setUserid(result.getString(2));
				vo.setCamTitle(result.getString(3));
				vo.setCamStart(result.getString(4));
				vo.setCamEnd(result.getString(5));
				vo.setCamGoalPrice(result.getInt(6));
				vo.setCamMinPrice(result.getInt(7));
				vo.setCamMaxPrice(result.getInt(8));
				vo.setCamImg(result.getString(9));
				vo.setCamRewardStatus(result.getInt(10));
				vo.setCamContent(result.getString(11));
				vo.setCamDesc(result.getString(12));
				vo.setCamRegi(result.getString(13));
			}
			
		} catch (Exception e) {
			System.out.println("캠페인선택에러");
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}

	@Override
	public int insertCam(CampaignVO vo) {
		int cnt = 0;
		
		try {
			connDB();
			
			sql = "insert into campaign(cam_no, user_id, cam_title, cam_start, cam_end, cam_goal_price, cam_min_price, cam_max_price, "
					+ "cam_img, cam_reward_status, cam_content, cam_desc, cam_regi)"
					+ " values(cam_sq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getUserid());
			pstmt.setString(2, vo.getCamTitle());
			pstmt.setString(3, vo.getCamStart());
			pstmt.setString(4, vo.getCamEnd());
			pstmt.setInt(5, vo.getCamGoalPrice());
			pstmt.setInt(6, vo.getCamMinPrice());
			pstmt.setInt(7, vo.getCamMaxPrice());
			pstmt.setString(8, vo.getCamImg());
			pstmt.setInt(9, vo.getCamRewardStatus());
			pstmt.setString(10, vo.getCamContent());
			pstmt.setString(11, vo.getCamDesc());
			
			cnt = pstmt.executeUpdate();
			
			if(cnt>0) {
				sql = "select cam_sq.currval from campaign";
				pstmt = conn.prepareStatement(sql);
				result = pstmt.executeQuery(); 
				
				if(result.next()) {
					cnt = result.getInt(1);
				}
			}
		} catch (Exception e) {
			System.out.println("캠페인등록에러");
			e.printStackTrace();
		} finally {
			closeDB();
		}
		System.out.println("캠페인등록 cnt값");
		return cnt;
	}
	
	public int insertCam(CampaignVO vo, List<RewardVO> rwList) {
		int cnt = 0;
		
		try {
			connDB();
			conn.setAutoCommit(false);
			
			sql = "insert into campaign(cam_no, user_id, cam_title, cam_start, cam_end, cam_goal_price, cam_min_price, cam_max_price, "
					+ "cam_img, cam_reward_status, cam_content, cam_desc, cam_regi)"
					+ " values(cam_sq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getUserid());
			pstmt.setString(2, vo.getCamTitle());
			pstmt.setString(3, vo.getCamStart());
			pstmt.setString(4, vo.getCamEnd());
			pstmt.setInt(5, vo.getCamGoalPrice());
			pstmt.setInt(6, vo.getCamMinPrice());
			pstmt.setInt(7, vo.getCamMaxPrice());
			pstmt.setString(8, vo.getCamImg());
			pstmt.setInt(9, vo.getCamRewardStatus());
			pstmt.setString(10, vo.getCamContent());
			pstmt.setString(11, vo.getCamDesc());
			
			cnt = pstmt.executeUpdate();
			
			if(cnt>0) {
				sql = "select cam_sq.currval from campaign"; //현재 등록한 캠페인의 시퀀스
				pstmt = conn.prepareStatement(sql);
				result = pstmt.executeQuery(); 
				cnt = 0;
				
				if(result.next()) { //현재 등록한 캠페인의 시퀀스가 존재
					//리워드 등록
					for(RewardVO rvo:rwList) {
						sql = "insert into reward(reward_no, cam_no, reward_name, reward_quantity, reward_price, reward_content, delivery_ex_date, delivery_ex_date_detail, delivery_price)"
								+ " values(reward_sq.nextval, ?, ?, ?, ?, ?, to_date(?, 'yyyy-mm'), ?, ?)";
						
						pstmt = conn.prepareStatement(sql);
						
						pstmt.setInt(1, result.getInt(1));
						pstmt.setString(2, rvo.getRewardName());
						pstmt.setInt(3, rvo.getRewardQuantity());
						pstmt.setInt(4, rvo.getRewardPrice());
						pstmt.setString(5, rvo.getRewardContent());
						pstmt.setString(6, rvo.getDeliveryExDate());
						pstmt.setString(7, rvo.getDeliveryExDateDetail());
						pstmt.setInt(8, rvo.getDeliveryPrice());
						
						cnt += pstmt.executeUpdate();
					}
					System.out.println("등록한 리워드"+cnt);
					if(cnt == rwList.size()) { //모든 리워드 등록 성공 시 커밋
						conn.commit();
					}
				}
			}
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
				System.out.println("트랜잭션 처리중 롤백에러");
			}
			
			System.out.println("캠페인등록에러");
			e.printStackTrace();
		} finally {
			closeDB();
		}
		System.out.println("캠페인등록 cnt값");
		return cnt;
	}
	@Override
	public int updateCam(CampaignVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteCam(CampaignVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
