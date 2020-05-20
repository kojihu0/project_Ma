package com.project_Ma.home.DAO;

import com.project_Ma.home.ConnectionDB;
import com.project_Ma.home.VO.MemberVO;

public class JoinMemberShipDAO extends ConnectionDB implements CommandMemberShipService {

	public JoinMemberShipDAO() {
	}

	@Override
	public int userInsert(MemberVO vo) {
		int result = 0;
		try {
			connDB();
			sql="insert into user_info"
					+ "(user_no,rankcode,user_id,user_pw,user_name,user_email,user_tel,regi_date)"
					+ "values(user_sq.nextval,2,?,?,?,?,?,sysdate)";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUser_id());
			pstmt.setString(2, vo.getUser_pw());
			pstmt.setString(3, vo.getUser_name());
			pstmt.setString(4, vo.getUser_email());
			pstmt.setString(5, vo.getUser_tel());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("회원가입에러-->"+e.getMessage());
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return result;
	}

	@Override
	public int coporateInsert(MemberVO vo) {
		
		return 0;
	}

}
