package com.project_Ma.home.VO;

public class NewVO {

	//DB와의 공통점을 위해, 대소문자 구별하지 않았습니다.
	//1 = 공지사항(notice)   2 = 이벤트(event)   3 = 보도자료(article)
	private int 	news_no;
	private String 	user_id;
	private int 	news_category;
	private String 	news_title;
	private String 	news_date;
	private String 	news_content;
	private int 	news_count;
	private String 	news_img;
	 
	public NewVO() {
		
	}
	 

	public int getNews_no() {
		return news_no;
	}

	public void setNews_no(int news_no) {
		this.news_no = news_no;
	}	

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getNews_category() {
		return news_category;
	}

	public void setNews_category(int news_category) {
		this.news_category = news_category;
	}

	public String getNews_title() {
		return news_title;
	}

	public void setNews_title(String news_title) {
		this.news_title = news_title;
	}

	public String getNews_date() {
		return news_date;
	}

	public void setNews_date(String news_date) {
		this.news_date = news_date;
	}

	public String getNews_content() {
		return news_content;
	}

	public void setNews_content(String news_content) {
		this.news_content = news_content;
	}

	public int getNews_count() {
		return news_count;
	}

	public void setNews_count(int news_count) {
		this.news_count = news_count;
	}

	public String getNews_img() {
		return news_img;
	}

	public void setNews_img(String news_img) {
		this.news_img = news_img;
	}
}
