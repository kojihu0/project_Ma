package com.project_Ma.home;

import com.project_Ma.home.VO.MemberVO;

public interface CommandMemberShipService {
	//ȸ������(����)
	public int userInsert(MemberVO vo);
	//ȸ������(���)
	public int coporateInsert(MemberVO vo);
	//���̵� �ߺ�üũ 
	public int idCheck(String user_id);
	//����� ��Ϲ�ȣ ��ȸ 
	public long cpNumCheck(long corpo_num);
}
	