package com.project_Ma.home.DAO;

import java.util.ArrayList;
import java.util.List;

import com.project_Ma.home.ConnectionDB;
import com.project_Ma.home.VO.CampaignSponVO;

public class CampaignListDAO extends ConnectionDB implements Command_CampaignList_Service {

	public CampaignListDAO() {
	}

	@Override
	public List<CampaignSponVO> CampaignSponList(String user_id) {
		List<CampaignSponVO> list = new ArrayList<CampaignSponVO>();
		try {
			connDB();
			sql="select c.cam_title,c.cam_desc,p.donate_date,p.funding_price,c.cam_img "
					+ " from campaign c join payment p on c.cam_no = p.cam_no WHERE p.user_id =?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1,user_id);
			result = pstmt.executeQuery();
			while(result.next()) {
				CampaignSponVO vo = new CampaignSponVO();
				vo.setCam_title(result.getString(1));
				vo.setCam_desc(result.getString(2));
				vo.setDonate_date(result.getString(3));
				vo.setFunding_price(result.getString(4));
				vo.setCam_img(result.getString(5));
				list.add(vo);
			}
		}catch (Exception e){
			System.out.println("후원목록 에러 --->"+e.getMessage());
		}finally {
			closeDB();
		}
		return list;
	}

	@Override
	public List<CampaignSponVO> CampaignWishList(String user_id) {
		List<CampaignSponVO> list = new ArrayList<CampaignSponVO>();
		try {
			connDB();
			sql="select c.cam_img, c.cam_title from user_wish w  join campaign c on w.cam_no = c.cam_no where w.user_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,user_id);
			result = pstmt.executeQuery();
			while(result.next()) {
				CampaignSponVO vo = new CampaignSponVO();
				vo.setCam_img(result.getString(1));
				vo.setCam_title(result.getString(2));
				list.add(vo);
			}
		}catch (Exception e) {
			System.out.println("위시리스트 목록 에러 --->"+e.getMessage());
		}finally {
			closeDB();
		}
		return list;
	}

}
