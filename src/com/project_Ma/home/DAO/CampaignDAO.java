package com.project_Ma.home.DAO;

import java.util.List;

import com.project_Ma.home.ConnectionDB;
import com.project_Ma.home.VO.CampaignVO;

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
	public void selectCam(int camNo) {
		try {
			connDB();
			sql = "select cam_no, user_id, cam_title, cam_start, cam_end, goal_price, min_price, max_price, cam_img_path, cam_reward_status, cam_content, cam_desc, cam_regidate"
					+ " from campaign where cam_no=?";
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
			sql = "insert into campaign(cam_no, user_id, cam_title, cam_start, cam_end, goal_price, min_price, max_price, "
					+ "cam_img_path, cam_reward_status, cam_content, cam_desc, cam_regidate)"
					+ " values(cam_sq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getUserid());
			pstmt.setString(2, vo.getCamTitle());
			pstmt.setString(3, vo.getCamStart());
			pstmt.setString(4, vo.getCamEnd());
			pstmt.setInt(5, vo.getGoalPrice());
			pstmt.setInt(6, vo.getMinPrice());
			pstmt.setInt(7, vo.getMaxPrice());
			pstmt.setString(8, vo.getCamImgPath());
			pstmt.setInt(9, vo.getCamRewardStatus());
			pstmt.setString(10, vo.getCamContent());
			pstmt.setString(11, vo.getCamDesc());
			
			cnt = pstmt.executeUpdate();
			
			if(cnt>0) {
				sql = "select cam_sq.currval cam_no from campaign";
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
