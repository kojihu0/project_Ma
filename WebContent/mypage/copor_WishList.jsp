<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul class="mpMenu flex">
	  <li class="flex-1 mr-2">
	    <a class="text-center block border border-blue-500 rounded py-3 px-5 bg-danger hover:bg-danger-dark text-white" href="<%=projectPath%>/mypage/coporatePage.do">법인 정보</a>
	  </li>
	  <li class="flex-1 mr-2">
	    <a class="text-center block border border-blue-500 rounded py-3 px-5 bg-danger hover:bg-danger-dark text-white" href="<%=projectPath%>/mypage/campaignControlPage.do">캠페인 관리</a>
	  </li>
	  <li class="flex-1 mr-2">
	    <a class="text-center block border border-blue-500 rounded py-3 px-5 bg-danger hover:bg-danger-dark text-white" href="<%=projectPath%>/mypage/campaignWrite.do">캠페인 등록</a>
	  </li>
	   <li class="flex-1 mr-2">
	    <a class="text-center block border border-blue-500 rounded py-3 px-5 bg-danger hover:bg-danger-dark text-white" href="<%=projectPath %>/mypage/copor_Spon.do">후원 목록</a>
	  </li>
	  <li class="flex-1 mr-2">
	    <a class="text-center block border border-blue-500 rounded py-3 px-5 bg-danger-dark hover:bg-danger-dark text-white" href="<%=projectPath %>/mypage/copor_WishList.do">위시 리스트</a>
	  </li>
	 </ul>
<!-- 위시리스트 -->
	<form id="wishList"action="<%=projectPath%>/mypage/wishListDel.do">	
		<div id="explain"  class="w-full max-w-screen-xl my-2 mx-auto border-solid border-gray border-b  my-1 text-4xl py-4">위시리스트</div>
		<div style="border:1px lightgray solid" class="informationFrm flex -mx-2 flex-wrap">
		
			<c:forEach var="vo" items="${list}">
				 <div style="height :335px ; width:275px" id ="dokdo" class=" max-w-xs rounded overflow-hidden shadow-lg xs:flex ">
				 	<input type="submit" id="delete"style="width:20px;height:20px;display:none"class="WL-checkbox absolute" name="cam_no" value="${vo.cam_no}">
				 	<label style="margin-left:255px;cursor:pointer" for="delete">X</label>
					  <a href="<%=projectPath%>/campaign/detail_Campaign.do?cam_no=${vo.cam_no}"><img class="w-full"src="<%=projectPath%>/img/img_main/${vo.cam_img}"></a>
					  <div style="height:100px;"class="px-6 py-4">
					    <div class="font-medium text-xl mb-2"> <a href="<%=projectPath%>/campaign/detail_Campaign.do?cam_no=${vo.cam_no}">${vo.cam_title}</a></div>
					  </div>
					  <div class="px-6 py-4">
						<div class="relative w-full h-2 rounded-md bg-info-light">
			            <div class="absolute w-1/5 h-full border-solid border-gray border bg-danger rounded-md">
			            </div>
			           </div>
					  </div>
					<div class="text-danger font-bold" style="font-size:11px;float:right;margin-right:10px">10일남음</div>
				</div>
			</c:forEach>
			
		</div><!-- flex 박스 설정 -->
	</form><!-- 위시리스트 -->
	<!--위로가기 icon  -->
</body>
</html>