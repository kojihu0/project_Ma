package com.project_Ma.home.DAO;

import java.util.ArrayList;
import java.util.List;

import com.project_Ma.home.ConnectionDB;
import com.project_Ma.home.VO.IndexVO;

public class IndexDAO extends ConnectionDB{

	public IndexDAO() {
		
	}
 	
	public List<IndexVO> selectDeadLineCampaign(){
		List<IndexVO> list = new ArrayList<IndexVO>();
		
		try {
			connDB();
			
			sql = "SELECT * FROM"
				+ " (SELECT cam_no, cam_title, to_date(cam_start, 'YY-MM-DD') cam_start,"
				+ " to_date(cam_end, 'YY-MM-DD') cam_end,"
				+ " cam_img,"
				+ " (cam_end - SYSDATE) cam_remainDay"
				+ " FROM campaign WHERE (cam_end - SYSDATE) <= 7"
				+ ") ORDER BY cam_end ASC";
			
			pstmt = conn.prepareStatement(sql);
			
			result = pstmt.executeQuery();
			
			while(result.next()) {
				IndexVO vo = new IndexVO();
				
				vo.setCam_no(result.getInt(1));
				vo.setCam_title(result.getString(2));
				vo.setCam_start(result.getString(3));
				vo.setCam_end(result.getString(4));
				vo.setCam_img_path(result.getString(5));				
				vo.setCam_remainDay(result.getInt(6));
				
				if(result.getInt(6) <= 0) {
					vo.setCam_remainDay(0);
				}
				
				System.out.println("cam_title : " + vo.getCam_title());
				System.out.println("cam_remainDay" + vo.getCam_remainDay());
				
				list.add(vo);
			}
		}catch(Exception e) {
			System.out.println("데드라인 캠페인 선택에서 에러가 발생했습니다." + e.getMessage());
			e.getStackTrace();
		}finally {
			closeDB();
		}
		
		return list;
	}
	
	
	public List<IndexVO> selectExpectOpenCampaign(){
		List<IndexVO> list = new ArrayList<IndexVO>();
		
		try {
			connDB();
			sql =  "SELECT * FROM"
				+ " (SELECT cam_no, cam_title, to_char(cam_start, 'YY-MM-DD') cam_start, to_char(cam_end, 'YY-MM-DD') cam_end,"
				+ " cam_img, (cam_start - SYSDATE) cam_remainDay  FROM campaign  WHERE rownum <= 4 ORDER BY cam_start DESC"
				+ " ) ORDER BY cam_start ASC";
			
			pstmt = conn.prepareStatement(sql);
			
			result = pstmt.executeQuery(); 
			
			while(result.next()) {
				IndexVO vo = new IndexVO();
				
				vo.setCam_no(result.getInt(1));
				vo.setCam_title(result.getString(2));
				vo.setCam_start(result.getString(3));
				vo.setCam_end(result.getString(4));
				vo.setCam_img_path(result.getString(5));	
				vo.setCam_remainDay(result.getInt(6)); 
					
				if(result.getInt(6) <= 0) {
					vo.setCam_remainDay(0);
				}
				
				System.out.println("cam_title : " + vo.getCam_title());
				
				list.add(vo);
			}
		}catch(Exception e) {
			System.out.println("오픈 예정 캠페인 셀렉트 하는 과정에서 문제가 생겼습니다" + e.getMessage());
			e.getStackTrace();
		}finally {
			closeDB();
		}
		return list;
	}
	
	 public List<IndexVO> selectCampaign() {
		 List<IndexVO> list = new ArrayList<IndexVO>();
		 try {
			connDB();
			
			sql = "SELECT * FROM"
					+ "(SELECT cam_no,"
					+ " cam_title, to_char(cam_start, 'YY-MM-DD') cam_start, to_char(cam_end, 'YY-MM-DD') cam_end,"
					+ " cam_img, (cam_end - SYSDATE) cam_remainDay  FROM campaign ORDER BY CAM_START DESC)"
					+ " WHERE rownum <=3 ORDER BY cam_start DESC";
			
			pstmt = conn.prepareStatement(sql);
			
			result = pstmt.executeQuery();
			
		
			while(result.next()) {
				
				IndexVO vo  = new IndexVO();
				
				vo.setCam_no(result.getInt(1));
				vo.setCam_title(result.getString(2));
				vo.setCam_start(result.getString(3));
				vo.setCam_end(result.getString(4));
				vo.setCam_img_path(result.getString(5));
				vo.setCam_remainDay(result.getInt(6)); 
			
				if(result.getInt(6) <= 0) {
					vo.setCam_remainDay(0);
				}
				
				System.out.println("cam_no : " + vo.getCam_no());
				System.out.println("cam_title : " + vo.getCam_title());
				System.out.println("cam_remainDay : " + vo.getCam_remainDay());
			
				list.add(vo);
			}	
		}catch(Exception e) {
			System.out.println("selectCampaign에서 에러 발생" + e.getMessage());
			e.getStackTrace();
		}finally {
			closeDB();
		}
		return list;
	}
}//class end
