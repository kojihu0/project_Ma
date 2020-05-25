package com.project_Ma.home.VO;

public class RewardVO {
	private int rewardNo;
	private int camNo;
	private String rewardName;
	private int rewardQuantity;
	private int rewardPrice;
	private String rewardContent;
	private String deliveryExYear;
	private String deliveryExMonth;
	private String deliveryExDate;
	private String deliveryExDateDetail;
	private int deliveryPrice;
	
	public RewardVO() {
		// TODO Auto-generated constructor stub
	}

	public int getRewardNo() {
		return rewardNo;
	}

	public void setRewardNo(int rewardNo) {
		this.rewardNo = rewardNo;
	}

	public int getCamNo() {
		return camNo;
	}

	public void setCamNo(int camNo) {
		this.camNo = camNo;
	}

	public String getRewardName() {
		return rewardName;
	}

	public void setRewardName(String rewardName) {
		this.rewardName = rewardName;
	}

	public int getRewardQuantity() {
		return rewardQuantity;
	}

	public void setRewardQuantity(int rewardQuantity) {
		this.rewardQuantity = rewardQuantity;
	}

	public int getRewardPrice() {
		return rewardPrice;
	}

	public void setRewardPrice(int rewardPrice) {
		this.rewardPrice = rewardPrice;
	}

	public String getRewardContent() {
		return rewardContent;
	}

	public void setRewardContent(String rewardContent) {
		this.rewardContent = rewardContent;
	}
	
	public String getDeliveryExYear() {
		return deliveryExYear;
	}

	public void setDeliveryExYear(String deliveryExYear) {
		this.deliveryExYear = deliveryExYear;
	}

	public String getDeliveryExMonth() {
		return deliveryExMonth;
	}

	public void setDeliveryExMonth(String deliveryExMonth) {
		this.deliveryExMonth = deliveryExMonth;
	}

	public String getDeliveryExDate() {
		deliveryExDate = deliveryExYear + "-" + deliveryExMonth;
		return deliveryExDate;
	}

	public void setDeliveryExDate(String deliveryExDate) {
		String[] splitDate = deliveryExDate.split("-");
		deliveryExYear = splitDate[0];
		deliveryExMonth = splitDate[1];
		this.deliveryExDate = deliveryExDate;
	}

	public String getDeliveryExDateDetail() {
		return deliveryExDateDetail;
	}

	public void setDeliveryExDateDetail(String deliveryExDateDetail) {
		this.deliveryExDateDetail = deliveryExDateDetail;
	}

	public int getDeliveryPrice() {
		return deliveryPrice;
	}

	public void setDeliveryPrice(int deliveryPrice) {
		this.deliveryPrice = deliveryPrice;
	}
	
}
