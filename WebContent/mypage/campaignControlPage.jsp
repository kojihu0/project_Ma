<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<ul class="mpMenu flex">
	  <li class="flex-1 mr-2">
	    <a class="text-center block border  rounded py-3 px-5 bg-danger hover:bg-danger-dark text-white" href="<%=projectPath %>/mypage/coporatePage.do">법인 정보</a>
	  </li>
	  <li class="flex-1 mr-2">
	    <a class="text-center block border  rounded py-3 px-5 bg-danger-dark hover:bg-danger-dark text-white" href="<%=projectPath %>/mypage/campaignControlPage.do">캠페인 관리</a>
	  </li>
	  <li class="flex-1 mr-2">
	    <a class="text-center block border  rounded py-3 px-5 bg-danger hover:bg-danger-dark text-white" href="<%=projectPath%>/mypage/campaignWrite.do">캠페인 등록</a>
	  </li>
	   <li class="flex-1 mr-2">
	    <a class="text-center block border border-blue-500 rounded py-3 px-5 bg-danger hover:bg-danger-dark text-white" href="<%=projectPath %>/mypage/copor_Spon.do">후원 목록</a>
	  </li>
	  <li class="flex-1 mr-2">
	    <a class="text-center block border border-blue-500 rounded py-3 px-5 bg-danger hover:bg-danger-dark text-white" href="<%=projectPath %>/mypage/copor_WishList.do">위시 리스트</a>
	  </li>
	</ul>
	 <!--캠페인관리-->

 	<div id="explain" class="w-full max-w-screen-xl my-2 mx-auto border-solid border-gray border-b  my-1 text-4xl py-4">
 		캠페인 관리
 	</div>
 	
 		<c:forEach var="vo" items="${list}">
			<div class="w-full max-w-4xl mx-auto my-8">
				<div class="max-w-sm w-full lg:max-w-full lg:flex mb-8">
		  			<div class="w-1/3 flex-none bg-cover rounded-t rounded-t-none rounded-l text-center overflow-hidden" title="Woman holding a mug">
						<a href="<%=projectPath%>/mypage/campaignUpdate.do?cam_no=${vo.cam_no}"><img class="w-full h-full object-cover"src="<%=projectPath%>/img/${vo.cam_img}"/></a> 			 
		  			</div>
		  			<a href="<%=projectPath %>/mypage/campaign">
		 		 <div class="w-2/3 border-r border-b border-l border-gray-light border-l-0 border-t border-gray-light bg-white rounded-b rounded-b-none rounded-r p-4 flex flex-col justify-between leading-normal">
		 		 <a href="<%=projectPath%>/mypage/campaignUpdate.do?cam_no=${vo.cam_no}">
		    		<div>
				      <p class="text-sm text-gray-darker flex items-center">
				     	<div  class="font-bold text-xl mb-2">${vo.cam_title}</div>
				      <p class="text-gray text-base">${vo.cam_desc}</p>
		   			  <p class="mt-4 text-gray-darkest">목표금액:${vo.cam_goal_price}원 &nbsp;&nbsp;&nbsp;&nbsp;등록 날짜:${vo.cam_start}</p>
		       		  <div class="relative w-full h-2 rounded-md bg-info-light mt-8">
		             	<div class="absolute w-1/5 h-full border-solid border-gray border bg-danger rounded-md"></div>
		             	<label class="text-danger font-semibold" style="font-size:14px;float:right;margin-top:15px">6일남음</label>
		             	
			    	  </div>
			  		</div>
			  		</a>
			  		<a href="<%=projectPath%>/mypage/campaignUpdate.do?cam_no=${vo.cam_no}" style="margin-top:10px" class=" text-gray">수정하기</a>
			 	</div>
		 		</div>
			</div>
			
		</c:forEach>
</body>
</html>
