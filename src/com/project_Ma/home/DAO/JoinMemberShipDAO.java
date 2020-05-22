package com.project_Ma.home.DAO;

import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;

import com.project_Ma.home.ConnectionDB;
import com.project_Ma.home.VO.MemberVO;

public class JoinMemberShipDAO extends ConnectionDB implements CommandMemberShipService {

	public JoinMemberShipDAO() {
		
	}
	//아이디 중복체크
	public int idCheck(String user_id) {
		int cnt = 0; 
		try {
			connDB();
			sql="select count(user_id) from user_info where user_id=?";
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1,user_id);
			result =pstmt.executeQuery();
			if(result.next()) {
				cnt = result.getInt(1);		
			}
		}catch(Exception e) {
			System.out.println("아이디 중복체크 오류-->"+e.getMessage());
		}finally {
			closeDB();
		}
		return cnt;
	}	
	//사업자 등록번호 조회 
	public long cpNumCheck(long corpo_regi_no){
		long cnt = 0; 
		try {
			connDB();
			sql = "select count(corpo_regi_no) from user_info where corpo_regi_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1,corpo_regi_no);
			result = pstmt.executeQuery();
			if(result.next()) {
				cnt = result.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("사업자 등록번호 조회 오류 -->"+e.getMessage());
		}finally {
			closeDB();
		}
		return cnt;
	}
	
	@Override
	public int userInsert(MemberVO vo) {
		
		int cnt = 0;
		try {
			connDB();
			
			sql="insert  into user_info "
					+ "(user_no,rank_code,user_id,user_pw,user_name,user_email,user_tel,user_regi)"
					+ "values(user_sq.nextval,1,?,?,?,?,?,sysdate)";
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getUser_id());
			pstmt.setString(2, vo.getUser_pw());
			pstmt.setString(3, vo.getUser_name());
			pstmt.setString(4, vo.getUser_email());
			pstmt.setString(5, vo.getUser_tel());
		
			cnt = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("유저 회원가입오류-->"+e.getMessage());
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return cnt;
	}

	@Override
	public int coporateInsert(MemberVO vo) {
		int cnt = 0; 
		 try {
			connDB();
			sql="insert into user_info (user_no,rank_code,user_id,user_pw,user_name,corpo_name,corpo_regi_no,corpo_no,user_tel,user_email,user_regi)values(user_sq.nextval,2,?,?,?,?,?,?,?,?,sysdate)";
			pstmt=conn.prepareStatement(sql);
		
			pstmt.setString(1,vo.getUser_id());
			pstmt.setString(2,vo.getUser_pw());
			pstmt.setString(3,vo.getUser_name());
			pstmt.setString(4,vo.getCorpo_name());
			pstmt.setLong(5,vo.getCorpo_regi_no());
			pstmt.setLong(6,vo.getCorpo_no());
			pstmt.setString(7,vo.getUser_tel());
			pstmt.setString(8,vo.getUser_email());
	

			cnt = pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("법인회원가입 오류 -->"+e.getMessage());
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return cnt;
	}
	
	

}
