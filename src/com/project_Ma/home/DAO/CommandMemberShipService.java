package com.project_Ma.home.DAO;

import com.project_Ma.home.VO.MemberVO;

public interface CommandMemberShipService {
	//ȸ������(����)
	public int userInsert(MemberVO vo);
	//ȸ������(���)
	public int coporateInsert(MemberVO vo);
	
}
