package com.project_Ma.home.VO;

import java.util.StringTokenizer;

public class IndexVO {
	
	//DB랑 같게하기 위해, 대소문자 구분 안줌.
	private int 	cam_no;
	private String 	cam_title;
	private String  cam_start;
	private String  cam_end;
	private String  cam_img_path;
	private int  	cam_remainDay;
	private int 	cam_goal_price;
	private int 	total_price;
	private double  achievement;
	 
	public IndexVO() {
		
	}
	//----------------------------
	
	
	
	public int getCam_no() {
		return cam_no;
	}

	public double getAchievement() {
		
		return achievement;
	}



	public void setAchievement(float achievement) {
		this.achievement = achievement;
	}



	public int getTotal_price() {
		return total_price;
	}



	public void setTotal_price(int total_price) {
		this.total_price = total_price;
		
		double achievement_result = 0.0;
		
		try {
			System.out.println("총 후원 금액 : " + total_price + "  캠페인 목표 금액 : " + cam_goal_price);
			if(cam_goal_price != 0) {
				achievement_result = (double)total_price / (double)cam_goal_price * 100;
			}
			System.out.println("achievement : "+ achievement);
			achievement = Double.parseDouble(String.format("%.2f",achievement_result));
			
		}catch(ArithmeticException ae) {
			System.out.println(ae.getMessage());
		}
		
		
	}



	public int getCam_goal_price() {
		return cam_goal_price;
	}



	public void setCam_goal_price(int cam_goal_price) {
		this.cam_goal_price = cam_goal_price;
	}



	public int getCam_remainDay() {
		return cam_remainDay; 
	}



	public void setCam_remainDay(int cam_remainDay) {
		this.cam_remainDay = cam_remainDay;
	}



	public String getCam_img_path() {
		
		
		StringTokenizer st = new StringTokenizer(cam_img_path, "|");
		
		if(st.hasMoreTokens()) {
			cam_img_path = st.nextToken();
			System.out.println(cam_img_path);
		}
		
		return cam_img_path;
	}


	public void setCam_img_path(String cam_img_path) {
		this.cam_img_path = cam_img_path;
	}


	public void setCam_no(int cam_no) {
		this.cam_no = cam_no;
	}

	public String getCam_title() {
		return cam_title;
	}

	public void setCam_title(String cam_title) {
		this.cam_title = cam_title;
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



}
