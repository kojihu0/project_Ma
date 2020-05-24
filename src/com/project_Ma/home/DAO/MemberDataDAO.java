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
					vo.setUser_id(result.getString(2));
					vo.setUser_pw(result.getString(3));
					vo.setUser_email(result.getString(4));
					vo.setUser_tel(result.getString(5));
					vo.setAddr_no(result.getString(6));
					vo.setAddr_main(result.getString(7));
					vo.setAddr_sub(result.getString(8));
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
		int cnt = 0; 
		try {
			
			
		}catch(Exception e) {
			
		}finally{
			closeDB();
		}
		return cnt;
	}

	@Override
	public int userDataDelete() {
		return 0;
	}

	@Override
	public	void corpoDataSelect(MemberVO vo) {
		try {
			 connDB();
			 sql ="select user_id , user_pw ,user_name, user_email,user_tel,corpo_name,corpo_no,corpo_regi_no, addr_no,addr_main,addr_sub from user_info where user_id=? ";
			 pstmt=conn.prepareStatement(sql);
			 pstmt.setString(1,vo.getUser_id());
			 result = pstmt.executeQuery();
			 if(result.next()) {
				 	vo.setUser_id(result.getString(1));
					vo.setUser_pw(result.getString(2));
					vo.setUser_name(result.getString(3));
					vo.setUser_email(result.getString(4));
					vo.setUser_tel(result.getString(5));
					vo.setCorpo_name(result.getString(6));
					vo.setCorpo_no(result.getInt(7));
					vo.setCorpo_regi_no(result.getInt(8));
					vo.setAddr_no(result.getString(9));
					vo.setAddr_main(result.getString(10));
					vo.setAddr_sub(result.getString(11));
			 }
		}catch (Exception e) {
			System.out.println("법인 데이터 선택 오류 -->"+e.getMessage());
			e.printStackTrace();
		}finally {
			closeDB();
		}
	}

	@Override
	public int corpoDataUpdate() {
		return 0;
	}

	@Override
	public int corpoDataDelete() {
		return 0;
	}

}
