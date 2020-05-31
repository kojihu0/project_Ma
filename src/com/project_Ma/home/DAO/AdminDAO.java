package com.project_Ma.home.DAO;

import com.project_Ma.home.ConnectionDB;

public class AdminDAO extends ConnectionDB{

	public AdminDAO() {
		
	}

	
	
	public String loginCheck(String id, String pw) {
		String login =  "";
		try {
			
			connDB();
			
			sql="SELECT user_id, user_pw FROM user_info WHERE user_id = ? AND user_pw = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			
			result = pstmt.executeQuery();
			
			if(result.next()) {
				login = "Y";
			}else {
				login = "N";
			}
		}catch(Exception e) {
			e.getStackTrace();
			System.out.println(e.getMessage() + "로그인 체크에서 에러 발생.");
		}finally {
			closeDB();
		}
		
		return login;
	}
}//class end
