<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<ul class="flex mpMenu">
	<li class="flex-1 mr-2">
	    <a class="text-center block border border-blue-500 rounded py-3 px-5 bg-danger hover:bg-danger-dark text-white" href="<%=projectPath %>/mypage/mypage.do">내 정보</a>
	</li>
	<li class="flex-1 mr-2">
	  <a class="text-center block border border-blue-500 rounded py-3 px-5 bg-danger-dark hover:bg-danger-dark text-white" href="<%=projectPath %>/mypage/mypageSpon.do">후원 목록</a>
	</li>
	<li class="flex-1 mr-2">
	  <a class="text-center block border border-blue-500 rounded py-3 px-5 bg-danger hover:bg-danger-dark text-white" href="<%=projectPath %>/mypage/mypageWishList.do">위시 리스트</a>
	</li>
</ul>
<div class="max-w-full w-full mt-8">
 	<div id="explain" class="w-full max-w-screen-xl my-2 mx-auto border-solid border-gray border-b  my-1 text-4xl py-4">후원 목록</div>
</div>
	 		
<!-- 후원상품 -->
<c:forEach var="vo" items="${list }">
<div class="w-full max-w-4xl mx-auto my-8">
	<div class="max-w-sm w-full lg:max-w-full lg:flex mb-8">
	  <div class="w-1/3 flex-none bg-cover rounded-t rounded-t-none rounded-l text-center overflow-hidden" title="Woman holding a mug">
		<img class="w-full h-full object-cover"src="<%=projectPath%>/img/campaign/${vo.cam_img}"/> 			 
	  </div>
	  <div class="w-2/3 border-r border-b border-l border-gray-light border-l-0 border-t border-gray-light bg-white rounded-b rounded-b-none rounded-r p-4 flex flex-col justify-between leading-normal">
	    <div>
	      <p class="text-sm text-gray-darker flex items-center">
	     	<div class="font-bold text-xl mb-2">${vo.cam_title}</div>
	      <p class="text-gray text-base">
	      ${vo.cam_desc}
	      </p>
	      <p class="mt-4 text-gray-darkest">후원 금액:${vo.funding_price}원 &nbsp;&nbsp;&nbsp;&nbsp;후원 날짜:${vo.donate_date} </p>
	  	</div>
	   </div>
 	 </div>
 </div>
</c:forEach>
		
<!-- 위로 이동 -->  
<div class="page_up_div text-2xl border border-gray text-center rounded h-12 w-12 bg-black opacity-75 text-white">
	<a id="scrollToTop" class="align-middle" href="#"><i class="xi-angle-up"></i></a>  
</div>    
	
<div class="page_up_div text-2xl border border-gray text-center rounded h-12 w-12 bg-black opacity-75 text-white">
	<a id="scrollToTop" class="align-middle" href="#"><i class="xi-angle-up"></i></a>  
</div>         