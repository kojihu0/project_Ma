package com.project_Ma.home.VO;

public class PagingVO {
	private int pageNum=1;//����������
	private int onePageRecord=6;//���������� ��� �� ���ڵ��
	private int totalRecord;//�ѷ��ڵ��
	private int totalPage;//����������
	private int startPage=1;//���������� ��ȣ
	private int onePageCount=5;//�ѹ��� ��� �� ����������
	private int lastPageRecords=6;//�������������� ���� �ִ� ���ڵ��
	
	private String arrayKey;//���ڵ� ���� ����

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		//���������� ���
		startPage = ((pageNum-1)/onePageCount)*onePageCount+1;
	}

	public int getOnePageRecord() {
		return onePageRecord;
	}

	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		//�������� ��
		totalPage = (int)Math.ceil((double)totalRecord/onePageRecord);
		if(totalRecord%onePageRecord==0) {
			lastPageRecords = onePageRecord;
		}else {
			lastPageRecords = totalRecord%onePageRecord;
		}
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getOnePageCount() {
		return onePageCount;
	}

	public void setOnePageCount(int onePageCount) {
		this.onePageCount = onePageCount;
	}

	public int getLastPageRecords() {
		return lastPageRecords;
	}

	public void setLastPageRecords(int lastPageRecords) {
		this.lastPageRecords = lastPageRecords;
	}

	public String getArrayKey() {
		return arrayKey;
	}

	public void setArrayKey(String arrayKey) {
		this.arrayKey = arrayKey;
	}
	
	
}
