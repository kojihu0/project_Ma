package com.project_Ma.home.VO;

public class MemberVO {
   private int user_no;//회원번호
   private int rankcode;
   private String user_id;//회원아이디
   private String user_pw;//회원비밀번호
   private String user_name;//회원이름
   private String corpo_name;//법인명
   private int corpo_num;//법인번호
   private int corpo_num2;//사업자등록번호
   private String user_email;//회원이메일
   private String user_tel;//회원연락처
   private String regi_date;//등록일
   private String addr_num;//우편번호
   private String addr_main;//주소
   private String addr_sub;//상세주소
   
   //------------------------------
   private String loginStatus = "N";//로그인 상태
   
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