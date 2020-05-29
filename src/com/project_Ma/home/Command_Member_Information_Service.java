package com.project_Ma.home;

import java.util.List;

import com.project_Ma.home.VO.MemberVO;

public interface Command_Member_Information_Service {
		//���� ���� �������� 
		public void userDataSelect(MemberVO vo);
		//�������� �����ϱ�
		public int userDataUpdate(MemberVO vo);
		//���� ��й�ȣ ���� 
		public int userPwUpdate(MemberVO vo);
		//ȸ��Ż�� (����)
		public int userDataDelete(MemberVO vo);
		//�������� �������� 
		public  void corpoDataSelect(MemberVO vo);
		//�������� �����ϱ� 
		public int corpoDataUpdate(MemberVO vo);
		//ȸ��Ż��(����)
		public int corpoDataDelete(MemberVO vo);
		
}
