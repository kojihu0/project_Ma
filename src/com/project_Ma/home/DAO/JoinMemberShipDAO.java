package com.project_Ma.home.DAO;

import com.project_Ma.home.ConnectionDB;

public class JoinMemberShipDAO extends ConnectionDB implements CommandMemberShipService {

	public JoinMemberShipDAO() {
	}

	@Override
	public int userInsert(int user_no) {
		try {
			connDB();
			sql="insert into user_info"
					+ "(user_no,rankcode,user_id,user_pw,user_name,user_email,user_tel,regi_date)"
					+ "values(user_sq.nextval)";
		
		} catch (Exception e) {
			
		}finally {
			closeDB();
		}
		return 0;
	}

	@Override
	public int coporateInsert(int user_no) {
		
		return 0;
	}

}
