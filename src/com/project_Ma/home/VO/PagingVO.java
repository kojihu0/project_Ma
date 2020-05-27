package com.project_Ma.home.VO;

public class PagingVO {
	private int pageNum=1;//현재페이지
	private int onePageRecord=6;//한페이지에 출력 할 레코드수
	private int totalRecord;//총레코드수
	private int totalPage;//총페이지수
	private int startPage=1;//시작페이지 번호
	private int onePageCount=5;//한번에 출력 할 페이지갯수
	private int lastPageRecords=6;//마지막페이지의 남아 있는 레코드수
	
	private String arrayKey;//레코드 정렬 기준

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		//시작페이지 계산
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
		//총페이지 수
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
