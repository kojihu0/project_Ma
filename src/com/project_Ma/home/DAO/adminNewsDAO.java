package com.project_Ma.home.DAO;

import com.project_Ma.home.ConnectionDB;
import com.project_Ma.home.VO.NewVO;

public class adminNewsDAO extends ConnectionDB{
	
	public adminNewsDAO() {
	}
	
 
	public int insertNews(int no, NewVO vo) {
		int num = 0;
		
		try {
		
			connDB();
			
			sql = "INSERT INTO main_news("
					+ " news_no,"
					+ " user_id,"
					+ " news_category, "
					+ " news_title, "
					+ " news_date,"
					+ " news_content, "
					+ " news_count ";
			if(vo.getNews_img() != null) {
				sql	+= " ,news_img";
			}
				sql += ")VALUES(";
					if(no == 1) {
						sql += " main_new_sq.nextval, ";
					}else if(no == 2) {
						sql += " main_event_sq.nextval, ";
					}else if(no == 3) {
						sql += " main_notice_sq.nextval, ";
					}
					sql += " 'admin', "
					+ " ?,"
					+ " ?,"
					+ " SYSDATE, "
					+ " ?,"
					+ " ? ";
					if(vo.getNews_img() != null) {
					sql += " ,? ";
					}
					sql +=  ")";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			pstmt.setString(2, vo.getNews_title());
			pstmt.setString(3, vo.getNews_content());
			pstmt.setInt(4, 0);
			
			if(vo.getNews_img() != null) {
				pstmt.setString(5, vo.getNews_img());
			}
			
			num = pstmt.executeUpdate();
			
			
			
		}catch(Exception e) {
			System.out.println("관리자 뉴스 등록에서 문제 발생 "+e.getMessage());
		}finally{
			
		}
		
		return num;
	}
	

}//class
