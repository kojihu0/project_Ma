package com.project_Ma.home.VO;

import java.util.StringTokenizer;

public class CampaignSponVO {
	private int cam_no;
	private String user_id; 
	private String cam_title;
	private String cam_content;
	private String cam_desc;
	private String donate_date;
	private String funding_price;
	private String cam_min_price;
	private String cam_max_price;
	private String cam_img;
	private String cam_start;
	private String cam_end;
	private String cam_goal_price;

	public CampaignSponVO() {
	
	}
	
	public int getCam_no() {
		return cam_no;
	}

	public void setCam_no(int cam_no) {
		this.cam_no = cam_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getCam_title() {
		return cam_title;
	}

	public void setCam_title(String cam_title) {
		this.cam_title = cam_title;
	}

	public String getCam_content() {
		return cam_content;
	}

	public void setCam_content(String cam_content) {
		this.cam_content = cam_content;
	}

	public String getCam_desc() {
		return  cam_desc;
	}

	public void setCam_desc(String  cam_desc) {
		this. cam_desc =  cam_desc;
	}

	public String getDonate_date() {
		return donate_date;
	}

	public void setDonate_date(String donate_date) {
		this.donate_date = donate_date;
	}

	public String getFunding_price() {
		return funding_price;
	}

	public void setFunding_price(String funding_price) {
		this.funding_price = funding_price;
	}

	
	public String getCam_min_price() {
		return cam_min_price;
	}

	public void setCam_min_price(String cam_min_price) {
		this.cam_min_price = cam_min_price;
	}

	
	public String getCam_max_price() {
		return cam_max_price;
	}

	public void setCam_max_price(String cam_max_price) {
		this.cam_max_price = cam_max_price;
	}

	public String getCam_img() {
		StringTokenizer st = new StringTokenizer(cam_img,"|");
		
		if(st.hasMoreTokens()) {
			cam_img= st.nextToken();
		}
		return cam_img;
	}

	public void setCam_img(String cam_img) {
		this.cam_img = cam_img;
	}

	public String getCam_start() {
		return cam_start;
	}

	public void setCam_start(String cam_start) {
		this.cam_start = cam_start;
	}

	public String getCam_end() {
		return cam_end;
	}

	public void setCam_end(String cam_end) {
		this.cam_end = cam_end;
	}

	public String getCam_goal_price() {
		return cam_goal_price;
	}

	public void setCam_goal_price(String cam_goal_price) {
		this.cam_goal_price = cam_goal_price;
	}
	
}
