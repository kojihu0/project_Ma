package com.project_Ma.home.DAO;

import java.util.ArrayList;
import java.util.List;

import com.project_Ma.home.ConnectionDB;
import com.project_Ma.home.VO.LeadLagVO;
import com.project_Ma.home.VO.MainQnAPageVO;
import com.project_Ma.home.VO.MainQnAVO;
import com.project_Ma.home.VO.NewVO;

public class MainNewsDAO extends ConnectionDB{

	public MainNewsDAO() {
	}
	
	
	public List<NewVO> selectNotice(MainQnAPageVO pVo) {
		List<NewVO> list = new ArrayList<NewVO>();
		try { 
			connDB();	
			sql = "SELECT * FROM"
					+ "(SELECT * FROM("
						+ "SELECT "
							+ " news_no,"
							+ " user_id,"
							+ " news_category,"
							+ " news_title,"
							+ " news_date,"
							+ " news_content,"
							+ " news_count,"
							+ " news_img"
						+ " FROM main_news" 
						+ " WHERE news_category = 1 ORDER BY news_no DESC)"
					+ " WHERE rownum <= ? ORDER BY news_no ASC)"
				+ " WHERE rownum <= ? ORDER BY news_no DESC";
			
			pstmt = conn.prepareStatement(sql);		
			
			pstmt.setInt(1, pVo.getPageNum() * pVo.getOnePageRecord());
			
			if(pVo.getPageNum() == pVo.getTotalPage()) {
				pstmt.setInt(2, pVo.getLastPageRecord());
			}else {
				pstmt.setInt(2, pVo.getOnePageRecord());
			}
			
			result = pstmt.executeQuery();	
			while(result.next()) {	
				NewVO vo = new NewVO();	
				vo.setNews_no(result.getInt(1));
				vo.setUser_id(result.getString(2));
				vo.setNews_category(result.getInt(3));
				vo.setNews_title(result.getString(4));
				vo.setNews_date(result.getString(5));
				vo.setNews_content(result.getString(6));
				vo.setNews_count(result.getInt(7));
				vo.setNews_img(result.getString(8));	
				list.add(vo);	
			}		
		}catch(Exception e) {
			System.out.println("selectNotice에서 에러" + e.getMessage());
			e.getStackTrace();
		}finally {
			closeDB();
		}
		return list;
	}
	
	public List<NewVO> selectEvent(MainQnAPageVO pVo) {
		List<NewVO> list = new ArrayList<NewVO>();
		try { 
			connDB();
			sql = "SELECT * FROM"
					+ " (SELECT * FROM("
						+ " SELECT "
						+ " news_no,"
						+ " user_id,"
						+ " news_category,"
						+ " news_title,"
						+ " news_date,"
						+ " news_content,"
						+ " news_count,"
						+ " news_img"
						+ " FROM main_news"
						+ " WHERE news_category = 2 ORDER BY news_no DESC)"
					+ " WHERE rownum <= ? ORDER BY news_no ASC)"
				+ " WHERE rownum <= ? ORDER BY news_no DESC";
			
			pstmt = conn.prepareStatement(sql);		
			
			pstmt.setInt(1, pVo.getPageNum() * pVo.getOnePageRecord());
			
			if(pVo.getPageNum() == pVo.getTotalPage()) {
				pstmt.setInt(2, pVo.getLastPageRecord());
			}else {
				pstmt.setInt(2, pVo.getOnePageRecord());
			}
			result = pstmt.executeQuery();
			while(result.next()) {	
				NewVO vo = new NewVO();	
				vo.setNews_no(result.getInt(1));
				vo.setUser_id(result.getString(2));
				vo.setNews_category(result.getInt(3));
				vo.setNews_title(result.getString(4));
				vo.setNews_date(result.getString(5));
				vo.setNews_content(result.getString(6));
				vo.setNews_count(result.getInt(7));
				vo.setNews_img(result.getString(8));	
				list.add(vo);		
			}
		}catch(Exception e) {
			System.out.println("selectEvent에서 에러" + e.getMessage());
			e.getStackTrace();
		}finally {
			closeDB();
		}
		return list;
	}

	public List<NewVO> selectAticle(MainQnAPageVO pVo) {
		List<NewVO> list = new ArrayList<NewVO>();
		try { 
			connDB();
			
			sql = "SELECT * FROM"
					+ " (SELECT * FROM("
						+ " SELECT "
						+ " news_no,"
						+ " user_id,"
						+ " news_category,"
						+ " news_title,"
						+ " news_date,"
						+ " news_content,"
						+ " news_count,"
						+ " news_img"
						+ " FROM main_news"
						+ " WHERE news_category = 3 ORDER BY news_no DESC)"
					+ " WHERE rownum <= ? ORDER BY news_no ASC)"
				+ " WHERE rownum <= ? ORDER BY news_no DESC";
			
			pstmt = conn.prepareStatement(sql);		
			
			pstmt.setInt(1, pVo.getPageNum() * pVo.getOnePageRecord());
			
			if(pVo.getPageNum() == pVo.getTotalPage()) {
				pstmt.setInt(2, pVo.getLastPageRecord());
			}else {
				pstmt.setInt(2, pVo.getOnePageRecord());
			}
			result = pstmt.executeQuery();
			
			while(result.next()) {		
				
				NewVO vo = new NewVO();		
				
				vo.setNews_no(result.getInt(1));
				vo.setUser_id(result.getString(2));
				vo.setNews_category(result.getInt(3));
				vo.setNews_title(result.getString(4));
				vo.setNews_date(result.getString(5));
				vo.setNews_content(result.getString(6));
				vo.setNews_count(result.getInt(7));
				vo.setNews_img(result.getString(8));	
				
				System.out.println(vo.getNews_date() + "날짜가 없을리가 없ㄴㄴ데"); 
				
				list.add(vo);		
			}		
		}catch(Exception e) {
			System.out.println("selectArticle에서 에러" + e.getMessage());
			e.getStackTrace();
		}finally {
			closeDB();
		}
		return list;
	}
	
	
	public int getTotalRecord(MainQnAPageVO vo, int category) {
		int totalRecord = 0;
		try {
			connDB();

			sql = "SELECT count(news_no) FROM main_news WHERE news_category = ?";
			
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setInt(1, category);
			
			result = pstmt.executeQuery();
			
			if(result.next()) {
				totalRecord = result.getInt(1);
				System.out.println("모든 질문" + totalRecord);
			}
		}catch(Exception e) {
			System.out.println(e.getMessage() + "모든 레코드의 수를 구하면서 에러 발생.");
		}finally {
			closeDB();
		}
		return totalRecord;
	}
	
	
	public void selectOneRecord(NewVO vo) {
		
		try {
			connDB();
			sql = "SELECT"
					+ " news_no,"
					+ " user_id,"
					+ " news_title,"
					+ " news_date,"
					+ " news_content,"
					+ " news_count,"
					+ " news_img"
				  + " FROM main_news"
				  + " WHERE news_no = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, vo.getNews_no());
			
			result = pstmt.executeQuery();
			
			if(result.next()) {
				vo.setNews_no(result.getInt(1));
				vo.setUser_id(result.getString(2));
				vo.setNews_title(result.getString(3));
				vo.setNews_date(result.getString(4));
				vo.setNews_content(result.getString(5));
				vo.setNews_count(result.getInt(6));
				vo.setNews_img(result.getString(7));
			}
		}catch(Exception e) {
			e.getStackTrace();
			System.out.println("selectOneRecord에서 에러" + e.getMessage());
		}finally {
			closeDB();
		}
		
	}
	
	
	public void updateCount(int no) {
		try {
			
			connDB();
			
			sql = "UPDATE main_news SET news_count = news_count+1 WHERE news_no=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			pstmt.executeUpdate();
		
		}catch(Exception e) {
			e.getStackTrace();
			System.out.println("카운트 업데이트에서 문제가 생겼다." + e.getMessage());
		}finally {
			closeDB();
		}

	}
	
	public LeadLagVO leadLagSelect(int no) {
		LeadLagVO vo = new LeadLagVO();
		try {
			connDB();
			sql = "SELECT * FROM("
					+ " SELECT news_no," 
					+" 		LEAD(news_no, 1) OVER(ORDER BY news_no DESC) leadNo," 
					+" 		LEAD(news_title, 1, '이전글') OVER(ORDER BY news_no DESC) leadSubject,"
					+" 		LAG(news_no, 1) OVER(ORDER BY news_no DESC) lagNo," 
					+" 		LAG(news_title, 1, '다음글') OVER(ORDER BY news_no DESC) lagSubject" 
					+" FROM main_news)" 
				+" WHERE news_no = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			result = pstmt.executeQuery();
			
			if(result.next()) {
				vo.setLeadNo(result.getInt(2));
				vo.setLeadSubject(result.getString(3));
				vo.setLagNo(result.getInt(4));
				vo.setLagSubject(result.getString(5));
			}
		}catch(Exception e) {
			e.getMessage();
			System.out.println("leadLagSelect 에서 에러 발생." + e.getMessage());
		}finally {
			closeDB();
		}

		return vo;
	}
	
	
	
}//class end
