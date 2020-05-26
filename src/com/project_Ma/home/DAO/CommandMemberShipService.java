package com.project_Ma.home.DAO;

import com.project_Ma.home.VO.MemberVO;

public interface CommandMemberShipService {
	//회원가입(유저)
	public int userInsert(MemberVO vo);
	//회원가입(기업)
	public int coporateInsert(MemberVO vo);
	//아이디 중복체크 
	public int idCheck(String user_id);
	//사업자 등록번호 조회 
	public long cpNumCheck(long corpo_num);
}
	