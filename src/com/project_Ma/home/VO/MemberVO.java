package com.project_Ma.home.VO;

public class MemberVO {
	private String user_id;//회원아이디
	private int user_no;//회원번호
	private String user_pw;//회원비밀번호
	private String user_name;//회원이름
	
	private String user_email;//회원이메일
	private String user_email_id;
	private String user_email_domain;
	
	
	private String user_tel;//회원연락처
	private String user_regi;//등록일
	private String corpo_name;//법인명
	private long corpo_no;//법인등록번호
	private int corpo_regi_no;//사업자등록번호
	private int rank_code;//유저분류코드 0:관리자, 1:일반유저, 2:회사
	private String addr_no;//우편번호
	private String addr_main;//주소
	private String addr_sub;//상세주소
	
	//------------------------------
	private String loginStatus = "N";//로그인 상태
	
	public MemberVO() {
	
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
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
		return user_email_id+"@"+user_email_domain;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
		int idx = user_email.indexOf("@");
		user_email_id = user_email.substring(0, idx);
		user_email_domain = user_email.substring(idx+1);
	}
	
	public String getUser_email_id() {
		return user_email_id;
	}

	public void setUser_email_id(String user_email_id) {
		this.user_email_id = user_email_id;
	}

	public String getUser_email_domain() {
		return user_email_domain;
	}

	public void setUser_email_domain(String user_email_domain) {
		this.user_email_domain = user_email_domain;
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

	public int getCorpo_regi_no() {
		return corpo_regi_no;
	}

	public void setCorpo_regi_no(int corpo_regi_no) {
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
