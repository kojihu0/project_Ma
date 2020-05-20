package com.project_Ma.home.DAO;

import com.project_Ma.home.ConnectionDB;
import com.project_Ma.home.VO.IndexVO;

public class IndexDAO extends ConnectionDB{

	public IndexDAO() {
		
	}
	
	//selectCampaignNo start
	void selectCampaignNo(IndexVO vo) {
		try {
			connDB();
			
			sql = "SELECT cam_no, cam_start, cam_end, cam_img_path FROM campaign";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getCam_no()); 
			
			result = pstmt.executeQuery();
			
			if(result.next()) {	
				vo.setCam_no(result.getInt(1));
				vo.setCam_start(result.getString(2));
				vo.setCam_end(result.getString(3));
				vo.setCam_img_path(result.getString(4));
			}
		}catch(Exception e) {
			System.out.println("IndexDAO_selectCampaignNo에서 에러 발생." + e.getMessage());
			e.getStackTrace();
			
		}finally {
			closeDB();
		}
	}//selectCampaignNo end
	
	
}//class end
