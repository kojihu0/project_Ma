package com.project_Ma.home.VO;

public class CamCommentVO {
	private int commentNo;
	private String userid;
	private int camNo;
	private int commentParentNo;
	private String commentContent;
	private String commentDate;
	
	public CamCommentVO() {
		
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
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

	public int getCommentParentNo() {
		return commentParentNo;
	}

	public void setCommentParentNo(int commentParentNo) {
		this.commentParentNo = commentParentNo;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public String getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
}
