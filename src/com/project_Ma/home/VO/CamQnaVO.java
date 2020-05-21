package com.project_Ma.home.VO;

public class CamQnaVO {
	private int commentNo;
	private String userid;
	private int camNo;
	private int commentParentNo;
	private String commentContent;
	private String commmentDate;
	
	public CamQnaVO() {
		// TODO Auto-generated constructor stub
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

	public String getCommmentDate() {
		return commmentDate;
	}

	public void setCommmentDate(String commmentDate) {
		this.commmentDate = commmentDate;
	}
	
	
}
