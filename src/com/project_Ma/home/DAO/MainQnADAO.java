package com.project_Ma.home.DAO;

import java.util.ArrayList;
import java.util.List;

import com.project_Ma.home.ConnectionDB;
import com.project_Ma.home.VO.MainQnAPageVO;
import com.project_Ma.home.VO.MainQnAVO;

public class MainQnADAO extends ConnectionDB{
	
	
	public MainQnADAO(){
		
	}
	//---질문등록을 위한 insert
	public int insertMainQnA(MainQnAVO vo) {
		int result = 0;
		
		try {
			connDB();
			sql = "INSERT INTO main_qna("
					+ "service_no,"
					+ "user_id, "
					+ "service_title,"
					+ "service_secret,"
					+ "service_content,"
					+ "service_regi)"
					
					+ "VALUES("
					+ "main_qna_sq.nextval,"
					+ "?,"
					+ "?,"
					+ "?,"
					+ "?,"
					+ "TO_DATE(SYSDATE, 'YY-MM-DD HH:MI')"
					+ ")";
					
			pstmt = conn.prepareStatement(sql);
			 
			pstmt.setString(1, vo.getUser_id());
			pstmt.setString(2, vo.getService_title());
			pstmt.setInt(3, vo.getService_secret()); 
			pstmt.setString(4, vo.getService_content());
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("메인 QnA 등록에서 문제가 생겼습니다." + e.getMessage());
			e.getStackTrace();
		}finally {
			closeDB();
		}
		
		
		return result;
	}
	//---질문 및 답
	public List<MainQnAVO> selectMainQnA(MainQnAPageVO pVo) {
		List<MainQnAVO> list = new ArrayList<MainQnAVO>();
		try {
			connDB();
			
			sql	=	" SELECT * FROM "
				+   " 	(SELECT * FROM "
				+   " 		(SELECT "
						//질문자 정보
				+   "   	questioner.service_no, "  
				+	"    	questioner.service_parent_no, "  
				+	"    	questioner.user_id, " 
				+	"    	questioner.service_title, " 
				+	"    	questioner.service_secret, " 
				+	"    	questioner.service_content, " 
				+	"    	TO_CHAR(questioner.service_regi, 'YY-MM-DD HH:MI'), "
						//답변자 정보
				+	"    	answer.service_parent_no a_parent_no, " 
				+	"    	answer.user_id a_id, " 
				+	"    	answer.service_title a_title, " 
				+	"    	answer.service_secret a_secret, " 
				+	"    	answer.service_content a_content, " 
				+	"    	TO_CHAR(answer.service_regi, 'YY-MM-DD HH:MI') a_regi " 
				
				+	"    	FROM main_qna questioner, main_qna answer " 
				+	"    	WHERE  questioner.service_no = answer.service_parent_no(+) " 
				+	"    	AND questioner.user_id  != 'admin'"
				+ 	"	 	ORDER BY service_no DESC) " 
				+	"	WHERE rownum <= ? ORDER BY service_no ASC)" 
				+	" WHERE rownum <= ? ORDER BY service_no DESC"; 
			
			pstmt = conn.prepareStatement(sql); 
			
			System.out.println("getLastPageRecord : " + pVo.getLastPageRecord());
			System.out.println("getOnePageRecord : " + pVo.getOnePageRecord());
			System.out.println("getPageNum : " + pVo.getPageNum());
			System.out.println("getTotalPage : " + pVo.getTotalPage()); 
			
			
			//첫번째 ? = 현제 페이지.
			pstmt.setInt(1, pVo.getPageNum() * pVo.getOnePageRecord()); //현재 페이지. * 한페이지 출력할 
			//두번쨰 ? = 질문출력할 수
			if(pVo.getPageNum() == pVo.getTotalPage()) { //마지막 페이지일때.
				pstmt.setInt(2, pVo.getLastPageRecord());
			}else {
				pstmt.setInt(2, pVo.getOnePageRecord());
			}			
			result = pstmt.executeQuery();
			
			while(result.next()) {
				
				MainQnAVO vo = new MainQnAVO();
				vo.setService_no(result.getInt(1));
				vo.setService_parent_no(result.getInt(2));
				vo.setUser_id(result.getString(3));
				vo.setService_title(result.getString(4));
				vo.setService_secret(result.getInt(5));
				vo.setService_content(result.getString(6));
				vo.setService_regi(result.getString(7));
				
				vo.setA_parent_no(result.getInt(8));
				vo.setA_id(result.getString(9));
				vo.setA_title(result.getString(10));
				vo.setA_secret(result.getInt(11));
				vo.setA_content(result.getString(12));
				vo.setA_regi(result.getString(13));
				
				list.add(vo);
			}
			
		}catch(Exception e) {
			System.out.println("메인 QnA 레코드 전체 선택에서 에러가 발생했습니다." + e.getMessage());
			e.getStackTrace();
		}finally {
			closeDB();
		}
		
		return list;
	}
	public int getTotalRecord(MainQnAPageVO vo) {
		int totalRecord = 0;
		try {
			connDB();

			sql = "SELECT count(a.service_no) FROM main_qna a, main_qna b WHERE a.service_no = b.service_parent_no(+)"
				+ " AND a.user_id != 'admin'";
			
			pstmt = conn.prepareStatement(sql);
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
	
	
	
	
	//---질문 및 답
	public void selectRecord(MainQnAVO vo, int no) {
		
		try {
			connDB();
			
			sql	= "SELECT "
					+ " service_no,"
					+ " service_title,"
					+ " user_id,"
					+ " service_content"
				+ " FROM main_qna"
				+ " WHERE service_no = ?";
			
			pstmt = conn.prepareStatement(sql); 
			
			pstmt.setInt(1, no);
			
			result = pstmt.executeQuery();
			
			if(result.next()) {
				
				vo.setService_no(result.getInt(1));
				vo.setUser_id(result.getString(2));
				vo.setService_title(result.getString(3));
				vo.setService_content(result.getString(4));
			
			}
			
		}catch(Exception e) {
			System.out.println("레코드 하나 선택" + e.getMessage());
			e.getStackTrace();
		}finally {
			closeDB();
		}
	}
	
	//---질문등록을 위한 insert
		public int insertAnswer(MainQnAVO vo) {
			int result = 0;
			
			try {
				connDB();
				sql = "INSERT INTO main_qna("
						+ "service_no,"
						+ "service_parent_no,"
						+ "user_id, "
						+ "service_title,"
						+ "service_secret,"
						+ "service_content,"
						+ "service_regi)"
						
						+ "VALUES("
						+ "main_qna_sq.nextval,"
						+ " ?,"
						+ " 'admin',"
						+ " '질문해주신 사항에 답변 드립니다.',"
						+ " 0,"
						+ " ?,"
						+ " TO_DATE(SYSDATE, 'YY-MM-DD HH:MI')"
						+ ")";
						
				pstmt = conn.prepareStatement(sql);
				 
				pstmt.setInt(1, vo.getService_parent_no());
				pstmt.setString(2, vo.getService_content());
				
				result = pstmt.executeUpdate();
				
			}catch(Exception e) {
				System.out.println("메인 QnA 등록에서 문제가 생겼습니다." + e.getMessage());
				e.getStackTrace();
			}finally {
				closeDB();
			}
			
			
			return result;
		}
	
	
	
}//class end
