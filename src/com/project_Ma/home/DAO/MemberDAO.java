package com.project_Ma.home.DAO;

import com.project_Ma.home.ConnectionDB;
import com.project_Ma.home.VO.MemberVO;

public class MemberDAO extends ConnectionDB{

	public MemberDAO() {
		
	}
	public void memberLogin(MemberVO vo) {
		try {
			connDB();
			sql = "select user_name from user_info where user_id=? and user_pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUser_id());
			pstmt.setString(2, vo.getUser_pw());
			result = pstmt.executeQuery();
			
			if(result.next()) {
				vo.setUser_name(result.getString(1));
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

}
