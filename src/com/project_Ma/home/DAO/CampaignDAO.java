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
