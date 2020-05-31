package com.project_Ma.home.DAO;

import com.project_Ma.home.ConnectionDB;
import com.project_Ma.home.VO.MemberVO;

public class MemberDAO extends ConnectionDB{

	public MemberDAO() {
		
	}
	public void memberLogin(MemberVO vo) {
		try {
			connDB();
			sql = "select user_name, rank_code from user_info where user_id=? and user_pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUser_id());
			pstmt.setString(2, vo.getUser_pw());
			result = pstmt.executeQuery();
			
			if(result.next()) {
				vo.setUser_name(result.getString(1));
				vo.setRank_code(result.getInt(2));
				vo.setLoginStatus("Y");
			}else {
				vo.setLoginStatus("N");
			}
		}catch(Exception e) {
			System.out.println("로그인 에러...."+e.getMessage());
		}finally {
			closeDB();
		}
	}
	
	public void getIdFind(MemberVO vo) {
		try {
			connDB();
			sql="select user_id from user_info where user_name=? and user_email=? and rank_code=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUser_name());
			pstmt.setString(2, vo.getUser_email());
			pstmt.setInt(3, vo.getRank_code());
			
			result = pstmt.executeQuery();
			
			if(result.next()) {
				vo.setUser_id(result.getString(1));
			}
		}catch(Exception e) {
			System.out.println("아이디찾기 에러....."+e.getMessage());
		}finally {
			closeDB();
		}
	}
	
	public void getPwFind(MemberVO vo) {
		try {
			connDB();
			sql="select user_pw from user_info where user_id=? and user_email=? and rank_code=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUser_id());
			pstmt.setString(2, vo.getUser_email());
			pstmt.setInt(3, vo.getRank_code());
			
			result = pstmt.executeQuery();
			
			if(result.next()) {
				vo.setUser_pw(result.getString(1));
			}
		}catch(Exception e) {
			System.out.println("비밀번호 찾기 에러...."+e.getMessage());
		}finally {
			closeDB();
		}
	}

}
