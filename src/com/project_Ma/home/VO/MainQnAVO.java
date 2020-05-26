package com.project_Ma.home.VO;

public class MainQnAVO {

	//DB와 헛갈리지 않게, 대소문자 구분 안했습니다.
	private int 	service_no;
	private int 	service_parent_no;
	private String 	user_id;
	private String 	service_title;
	private int 	service_secret;
	private String  service_content;
	private String  service_regi;
	//답변 정보가 저장될 부분
	private int 	a_parent_no;
	private String 	a_id;
	private String 	a_title;
	private int 	a_secret;
	private String  a_content;
	private String  a_regi;
	
	
	public MainQnAVO() {
		
	}

	
	
	

	public int getA_parent_no() {
		return a_parent_no;
	}

	public void setA_parent_no(int a_parent_no) {
		this.a_parent_no = a_parent_no;
	}

	public String getA_id() {
		return a_id;
	}

	public void setA_id(String a_id) {
		this.a_id = a_id;
	}

	public String getA_title() {
		return a_title;
	}

	public void setA_title(String a_title) {
		this.a_title = a_title;
	}

	public int getA_secret() {
		return a_secret;
	}

	public void setA_secret(int a_secret) {
		this.a_secret = a_secret;
	}

	public String getA_content() {
		return a_content;
	}

	public void setA_content(String a_content) {
		this.a_content = a_content;
	}

	public String getA_regi() {
		return a_regi;
	}

	public void setA_regi(String a_regi) {
		this.a_regi = a_regi;
	}

	public int getService_no() {
		return service_no;
	}

	public void setService_no(int service_no) {
		this.service_no = service_no;
	}

	public int getService_parent_no() {
		return service_parent_no;
	}

	public void setService_parent_no(int service_parent_no) {
		this.service_parent_no = service_parent_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getService_title() {
		return service_title;
	}

	public void setService_title(String service_title) {
		this.service_title = service_title;
	}

	public int getService_secret() {
		return service_secret;
	}

	public void setService_secret(int service_secret) {
		this.service_secret = service_secret;
	}

	public String getService_content() {
		return service_content;
	}

	public void setService_content(String service_content) {
		this.service_content = service_content;
	}

	public String getService_regi() {
		return service_regi;
	}

	public void setService_regi(String service_regi) {
		this.service_regi = service_regi;
	}
}
