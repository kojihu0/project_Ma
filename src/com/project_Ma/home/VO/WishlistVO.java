package com.project_Ma.home.VO;

/**
 * @author bitcamp
 *
 */
public class WishlistVO {
	private int wishNo;
	private String userid;
	private int camNo;
	private int whishRegi;
	private String camDesc;
	private int camGoalPrice;
	private int camTotalPrice;
	private String camPercentage;
	private String camImg;
	
	public WishlistVO(){
	}

	public int getWishNo() {
		return wishNo;
	}

	public void setWishNo(int wishNo) {
		this.wishNo = wishNo;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getCamNo() {
		return camNo;
	}

	public void setCamNo(int camNo) {
		this.camNo = camNo;
	}

	public int getWhishRegi() {
		return whishRegi;
	}

	public void setWhishRegi(int whishRegi) {
		this.whishRegi = whishRegi;
	}

	public String getCamDesc() {
		return camDesc;
	}

	public void setCamDesc(String camDesc) {
		this.camDesc = camDesc;
	}

	public int getCamGoalPrice() {
		return camGoalPrice;
	}

	public void setCamGoalPrice(int camGoalPrice) {
		this.camGoalPrice = camGoalPrice;
	}

	public int getCamTotalPrice() {
		return camTotalPrice;
	}

	public void setCamTotalPrice(int camTotalPrice) {
		this.camTotalPrice = camTotalPrice;
	}
	
	public String getCamPercentage() {
		camPercentage = String.format("%.2f", (float)camTotalPrice/(float)camGoalPrice*100);
		return camPercentage;
	}

	public void setCamPercentage(String camPercentage) {
		this.camPercentage = camPercentage;
	}

	public String getCamImg() {
		if(camImg.indexOf("|")>0) {
			String[] temp = camImg.split("|");
			camImg=temp[0];
		}
		return camImg;
	}

	public void setCamImg(String camImg) {
		this.camImg = camImg;
	}
}
