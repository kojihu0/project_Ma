package com.project_Ma.home.VO;

public class MainQnAPageVO {

	public MainQnAPageVO() {
		
	}
	
	//페이징용 변수
		private int 	pageNum = 1;		//현재 페이지
		private int 	onePageRecord = 4;	//한 페이지에 들어가는 레코드의 수
		private int 	totalPage;			//총 페이지의 수
		private int 	totalRecord;		//총 레코드의 수(질문의 수)
		private int 	startPage = 1;		//페이지 시작
		private int 	pageCount = 4;		//출력되는 페이지의 수
		private int 	lastPageRecord = 4; //마지막 페이지에 남아있는 레코드의 수
		
		public int getPageNum() {
			return pageNum;
		}



		public void setPageNum(int pageNum) {
			this.pageNum = pageNum;
		}



		public int getOnePageRecord() {
			return onePageRecord;
		}



		public void setOnePageRecord(int onePageRecord) {
			this.onePageRecord = onePageRecord;
		}



		public int getTotalPage() {
			return totalPage;
		}



		public void setTotalPage(int totalPage) {
			this.totalPage = totalPage;
		}



		public int getTotalRecord() {
			return totalRecord;
		}



		public void setTotalRecord(int totalRecord) {
			this.totalRecord = totalRecord;
			//총 페이지 = 전체 질문 수 / 한페이지에 보여주는 질문수
			totalPage = (int)Math.ceil((double)totalRecord / onePageRecord);

			//전체 질문을 4로 나누었을 때, 그 나머지가 0이라먄.
			//즉 4로 딱 떨어지면
			if(totalRecord % 4 == 0) {
				//마지막 페이지의 레코드 수는 = 한 페이지의 레코드 수와 같고
				lastPageRecord = onePageRecord;
			}else { 
				//만약 딱 떨어지지 않으면
				//마지막 레코드의 수는 = 전체 질문을 한 페이지에 보이는 질문수로 나눈 나머지.
				lastPageRecord = totalRecord % onePageRecord;
			}
			
			System.out.println("totalPage이게 왜 0이 나와 =  " + totalPage);
		}

		public int getStartPage() {
			return startPage;
		}



		public void setStartPage(int startPage) {
			this.startPage = startPage;
			
			//시작 페이지 계산.
			startPage = ((pageNum - 1) / pageCount ) * pageCount + 1;
		}



		public int getPageCount() {
			return pageCount;
		}



		public void setPageCount(int pageCount) {
			this.pageCount = pageCount;
		}



		public int getLastPageRecord() {
			return lastPageRecord;
		}



		public void setLastPageRecord(int lastPageRecord) {
			this.lastPageRecord = lastPageRecord;
		}


}
