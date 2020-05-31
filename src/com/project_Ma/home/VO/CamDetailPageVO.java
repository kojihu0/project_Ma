package com.project_Ma.home.VO;

public class CamDetailPageVO {

	public CamDetailPageVO() {
		
	}
	
	//페이징용 변수
		private int 	pageNum = 1;		//현재 페이지
		private int 	onePageRecord = 4;	//한 페이지에 들어가는 레코드의 수
		private int 	cmTotalPage;			//총 페이지의 수
		private int 	qnaTotalPage;			//총 페이지의 수
		private int 	cmTotalRecord;		//총 레코드의 수(질문의 수)
		private int 	qnaTotalRecord;		//총 레코드의 수(질문의 수)
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

		public int getCmTotalPage() {
			return cmTotalPage;
		}

		public void setCmTotalPage(int cmTotalPage) {
			this.cmTotalPage = cmTotalPage;
		}

		public int getQnaTotalPage() {
			return qnaTotalPage;
		}

		public void setQnaTotalPage(int qnaTotalPage) {
			this.qnaTotalPage = qnaTotalPage;
		}

		public int getCmTotalRecord() {
			return cmTotalRecord;
		}

		public void setCmTotalRecord(int cmTotalRecord) {
			this.cmTotalRecord = cmTotalRecord;
			//총 페이지 = 전체 질문 수 / 한페이지에 보여주는 질문수
			cmTotalPage = (int)Math.ceil((double)cmTotalRecord / onePageRecord);

			//전체 질문을 4로 나누었을 때, 그 나머지가 0이라먄.
			//즉 4로 딱 떨어지면
			if(cmTotalRecord % 4 == 0) {
				//마지막 페이지의 레코드 수는 = 한 페이지의 레코드 수와 같고
				lastPageRecord = onePageRecord;
			}else { 
				//만약 딱 떨어지지 않으면
				//마지막 레코드의 수는 = 전체 질문을 한 페이지에 보이는 질문수로 나눈 나머지.
				lastPageRecord = cmTotalRecord % onePageRecord;
			}
			
			System.out.println("totalPage이게 왜 0이 나와 =  " + cmTotalPage);
		}

		public int getQnaTotalRecord() {
			return qnaTotalRecord;
		}

		public void setQnaTotalRecord(int qnaTotalRecord) {
			this.qnaTotalRecord = qnaTotalRecord;
			//총 페이지 = 전체 질문 수 / 한페이지에 보여주는 질문수
			qnaTotalPage = (int)Math.ceil((double)qnaTotalRecord / onePageRecord);

			//전체 질문을 4로 나누었을 때, 그 나머지가 0이라먄.
			//즉 4로 딱 떨어지면
			if(qnaTotalRecord % 4 == 0) {
				//마지막 페이지의 레코드 수는 = 한 페이지의 레코드 수와 같고
				lastPageRecord = onePageRecord;
			}else { 
				//만약 딱 떨어지지 않으면
				//마지막 레코드의 수는 = 전체 질문을 한 페이지에 보이는 질문수로 나눈 나머지.
				lastPageRecord = qnaTotalRecord % onePageRecord;
			}
			
			System.out.println("totalPage이게 왜 0이 나와 =  " + qnaTotalPage);
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
