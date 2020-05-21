package com.project_Ma.home.VO;

import java.util.Arrays;
import java.util.List;

public class CampaignVO {
	private int camNo;
	private String userid;
	private List<String> camImgList;
	private String camImgPath;
	private String camTitle;
	private String camContent;
	private String camDesc;
	private String camStart;
	private String camEnd;
	private int goalPrice;
	private int minPrice;
	private int maxPrice;
	private int camRewardStatus = 0;
	private String camRegiDate;
	
	public CampaignVO() {
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

	public String getCamImgPath() {
		return camImgPath;
	}

	public void setCamImgPath(String camImgPath) {
		this.camImgPath = camImgPath;
		camImgList = Arrays.asList(camImgPath.split("|"));
	}
	
	public List<String> getCamImgList() {
		return camImgList;
	}
	
	public void setCamImgList(List<String> newImgFileList) {
		this.camImgList = newImgFileList;
		camImgPath = String.join("|", newImgFileList.toArray(new String[newImgFileList.size()]));
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

	public int getGoalPrice() {
		return goalPrice;
	}

	public void setGoalPrice(int goalPrice) {
		this.goalPrice = goalPrice;
	}

	public int getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}

	public int getMaxPrice() {
		return maxPrice;
	}

	public void setMaxPrice(int maxPrice) {
		this.maxPrice = maxPrice;
	}

	public int getCamRewardStatus() {
		return camRewardStatus;
	}

	public void setCamRewardStatus(int camRewardStatus) {
		this.camRewardStatus = camRewardStatus;
	}

	public String getCamRegiDate() {
		return camRegiDate;
	}

	public void setCamRegiDate(String camRegiDate) {
		this.camRegiDate = camRegiDate;
	}
}
