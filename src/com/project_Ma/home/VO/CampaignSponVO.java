package com.project_Ma.home.VO;

public class CampaignSponVO {
	private int cam_no;
	private String user_id; 
	private String cam_title;
	private String cam_desc;
	private String donate_date;
	private String funding_price;
	private String cam_img;

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

	public String getCam_img() {
		return cam_img;
	}

	public void setCam_img(String cam_img) {
		this.cam_img = cam_img;
	}
	
}
