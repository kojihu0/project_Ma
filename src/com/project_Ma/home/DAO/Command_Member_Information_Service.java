package com.project_Ma.home.DAO;

import java.util.List;

import com.project_Ma.home.VO.MemberVO;

public interface Command_Member_Information_Service {
		//유저 정보 가져오기 
		public void userDataSelect(MemberVO vo);
		//유저정보 수정하기
		public int userDataUpdate(MemberVO vo);
		//유저 비밀번호 수정 
		public int userPwUpdate(MemberVO vo);
		//회원탈퇴 (유저)
		public int userDataDelete(MemberVO vo);
		//법인정보 가져오기 
		public  void corpoDataSelect(MemberVO vo);
		//법인정보 수정하기 
		public int corpoDataUpdate(MemberVO vo);
		//회원탈퇴(법인)
		public int corpoDataDelete(MemberVO vo);
		
}
