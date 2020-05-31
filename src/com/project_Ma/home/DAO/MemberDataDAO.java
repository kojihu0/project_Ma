package com.project_Ma.home.DAO;

import java.util.List;

import com.project_Ma.home.Command_Member_Information_Service;
import com.project_Ma.home.ConnectionDB;
import com.project_Ma.home.VO.MemberVO;

public class MemberDataDAO extends ConnectionDB implements Command_Member_Information_Service {

	public MemberDataDAO() {
	}

	@Override
	public void userDataSelect(MemberVO vo) {
		try {
			connDB();
			sql="select user_name,user_id,user_pw,user_email,user_tel,addr_no,addr_main,addr_sub "
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
			System.out.println("유저 정보 출력 에러 -->"+e.getMessage());
			e.printStackTrace();
		}finally {
			closeDB();
		}
	}

	@Override
	public int userDataUpdate(MemberVO vo) {
		int cnt = 0; 
		try {
			connDB();
			sql="update user_info set user_name=?,user_email=?,user_tel=?,addr_no=?,addr_main=?,addr_sub=? where user_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUser_name());
			pstmt.setString(2, vo.getUser_email());
			pstmt.setString(3, vo.getUser_tel());
			pstmt.setString(4, vo.getAddr_no());
			pstmt.setString(5, vo.getAddr_main());
			pstmt.setString(6, vo.getAddr_sub());
			pstmt.setString(7, vo.getUser_id());
			
			cnt = pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("유저 정보 수정 에러 --->"+e.getMessage());
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return cnt;
	}
	public int userPwUpdate(MemberVO vo) {
		int cnt = 0; 
		try {
			connDB();
			sql="update user_info set user_pw=? where user_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUser_pw());
			pstmt.setString(2, vo.getUser_id());
			cnt = pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("유저 비밀번호 변경 에러  -->"+e.getMessage());
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return cnt;
	}

	@Override
	public int userDataDelete(MemberVO vo) {
		int cnt = 0;
		try {
			connDB();
			sql="delete from user_info where user_name=? and user_id=? and user_pw=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,vo.getUser_name());
			pstmt.setString(2,vo.getUser_id());
			pstmt.setString(3,vo.getUser_pw());
			
			cnt = pstmt.executeUpdate();
			
		}catch (Exception e){
			System.out.println("유저 정보 삭제 에러 -->"+e.getMessage());
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		return cnt;
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
					vo.setCorpo_no(result.getLong(7));
					vo.setCorpo_regi_no(result.getLong(8));
					vo.setAddr_no(result.getString(9));
					vo.setAddr_main(result.getString(10));
					vo.setAddr_sub(result.getString(11));
			 }
		}catch (Exception e) {
			System.out.println("법인 정보 출력 에러  -->"+e.getMessage());
			e.printStackTrace();
		}finally {
			closeDB();
		}
	}

	@Override
	public int corpoDataUpdate(MemberVO vo) {
		int cnt = 0;
		try {
			connDB();
			sql="update user_info set user_name=?,user_email=?,user_tel=?,addr_no=?,addr_main=?,addr_sub=?,corpo_name=?,corpo_no=?,corpo_regi_no=? where user_id=?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1,vo.getUser_name());
			pstmt.setString(2,vo.getUser_email());
			pstmt.setString(3,vo.getUser_tel());
			pstmt.setString(4,vo.getAddr_no());
			pstmt.setString(5,vo.getAddr_main());
			pstmt.setString(6,vo.getAddr_no());
			pstmt.setString(7,vo.getCorpo_name());
			pstmt.setLong(8,vo.getCorpo_no());
			pstmt.setLong(9,vo.getCorpo_regi_no());
			pstmt.setString(10,vo.getUser_id());
			
			cnt = pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("법인 정보  수정 에러  -- >"+e.getMessage());
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return cnt;
	}

	@Override
	public int corpoDataDelete(MemberVO vo) {
		int cnt = 0; 
		try {
			connDB();
			sql="delete from user_info where user_name=? and user_id=? and user_pw=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUser_name());
			pstmt.setString(2, vo.getUser_id());
			pstmt.setString(3,vo.getUser_pw());
			cnt = pstmt.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("법인 정보 삭제 에러  -->"+e.getMessage());
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return cnt;
	}

}
