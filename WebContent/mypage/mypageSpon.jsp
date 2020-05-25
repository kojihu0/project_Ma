<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul class="flex mpMenu">
			  <li class="flex-1 mr-2">
			    <a class="text-center block border border-blue-500 rounded py-3 px-5 bg-danger hover:bg-danger-dark text-white" href="<%=projectPath %>/mypage/mypage.jsp">내 정보</a>
			  </li>
			  <li class="flex-1 mr-2">
			    <a class="text-center block border border-blue-500 rounded py-3 px-5 bg-danger-dark hover:bg-danger-dark text-white" href="<%=projectPath %>/mypage/mypageSpon.jsp">후원 목록</a>
			  </li>
			  <li class="flex-1 mr-2">
			    <a class="text-center block border border-blue-500 rounded py-3 px-5 bg-danger hover:bg-danger-dark text-white" href="<%=projectPath %>/mypage/mypageWishList.jsp">위시 리스트</a>
			  </li>
			 </ul>
			 <div class="max-w-full w-full mt-8">
		 	 	<div id="explain" class="w-full max-w-screen-xl my-2 mx-auto border-solid border-gray border-b  my-1 text-4xl py-4">후원 목록</div>
	 		</div>
	 		
		<!-- 후원상품 -->
	
		
		<div class="w-full max-w-4xl mx-auto my-8">
			<div class="max-w-sm w-full lg:max-w-full lg:flex mb-8">
			  <div class="w-1/3 flex-none bg-cover rounded-t rounded-t-none rounded-l text-center overflow-hidden" title="Woman holding a mug">
					<img class="w-full h-full object-cover"src="/project_Ma/img/img_List/africa.jpg"/> 			 
			  </div>
			  <div class="w-2/3 border-r border-b border-l border-gray-light border-l-0 border-t border-gray-light bg-white rounded-b rounded-b-none rounded-r p-4 flex flex-col justify-between leading-normal">
			    <div>
			      <p class="text-sm text-gray-darker flex items-center">
			     <div class="font-bold text-xl mb-2">기아에 허덕이는 아프리카 국민들을 위한 펀딩 프로젝트</div>
			      <p class="text-gray text-base">
			      	1984년부터 지금까지 아프리카는 기아에 허덕이고 있습니다. 
			    	5억명의 아프리카 인구 중 2억 명이 기아에 허덕이고 있으며, 매일 수백 명씩 죽어가고 있다고 합니다 
			    	이러한 아프리카 국민들을 위해 조금이나마 도움이 되기 위해 자선펀딩 프로젝트를 진행하게 되었습니다. 
			      </p>
			      <p class="mt-4 text-gray-darkest">후원 금액: 10000원&nbsp;&nbsp;&nbsp;&nbsp;후원 날짜: 4월 30일</p>
			       <div class="relative w-full h-2 rounded-md bg-info-light mt-8">
                        <div class="absolute w-1/5 h-full border-solid border-gray border bg-danger rounded-md"></div>
                        <label class="text-danger font-semibold" style="font-size:14px;float:right;margin-top:15px">6일남음</label>
			    	</div>
			  	</div>
			   </div>
		 	 </div>
		
		
	
		  
			<!-- 두번째 후원 -->
			<div class="max-w-sm w-full lg:max-w-full lg:flex mb-8">
			  <div class="w-1/3 flex-none bg-cover rounded-t rounded-t-none rounded-l text-center overflow-hidden" title="Woman holding a mug">
					<img class="w-full h-full object-cover"src="/project_Ma/img/img_List/africa.jpg"/> 			 
			  </div>
			  <div class="w-2/3 border-r border-b border-l border-gray-light border-l-0 border-t border-gray-light bg-white rounded-b rounded-b-none rounded-r p-4 flex flex-col justify-between leading-normal">
			    <div>
			      <p class="text-sm text-gray-darker flex items-center">
			     <div class="font-bold text-xl mb-2">기아에 허덕이는 아프리카 국민들을 위한 펀딩 프로젝트</div>
			      <p class="text-gray text-base">
			      	1984년부터 지금까지 아프리카는 기아에 허덕이고 있습니다. 
			    	5억명의 아프리카 인구 중 2억 명이 기아에 허덕이고 있으며, 매일 수백 명씩 죽어가고 있다고 합니다 
			    	이러한 아프리카 국민들을 위해 조금이나마 도움이 되기 위해 자선펀딩 프로젝트를 진행하게 되었습니다. 
			      </p>
			      <p class="mt-4 text-gray-darkest">후원 금액: 10000원&nbsp;&nbsp;&nbsp;&nbsp;후원 날짜: 4월 30일</p>
			       <div class="relative w-full h-2 rounded-md bg-info-light mt-8">
                        <div class="absolute w-1/5 h-full border-solid border-gray border bg-danger rounded-md">
                        </div>
                        <label class="text-danger font-semibold" style="font-size:14px;float:right;margin-top:15px">6일남음</label>
			    	</div>
			  	</div>
			   </div>
		 	 </div>
		 <!-- 위로 이동 -->  
			<div class="page_up_div text-2xl border border-gray text-center rounded h-12 w-12 bg-black opacity-75 text-white">
				<a id="scrollToTop" class="align-middle" href="#"><i class="xi-angle-up"></i></a>  
			</div>           	 
		 </div><!-- 후원목록크기 -->
		 <div class="page_up_div text-2xl border border-gray text-center rounded h-12 w-12 bg-black opacity-75 text-white">
					<a id="scrollToTop" class="align-middle" href="#"><i class="xi-angle-up"></i></a>  
			</div>         
		 
		 
		 
</body>
</html>