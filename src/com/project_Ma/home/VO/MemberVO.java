package com.project_Ma.home.VO;

public class MemberVO {
   private int user_no;//ȸ����ȣ
   private String user_id;//ȸ�����̵�
   private String user_pw;//ȸ����й�ȣ
   private String user_name;//ȸ���̸�
   private String user_email;//ȸ���̸���
   private String user_tel;//ȸ������ó
   private String user_regi;//�����
   private String corpo_name;//���θ�
   private long corpo_no;//���ι�ȣ
   private long corpo_regi_no;//����ڵ�Ϲ�ȣ
   private int rank_code;//ȸ���з��ڵ�
   private String addr_no;//�����ȣ
   private String addr_main;//�ּ�
   private String addr_sub;//���ּ�
   
   //------------------------------
   private String loginStatus = "N";//�α��� ����
   
   public MemberVO() {
   
   }

public int getUser_no() {
	return user_no;
}

public void setUser_no(int user_no) {
	this.user_no = user_no;
}

public String getUser_id() {
	return user_id;
}

public void setUser_id(String user_id) {
	this.user_id = user_id;
}

public String getUser_pw() {
	return user_pw;
}

public void setUser_pw(String user_pw) {
	this.user_pw = user_pw;
}

public String getUser_name() {
	return user_name;
}

public void setUser_name(String user_name) {
	this.user_name = user_name;
}

public String getUser_email() {
	return user_email;
}

public void setUser_email(String user_email) {
	this.user_email = user_email;
}

public String getUser_tel() {
	return user_tel;
}

public void setUser_tel(String user_tel) {
	this.user_tel = user_tel;
}

public String getUser_regi() {
	return user_regi;
}

public void setUser_regi(String user_regi) {
	this.user_regi = user_regi;
}

public String getCorpo_name() {
	return corpo_name;
}

public void setCorpo_name(String corpo_name) {
	this.corpo_name = corpo_name;
}

public long getCorpo_no() {
	return corpo_no;
}

public void setCorpo_no(long corpo_no) {
	this.corpo_no = corpo_no;
}

public long getCorpo_regi_no() {
	return corpo_regi_no;
}

public void setCorpo_regi_no(long corpo_regi_no) {
	this.corpo_regi_no = corpo_regi_no;
}

public int getRank_code() {
	return rank_code;
}

public void setRank_code(int rank_code) {
	this.rank_code = rank_code;
}

public String getAddr_no() {
	return addr_no;
}

public void setAddr_no(String addr_no) {
	this.addr_no = addr_no;
}

public String getAddr_main() {
	return addr_main;
}

public void setAddr_main(String addr_main) {
	this.addr_main = addr_main;
}

public String getAddr_sub() {
	return addr_sub;
}

public void setAddr_sub(String addr_sub) {
	this.addr_sub = addr_sub;
}

public String getLoginStatus() {
	return loginStatus;
}

public void setLoginStatus(String loginStatus) {
	this.loginStatus = loginStatus;
}


  

}