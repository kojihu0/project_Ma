package com.project_Ma.home.VO;

import java.util.StringTokenizer;

public class CampaignVO {
	private int cam_no;//ķ���� ��ȣ
	private String user_id;//�۾���
	private String cam_title;//ķ���� ����
	private String cam_content;//ķ���� ����
	private String cam_desc;//ķ���� ����
	private String cam_start;//ķ���� ������
	private String cam_end;//ķ���� ������
	private int cam_remainday;//ķ���� ���� �ϼ�
	private int cam_goal_price;//��ǥ�ݾ�
	private int cam_min_price;//�ּ� �ݵ� �ݾ�
	private int cam_max_price;//�ִ� �ݵ��ݾ�
	private int cam_reward_status;//������ ���� 0:���� 1:����
	private String cam_img;//�̹������
	private String cam_regi;//ķ���� �����
	private int total_price;
	private double percent;
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
		return cam_desc;
	}
	public void setCam_desc(String cam_desc) {
		this.cam_desc = cam_desc;
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
	public int getCam_remainday() {
		return cam_remainday;
	}
	public void setCam_remainday(int cam_remainday) {
		this.cam_remainday = cam_remainday;
	}
	public void setCam_end(String cam_end) {
		this.cam_end = cam_end;
	}
	public int getCam_goal_price() {
		return cam_goal_price;
	}
	public void setCam_goal_price(int cam_goal_price) {
		this.cam_goal_price = cam_goal_price;
	}
	public int getCam_min_price() {
		return cam_min_price;
	}
	public void setCam_min_price(int cam_min_price) {
		this.cam_min_price = cam_min_price;
	}
	public int getCam_max_price() {
		return cam_max_price;
	}
	public void setCam_max_price(int cam_max_price) {
		this.cam_max_price = cam_max_price;
	}
	public int getCam_reward_status() {
		return cam_reward_status;
	}
	public void setCam_reward_status(int cam_reward_status) {
		this.cam_reward_status = cam_reward_status;
	}
	public String getCam_img() {
		
		StringTokenizer st = new StringTokenizer(cam_img, "|");
	
		if(st.hasMoreTokens()) {
			cam_img = st.nextToken();
		}
		return cam_img;
	}
	public void setCam_img(String cam_img) {
		this.cam_img = cam_img;
	}
	public String getCam_regi() {
		return cam_regi;
	}
	public void setCam_regi(String cam_regi) {
		this.cam_regi = cam_regi;
	}
	public int getTotal_price() {
		return total_price;	
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;

		try {
			if(cam_goal_price!=0) {
				percent = total_price/(double)cam_goal_price*100;
			}

		}catch(ArithmeticException ae) {
			ae.getMessage();
		}
	}
	public double getPercent() {
		
		return percent;
	}
	public void setPercent(double percent) {
		this.percent = percent;
	}
	
	
	
}
