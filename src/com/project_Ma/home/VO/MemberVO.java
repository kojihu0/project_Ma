package com.project_Ma.home.VO;

public class MemberVO {
   private int user_no;//ȸ����ȣ
   private int rankcode;
   private String user_id;//ȸ�����̵�
   private String user_pw;//ȸ����й�ȣ
   private String user_name;//ȸ���̸�
   private String corpo_name;//���θ�
   private int corpo_num;//���ι�ȣ
   private int corpo_num2;//����ڵ�Ϲ�ȣ
   private String user_email;//ȸ���̸���
   private String user_tel;//ȸ������ó
   private String regi_date;//�����
   private String addr_num;//�����ȣ
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

   public int getRankcode() {
      return rankcode;
   }

   public void setRankcode(int rankcode) {
      this.rankcode = rankcode;
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

   public String getCorpo_name() {
      return corpo_name;
   }

   public void setCorpo_name(String corpo_name) {
      this.corpo_name = corpo_name;
   }

   public int getCorpo_num() {
      return corpo_num;
   }

   public void setCorpo_num(int corpo_num) {
      this.corpo_num = corpo_num;
   }

   public int getCorpo_num2() {
      return corpo_num2;
   }

   public void setCorpo_num2(int corpo_num2) {
      this.corpo_num2 = corpo_num2;
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

   public String getRegi_date() {
      return regi_date;
   }

   public void setRegi_date(String regi_date) {
      this.regi_date = regi_date;
   }

   public String getAddr_num() {
      return addr_num;
   }

   public void setAddr_num(String addr_num) {
      this.addr_num = addr_num;
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