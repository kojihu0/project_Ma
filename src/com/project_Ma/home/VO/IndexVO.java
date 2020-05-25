package com.project_Ma.home.VO;

public class IndexVO {
	
	//DB랑 같게하기 위해, 대소문자 구분 안줌.
	private int 	cam_no;
	private String 	cam_title;
	private String  cam_start;
	private String  cam_end;
	private String  cam_img_path;
	private int  cam_remainDay;
	 
	public IndexVO() {
		
	}
	//----------------------------
	
	
	
	public int getCam_no() {
		return cam_no;
	}

	public int getCam_remainDay() {
		return cam_remainDay; 
	}



	public void setCam_remainDay(int cam_remainDay) {
		this.cam_remainDay = cam_remainDay;
	}



	public String getCam_img_path() {
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
