package com.project_Ma.home.DAO;

import java.util.List;

import com.project_Ma.home.ConnectionDB;
import com.project_Ma.home.VO.MemberVO;

public class MemberDataDAO extends ConnectionDB implements Command_Member_Information_Service {

	public MemberDataDAO() {
	}

	@Override
	public void userDataSelect(MemberVO vo) {
		try {
			connDB();
			sql="select user_name, user_id,user_pw,user_email,user_tel,addr_no,addr_main,addr_sub "
					+ "  from user_info where user_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,vo.getUser_id());
			result= pstmt.executeQuery();
			
				if(result.next()) {
					vo.setUser_name(result.getString(1));
				}
			
		}catch(Exception e){
			System.out.println("회원정보 선택 에러 -->"+e.getMessage());
			e.printStackTrace();
		}finally {
		closeDB();
		}
	}

	@Override
	public int userDataUpdate() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int userDataDelete() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public	void corpoDataSelect(MemberVO vo) {
	
	}

	@Override
	public int corpoDataUpdate() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int corpoDataDelete() {
		// TODO Auto-generated method stub
		return 0;
	}

}
