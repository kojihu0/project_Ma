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
import com.project_Ma.home.VO.CampaignVO;
import com.project_Ma.home.VO.PagingVO;

public class CampaignDAO extends ConnectionDB{
	
	public List<CampaignVO> campaignAllRecord(PagingVO pageVO){
		List<CampaignVO> list =  new ArrayList<CampaignVO>();
		
		try {
			connDB();
			sql="select * from"
				+" (select * from "
				+" (select cam_img, cam_title, to_char(cam_end,'yyyy-mm-dd') cam_end, cam_no, round(cam_end - sysdate) cam_remainday, cam_goal_price"
				+" from campaign "; 
			
			if(pageVO.getArrayKey() != null) {
				sql += " order by "+pageVO.getArrayKey()+" desc)"
					+ " where rownum<=? order by "+pageVO.getArrayKey()+" asc) "
					+ " where rownum<=? order by "+pageVO.getArrayKey()+" desc";
			}else if(pageVO.getArrayKey() == null){
				sql += " order by cam_no desc) "
					+ " where rownum<=? order by cam_no asc) "
					+ " where rownum<=? order by cam_no desc";
			}
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pageVO.getPageNum() * pageVO.getOnePageRecord());
			
			if(pageVO.getPageNum()==pageVO.getTotalPage()) {//������������ �ϋ�
				pstmt.setInt(2, pageVO.getLastPageRecords());
			}else {
				pstmt.setInt(2, pageVO.getOnePageRecord());
			}
			result = pstmt.executeQuery();
			while(result.next()) {
				CampaignVO vo = new CampaignVO();
				vo.setCam_img(result.getString(1));
				vo.setCam_title(result.getString(2));
				vo.setCam_end(result.getString(3));
				vo.setCam_no(result.getInt(4));
				
				if(result.getInt(5)<=0) {
					vo.setCam_remainday(0);
				}else {
					vo.setCam_remainday(result.getInt(5));
				}
				vo.setCam_goal_price(result.getInt(6));
				
				int total= getpercent(vo.getCam_no());
				vo.setTotal_price(total);	
				list.add(vo);
			}
			
		}catch(Exception e) {
			System.out.println("전체 캠페인 리스트 에러...."+e.getMessage());
		}finally {
			closeDB();
		}
		return list;
	}
	
	public List<CampaignVO> exCampaigns(PagingVO pageVO){
		List<CampaignVO> list = new ArrayList<CampaignVO>();
		
		try {
			connDB();
			sql="select * from"
					+" (select * from "
					+" (select cam_img, cam_title, to_char(cam_end,'yyyy-mm-dd') cam_end, cam_no, round(cam_end - sysdate) cam_remainday, cam_goal_price"
					+" from campaign ";
					if(pageVO.getArrayKey() != null) {
						sql += " where (cam_start - sysdate)>0 order by "+pageVO.getArrayKey()+" desc)"
							+ " where rownum<=? order by " + pageVO.getArrayKey()+" asc) "
							+ " where rownum<=? order by " + pageVO.getArrayKey()+" desc";
					}else if(pageVO.getArrayKey() == null){
						sql += " where (cam_start - sysdate)>0 order by cam_no desc) "
							+" where rownum<=? order by cam_no asc) "
							+ " where rownum<=? order by cam_no desc";
					}
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, pageVO.getPageNum()*pageVO.getOnePageRecord());
				
				if(pageVO.getPageNum()==pageVO.getTotalPage()) {//������������ �ϋ�
					pstmt.setInt(2, pageVO.getLastPageRecords());
				}else {
					pstmt.setInt(2, pageVO.getOnePageRecord());
				}
				result = pstmt.executeQuery();
				while(result.next()) {
					CampaignVO vo = new CampaignVO();
					vo.setCam_img(result.getString(1));
					vo.setCam_title(result.getString(2));
					vo.setCam_end(result.getString(3));
					vo.setCam_no(result.getInt(4));
					if(result.getInt(5)<=0) {
						vo.setCam_remainday(0);
					}else {
						vo.setCam_remainday(result.getInt(5));
					}
					vo.setCam_goal_price(result.getInt(6));
					list.add(vo);
				}
		}catch(Exception e) {
			System.out.println("오픈예정 캠페인 리스트 에러....");
		}finally {
			closeDB();
		}
		return list;
	}
	
	public List<CampaignVO> preCampaigns(PagingVO pageVO){
		List<CampaignVO> list = new ArrayList<CampaignVO>();
		
		try {
			connDB();
			sql="select * from"
					+" (select * from "
					+" (select cam_img, cam_title, to_char(cam_end,'yyyy-mm-dd') cam_end, cam_no, round(cam_end - sysdate) cam_remainday, cam_goal_price"
					+" from campaign ";
					if(pageVO.getArrayKey() != null) {
						sql += " where (cam_end - sysdate)<0 order by "+pageVO.getArrayKey()+" desc)"
							+ " where reownum<=? order by "+pageVO.getArrayKey()+" asc)"
							+ " where reownum<=? order by "+pageVO.getArrayKey()+" desc";
					}else if(pageVO.getArrayKey() == null){
						sql += " where (cam_end - sysdate)<0 order by cam_no desc) "
							+" where rownum<=? order by cam_no asc) "
							+ " where rownum<=? order by cam_no desc";
					}
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, pageVO.getPageNum()*pageVO.getOnePageRecord());
				
				if(pageVO.getPageNum()==pageVO.getTotalPage()) {//������������ �ϋ�
					pstmt.setInt(2, pageVO.getLastPageRecords());
				}else {
					pstmt.setInt(2, pageVO.getOnePageRecord());
				}
				result = pstmt.executeQuery();
				while(result.next()) {
					CampaignVO vo = new CampaignVO();
					vo.setCam_img(result.getString(1));
					vo.setCam_title(result.getString(2));
					vo.setCam_end(result.getString(3));
					vo.setCam_no(result.getInt(4));
					if(result.getInt(5)<=0) {
						vo.setCam_remainday(0);
					}else {
						vo.setCam_remainday(result.getInt(5));
					}
					vo.setCam_goal_price(result.getInt(6));
					list.add(vo);
				}
		}catch(Exception e) {
			System.out.println("지난 캠페인 리스트 에러....");
		}finally {
			closeDB();
		}
		return list;
	}
	
	public int getTotalRecord(PagingVO pageVO) {
		int totalRecord=0;
		try {
			connDB();
			sql="select count(cam_no) from campaign";
			pstmt = conn.prepareStatement(sql);
			result = pstmt.executeQuery();
			
			if(result.next()) {
				totalRecord = result.getInt(1);
			}
		}catch(Exception e) {
			System.out.println("전체 레코드 수 구하기 에러...."+e.getMessage());
		}finally {
			closeDB();
		}
		return totalRecord;
	}
	
	public int getPreTotalRecord(PagingVO pageVO) {
		int preTotalRecord=0;
		try {
			connDB();
			sql="select count(cam_no) from campaign where round(cam_end - sysdate)<0";
			pstmt = conn.prepareStatement(sql);
			result = pstmt.executeQuery();
			
			if(result.next()) {
				preTotalRecord = result.getInt(1);
			}
		}catch(Exception e) {
			System.out.println("지난 레코드 수 구하기 에러...."+e.getMessage());
		}finally {
			closeDB();
		}
		return preTotalRecord;
	}
	
	public int getExTotalRecord(PagingVO pageVO) {
		int exTotalRecord=0;
		try {
			connDB();
			sql="select count(cam_no) from campaign where round(cam_start - sysdate)>0";
			pstmt = conn.prepareStatement(sql);
			result = pstmt.executeQuery();
			
			if(result.next()) {
				exTotalRecord = result.getInt(1);
			}
		}catch(Exception e) {
			System.out.println("오픈예정 레코드 수 구하기 에러...."+e.getMessage());
		}finally {
			closeDB();
		}
		return exTotalRecord;
	}
	
	public int getpercent(int cam_no) {
		
		 Connection 		conn 	= null;
		 PreparedStatement pstmt 	= null;
		 ResultSet 		result 	= null;
		 String 			sql 	= "";
		 int total=0;
		 
		try {
			Context context 	= new InitialContext();
			Context envContext 	= (Context)context.lookup("java:comp/env");
			DataSource ds 		= (DataSource)envContext.lookup("jdbc/myOracle");
			
			conn = ds.getConnection();
			
			sql="select sum(total_price) from payment where cam_no=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cam_no);
			result = pstmt.executeQuery();
			
			if(result.next()) {
				total=result.getInt(1);
			}
		}catch(Exception e) {
			System.out.println("데이터베이스 연결에서 에러 발생." + e.getMessage());
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
}
