package com.project_Ma.home.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

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
				+ 	" (SELECT cam_no,"
				+ 	" cam_title,"
				+ 	" to_date(cam_start, 'YY-MM-DD') cam_start,"
				+ 	" to_date(cam_end, 'YY-MM-DD') cam_end,"
				+ 	" cam_img,"
				+ 	" (cam_end - SYSDATE) cam_remainDay,"
				+ 	" cam_goal_price"
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
				
				vo.setCam_goal_price(result.getInt(7));
				
				int total = selectTotalPrice(vo.getCam_no());
	
				vo.setTotal_price(total);
				
		
				System.out.println(vo.getTotal_price() + "=====================");
				System.out.println(vo.getTotal_price() + " : selectDeadLineCampaign");
				System.out.println(vo.getTotal_price() + " : totalPrice");
				System.out.println(vo.getCam_goal_price() + " : goalPrice");
				System.out.println(vo.getAchievement() + " : 뭐가 문제인 것?");
				System.out.println(vo.getTotal_price() + "=====================");
	
				
				list.add(vo);
			}
		}catch(Exception e) {
			System.out.println("데드라인 캠페인 선택에서 에러가 발생했습니다." + e.getMessage());
			e.getStackTrace();
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		return list;
	}
	
	
	public List<IndexVO> selectExpectOpenCampaign(){
		List<IndexVO> list = new ArrayList<IndexVO>();
		
		try {
			connDB();
			sql =  " SELECT * FROM"
				+ 	" (SELECT "
				+ 	"		cam_no,"
				+ 	"	 	cam_title,"
				+ 	" 		to_char(cam_start, 'YY-MM-DD') cam_start,"
				+ 	" 		to_char(cam_end, 'YY-MM-DD') cam_end,"
				+ 	" 		cam_img,"
				+ 	"		(cam_start - SYSDATE) cam_remainDay"
				+ 	" FROM campaign WHERE rownum <= 4 ORDER BY cam_start DESC"
				+ 	" )"
				+ " ORDER BY cam_start ASC";
			
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
				
			
				System.out.println(vo.getTotal_price() + "=====================");
				System.out.println(vo.getTotal_price() + " : selectExpectOpenCampaign");
				System.out.println(vo.getTotal_price() + " : totalPrice");
				System.out.println(vo.getCam_goal_price() + " : goalPrice");
				System.out.println(vo.getAchievement() + " : 뭐가 문제인 것?");
				System.out.println(vo.getTotal_price() + "=====================");
	
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
					+ "(SELECT "
					+ 	" cam_no,"
					+ 	" cam_title,"
					+ 	" to_char(cam_start, 'YY-MM-DD') cam_start,"
					+ 	" to_char(cam_end, 'YY-MM-DD') cam_end,"
					+ 	" cam_img,"
					+ 	" (cam_end - SYSDATE) cam_remainDay,"
					+ 	" cam_goal_price"
					+ " FROM campaign ORDER BY CAM_START DESC) "
					+"WHERE rownum <=3 ORDER BY cam_start DESC";
			
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
				vo.setCam_goal_price(result.getInt(7));
				
				int total = selectTotalPrice(vo.getCam_no());
				
				vo.setTotal_price(total);
				
	
				System.out.println(vo.getTotal_price() + "=====================");
				System.out.println(vo.getTotal_price() + " : selectCampaign");
				System.out.println(vo.getTotal_price() + " : totalPrice");
				System.out.println(vo.getCam_goal_price() + " : goalPrice");
				System.out.println(vo.getAchievement() + " : 뭐가 문제인 것?");
				System.out.println(vo.getTotal_price() + "=====================");
				 
				list.add(vo);
			}	
		}catch(Exception e) {
			System.out.println("selectCampaign에서 에러 발생" + e.getMessage());
			e.getStackTrace();
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return list;
	}
	 
	 public int selectTotalPrice(int no) {
		 
		 	Context 			context 	= null;
			Context 			envContext 	= null;
			DataSource 			ds 			= null;
			Connection 			conn 		= null;
			PreparedStatement 	pstmt 		= null;
			ResultSet 			result 		= null;
			String 				sql 		= "";
			
			int total = 0;
		 
			try { 
			 context 	= new InitialContext();
			 envContext 	= (Context)context.lookup("java:comp/env");
			 ds 		= (DataSource)envContext.lookup("jdbc/myOracle");
				
			 conn = ds.getConnection();
			
			
			 sql = "SELECT SUM(total_price) FROM payment WHERE cam_no = ?";
			 
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setInt(1, no);
			 result = pstmt.executeQuery();
			
			if(result.next()) {
				total = result.getInt(1);
			}

		}catch(Exception e) {
			System.out.println("후원금 총액 구하는 것에서 에러 발생" + e.getMessage());
			e.getStackTrace();
		}finally {
			try {
				if(result != null) result.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				
			}catch(Exception e) {
				System.out.println("데이터 베이스 연결 종료에서 에러 발생" + e.getMessage());
				e.getStackTrace();
			}
		}
		return total;
	}
	 
}//class end
