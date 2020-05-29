package com.project_Ma.home.DAO;

import java.util.ArrayList;
import java.util.List;

import com.project_Ma.home.Command_CampaignList_Service;
import com.project_Ma.home.ConnectionDB;
import com.project_Ma.home.VO.CamDetailVO;
import com.project_Ma.home.VO.CampaignSponVO;

public class CampaignListDAO extends ConnectionDB implements Command_CampaignList_Service {

	public CampaignListDAO() {
	}
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
			System.out.println("�Ŀ���� ���� --->"+e.getMessage());
		}finally {
			closeDB();
		}
		return list;
	}
	public List<CampaignSponVO> CampaignWishList(String user_id) {
		List<CampaignSponVO> list = new ArrayList<CampaignSponVO>();
		try {
			connDB();
			sql="select w.cam_no, c.cam_img, c.cam_title from user_wish w  join campaign c on w.cam_no = c.cam_no where w.user_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,user_id);
			result = pstmt.executeQuery();
			while(result.next()) {
				CampaignSponVO vo = new CampaignSponVO();
				vo.setCam_no(result.getInt(1));
				vo.setCam_img(result.getString(2));
				vo.setCam_title(result.getString(3));
				list.add(vo);
			}
		}catch (Exception e) {
			System.out.println("���ø���Ʈ ��� ���� -->"+e.getMessage());
		}finally {
			closeDB();
		}
		return list;
	}
	
	public int CampaignWishListDel(CampaignSponVO vo) {
		int cnt = 0;
		try {
			connDB();
			sql="delete from user_wish where cam_no=? and user_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,vo.getCam_no());
			pstmt.setString(2,vo.getUser_id());
			cnt=pstmt.executeUpdate();
		}catch(Exception e){
			System.out.println("���ø���Ʈ ��� ���� ���� --> "+e.getMessage());
		}finally {
			closeDB();
		}
		return cnt;
	}
	public List<CampaignSponVO> campaignWriteList(String user_id){
		List<CampaignSponVO> list = new ArrayList<CampaignSponVO>();
		try {
			connDB();
			sql="select cam_title,cam_desc,cam_start,cam_end,cam_goal_price,cam_img,cam_no "
					+ " from campaign where user_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,user_id);
			result = pstmt.executeQuery();
			while(result.next()) {
				CampaignSponVO vo = new CampaignSponVO();
				vo.setCam_title(result.getString(1));
				vo.setCam_desc(result.getString(2));
				vo.setCam_start(result.getString(3));
				vo.setCam_end(result.getString(4));
				vo.setCam_goal_price(result.getString(5));
				vo.setCam_img(result.getString(6));
				vo.setCam_no(result.getInt(7));
				list.add(vo);
			}
		}catch(Exception e){
			System.out.println("ķ���� ��� ��� ��� ���� -->"+e.getMessage());
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return list;
	}
	public void campaignRecord(CampaignSponVO vo) {
		try {
			connDB();
			sql="select cam_title,cam_content,cam_desc,cam_start,cam_end,cam_goal_price,cam_min_price,cam_max_price,cam_img,cam_no "
					+ "from campaign where user_id=? and cam_no=?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1,vo.getUser_id());
			pstmt.setInt(2,vo.getCam_no());
			result = pstmt.executeQuery();
			if(result.next()) {
				vo.setCam_title(result.getString(1));
				vo.setCam_content(result.getString(2));
				vo.setCam_desc(result.getString(3));
				vo.setCam_start(result.getString(4));
				vo.setCam_end(result.getString(5));
				vo.setCam_goal_price(result.getString(6));
				vo.setCam_min_price(result.getString(7));
				vo.setCam_max_price(result.getString(8));
				vo.setCam_img(result.getString(9));
				vo.setCam_no(result.getInt(10));
				
		
			}
		}catch (Exception e) {
			System.out.println("캠페인 정보 수정 에러-->"+e.getMessage());
			
		}finally {
			closeDB();
		}
	}
	
	public List<CamDetailVO> camCtrlList(String Userid){
		List<CamDetailVO> list = new ArrayList<CamDetailVO>();
		try {
			connDB();
			sql = "select cam_title,cam_desc,cam_start,cam_end,cam_goal_price,cam_img,cam_no "
					+ " from campaign where user_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, Userid);
			result = pstmt.executeQuery();
			while(result.next()) {
				CamDetailVO vo = new CamDetailVO();
				vo.setCamNo(result.getInt(1));
				vo.setCamTitle(result.getString(1));
				vo.setCamRegi(result.getString(2));
				vo.setCamStart(result.getString(3));
				vo.setCamEnd(result.getString(4));
				vo.setCamGoalPrice(result.getInt(5));
				vo.setCamImg(result.getString(6));
				list.add(vo);
			}
		}catch(Exception e){
			System.out.println("ķ���� ��� ��� ��� ���� -->"+e.getMessage());
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return list;
	}
}
