package com.project_Ma.home.DAO;

import java.util.List;

import com.project_Ma.home.VO.MemberVO;

public interface Command_Member_Information_Service {
		//���� ���� �������� 
		public void userDataSelect(MemberVO vo);
		//�������� �����ϱ�
		public int userDataUpdate();
		//ȸ��Ż�� (����)
		public int userDataDelete();
		//�������� �������� 
		public  void corpoDataSelect(MemberVO vo);
		//�������� �����ϱ� 
		public int corpoDataUpdate();
		//ȸ��Ż��(����)
		public int corpoDataDelete();
		
}
