package com.project_Ma.home.VO;

import java.util.Arrays;
import java.util.List;

public class CamDetailVO {
	private int camNo;
	private String userid;
	private String userName;
	private String corpoName;
	private int corpoNo;
	private List<String> camImgList;
	private String camImg;
	private String camTitle;
	private String camContent;
	private String camDesc;
	private String camStart;
	private String camEnd;
	private String camRemain;
	private int camGoalPrice;
	private int camTotalPrice;
	private int camMinPrice;
	private int camMaxPrice;
	private String camPercentage;
	private int camTotalDonator;
	private int camRewardStatus = 0;
	private String camRegi;
	
	public CamDetailVO() {
	}

	public int getCamNo() {
		return camNo;
	}

	public void setCamNo(int camNo) {
		this.camNo = camNo;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getCorpoName() {
		return corpoName;
	}

	public void setCorpoName(String corpoName) {
		this.corpoName = corpoName;
	}

	public int getCorpoNo() {
		return corpoNo;
	}

	public void setCorpoNo(int corpoNo) {
		this.corpoNo = corpoNo;
	}

	public String getCamImg() {
		return camImg;
	}

	public void setCamImg(String camImg) {
		this.camImg = camImg;
	}
	
	public List<String> getCamImgList() {
		camImgList = Arrays.asList(camImg.split("|"));
		return camImgList;
	}
	
	public void setCamImgList(List<String> camImgList) {
		camImg = String.join("|", camImgList.toArray(new String[camImgList.size()]));
		this.camImgList = camImgList;
	}

	public String getCamTitle() {
		return camTitle;
	}

	public void setCamTitle(String camTitle) {
		this.camTitle = camTitle;
	}

	public String getCamContent() {
		return camContent;
	}

	public void setCamContent(String camContent) {
		this.camContent = camContent;
	}

	public String getCamDesc() {
		camDesc = camDesc.replaceAll("\r\n","<br/>");
		return camDesc;
	}

	public void setCamDesc(String camDesc) {
		this.camDesc = camDesc;
	}

	public String getCamStart() {
		return camStart;
	}

	public void setCamStart(String camStart) {
		this.camStart = camStart;
	}

	public String getCamEnd() {
		return camEnd;
	}

	public void setCamEnd(String camEnd) {
		this.camEnd = camEnd;
	}
	
	public String getCamRemain() {
		return camRemain;
	}

	public void setCamRemain(String camRemain) {
		this.camRemain = camRemain;
	}

	public int getCamGoalPrice() {
		return camGoalPrice;
	}

	public void setCamGoalPrice(int goalPrice) {
		this.camGoalPrice = goalPrice;
	}
	
	public int getCamTotalPrice() {
		return camTotalPrice;
	}

	public void setCamTotalPrice(int camTotalPrice) {
		this.camTotalPrice = camTotalPrice;
	}

	public int getCamMinPrice() {
		return camMinPrice;
	}

	public void setCamMinPrice(int minPrice) {
		this.camMinPrice = minPrice;
	}

	public int getCamMaxPrice() {
		return camMaxPrice;
	}

	public void setCamMaxPrice(int maxPrice) {
		this.camMaxPrice = maxPrice;
	}
	
	public String getCamPercentage() {
		camPercentage = String.format("%.2f", (float)camTotalPrice/(float)camGoalPrice*100);
		return camPercentage;
	}

	public void setCamPercentage(String camPercentage) {
		this.camPercentage = camPercentage;
	}
	
	public int getCamTotalDonator() {
		return camTotalDonator;
	}

	public void setCamTotalDonator(int camTotalDonator) {
		this.camTotalDonator = camTotalDonator;
	}

	public int getCamRewardStatus() {
		return camRewardStatus;
	}

	public void setCamRewardStatus(int camRewardStatus) {
		this.camRewardStatus = camRewardStatus;
	}

	public String getCamRegi() {
		return camRegi;
	}

	public void setCamRegi(String camRegiDate) {
		this.camRegi = camRegiDate;
	}

}
