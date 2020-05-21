package com.project_Ma.home.DAO;

import java.util.List;

import com.project_Ma.home.ConnectionDB;
import com.project_Ma.home.VO.CampaignVO;

public class campaignDAO extends ConnectionDB implements CampaignService{

	public campaignDAO() {
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
			System.out.println("캠페인선택 에러");
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}

	@Override
	public int insertCam(CampaignVO vo) {
		int result = 0;
		
		try {
			connDB();
			sql = "insert into campaign(cam_no, user_id, cam_title, cam_start, cam_end, goal_price, min_price, max_price, cam_img_path, cam_reward_status, cam_content, cam_desc, cam_regidate)"
					+ " values(cam_sq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
		} catch (Exception e) {
			System.out.println("캠페인 등록 에러");
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
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
