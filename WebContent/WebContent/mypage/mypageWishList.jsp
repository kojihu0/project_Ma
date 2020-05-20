<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<ul class="flex mpMenu">
			  <li class="flex-1 mr-2">
			    <a class="text-center block border border-blue-light rounded py-3 px-5 bg-danger hover:bg-danger-dark text-white" href="<%=projectPath %>/mypage/mypage.jsp">내 정보</a>
			  </li>
			  <li class="flex-1 mr-2">
			    <a class="text-center block border border-blue-light rounded py-3 px-5 bg-danger hover:bg-danger-dark text-white" href="<%=projectPath %>/mypage/mypageSpon.jsp">후원 목록</a>
			  </li>
			  <li class="flex-1 mr-2">
			    <a class="text-center block border border-blue-light rounded py-3 px-5 bg-danger-dark hover:bg-danger-dark text-white" href="<%=projectPath %>/mypage/mypageWishList.jsp">위시 리스트</a>
			  </li>
			 </ul>
		 	 
		<!-- 위시리스트 -->
		<div id="wishList" >	
		<div id="explain"  class="w-full max-w-screen-xl my-2 mx-auto border-solid border-gray border-b  my-1 text-4xl py-4">위시리스트</div>
	 		<div style="border:1px red solid" class="informationFrm flex -mx-2 flex-wrap">
	 		<!-- 첫번째 이미지 -->
			 <div style="height :335px ; width:275px" id ="dokdo" class=" max-w-xs rounded overflow-hidden shadow-lg xs:flex ">
				  <a href="<%=projectPath %>/campaign/detail_Campaign.jsp"><img  class="w-full " src="<%=projectPath %>/img/img_List/culture.jpg"></a>
				  <div style="height:100px; "class="px-6 py-4 ">
				    <div class="font-medium text-xl mb-2">  <a href="<%=projectPath %>/campaign/campaign_detail.html">훼손된 문화재 복원을 위한 후원 펀딩 </a></div>
				  </div>
				  <div class="px-6 py-4">
					<div class="relative w-full h-2 rounded-md bg-info-light">
                        <div class="absolute w-1/5 h-full border-solid border-gray border bg-danger rounded-md">
                        </div>
                    </div>
				  </div>
				  <div class="text-danger font-bold" style="font-size:11px;float:right;margin-right:10px">10일남음</div>
				</div>
				<!-- 두번째 이미지 -->		
				<div style="height :335px ; width:275px" id ="dokdo" class=" max-w-xs rounded overflow-hidden shadow-lg xs:flex ">
				 <a href="<%=projectPath %>/campaign/detail_Campaign.jsp"><img  class="w-full " src="<%=projectPath %>/img/img_List/dokdo.jpg"></a>
				  <div style="height:100px; "class="px-6 py-4 ">
				    <div class="font-medium text-xl mb-2"> <a href="<%=projectPath %>/campaign/detail_Campaign.jsp">전세계에 독도알리기 후원</a></div>
				  </div>
				  <div class="px-6 py-4">
					<div class="relative w-full h-2 rounded-md bg-info-light">
                        <div class="absolute w-1/5 h-full border-solid border-gray border bg-danger rounded-md">
                        </div>
                    </div>
				  </div>
				  <div class="text-danger font-bold" style="font-size:11px;float:right;margin-right:10px">20일남음</div>
				</div>
				
				<!-- 세번째 이미지 -->
				<div style="height :335px ; width:275px" id ="dokdo" class=" max-w-xs rounded overflow-hidden shadow-lg xs:flex ">
				<a href="<%=projectPath %>/campaign/detail_Campaign.jsp"><img  class="w-full " src="/project_Ma/img/img_List/medical2.jpg"></a>
				  <div style="height:100px; "class="px-6 py-4 ">
				    <div class="font-medium text-xl mb-2"> <a href="<%=projectPath %>/campaign/detail_Campaign.jsp">의료지원을 받지 못하는 소외계층을 위한 후원</a></div>
				  </div>
				  <div class="px-6 py-4">
					<div class="relative w-full h-2 rounded-md bg-info-light">
                        <div class="absolute w-1/5 h-full border-solid border-gray border bg-danger rounded-md">
                        </div>
                    </div>
				  </div>
				  <div class="text-danger font-bold" style="font-size:11px;float:right;margin-right:10px">6일남음</div>
				</div>
				
				<!-- 네번째 이미지 -->
				<div style="height :335px ; width:275px" id ="dokdo" class=" max-w-xs rounded overflow-hidden shadow-lg xs:flex ">
				  <a href="<%=projectPath %>/campaign/detail_Campaign.jsp"><img  class="w-full " src="/project_Ma/img/img_List/tree5.jpg"></a>
				  <div style="height:100px; "class="px-6 py-4 ">
				    <div class="font-medium text-xl mb-2"> <a href="<%=projectPath %>/campaign/detail_Campaign.jsp">자연을 살리기위한 나무심기 후원 </a></div>
				  </div>
				  <div class="px-6 py-4">
					<div class="relative w-full h-2 rounded-md bg-info-light">
                        <div class="absolute w-1/5 h-full border-solid border-gray border bg-danger rounded-md">
                        </div>
                    </div>
				  </div>
				  <div class="text-danger font-bold" style="font-size:11px;float:right;margin-right:10px">6일남음</div>
				</div>
				
				<!-- 다섯째 이미지 -->
				<div style="height :335px ; width:275px" id ="dokdo" class=" max-w-xs rounded overflow-hidden shadow-lg xs:flex ">
				 <a href="<%=projectPath %>/campaign/detail_Campaign.jsp"><img  class="w-full " src="/project_Ma/img/img_List/women_in_war.jpg"></a>
				  <div style="height:100px; "class="px-6 py-4 ">
				    <div class="font-medium text-xl mb-2"> <a href="<%=projectPath %>/campaign/detail_Campaign.jsp">역사를 잊지말자!!</a></div>
				  </div>
				  <div class="px-6 py-4">
					<div class="relative w-full h-2 rounded-md bg-info-light">
                        <div class="absolute w-1/5 h-full border-solid border-gray border bg-danger rounded-md">
                        </div>
                    </div>
				  </div>
				  <div class="text-danger font-bold" style="font-size:11px;float:right;margin-right:10px">6일남음</div>
				</div>
				
				<!-- 여섯번째 이미지 -->
				<div style="height :335px ; width:275px" id ="dokdo" class=" max-w-xs rounded overflow-hidden shadow-lg xs:flex ">
				 <a href="<%=projectPath %>/campaign/detail_Campaign.jsp"><img  class="w-full " src="/project_Ma/img/img_List/boyukwon2.jpg"></a>
				  <div style="height:100px; "class="px-6 py-4 ">
				    <div class="font-medium text-xl mb-2">  <a href="<%=projectPath %>/campaign/campaign_detail.html">저소득층 계층을 위한 후원</a></div>
				  </div>
				  <div class="px-6 py-4">
					<div class="relative w-full h-2 rounded-md bg-info-light">
                        <div class="absolute w-1/5 h-full border-solid border-gray border bg-danger rounded-md">
                        </div>
                    </div>
				  </div>
				  <div class="text-danger font-bold" style="font-size:11px;float:right;margin-right:10px">6일남음</div>
				</div>
				
				<!-- 일곱번째 이미지 -->
				<div style="height :335px ; width:275px" id ="dokdo" class=" max-w-xs rounded overflow-hidden shadow-lg xs:flex ">
				<a href="<%=projectPath %>/campaign/detail_Campaign.jsp"><img  class="w-full " src="<%=projectPath %>/img/img_List/africa.jpg"></a>
				  <div style="height:100px; "class="px-6 py-4 ">
				    <div class="font-medium text-xl mb-2">  <a href="<%=projectPath %>/campaign/detail_Campaign.jsp">기아로 허덕이는 아프리카 주민들을 위한 후원</a></div>
				  </div>
				  <div class="px-6 py-4">
					<div class="relative w-full h-2 rounded-md bg-info-light">
                        <div class="absolute w-1/5 h-full border-solid border-gray border bg-danger rounded-md">
                        </div>
                    </div>
				  </div>
				  <div class="text-danger font-bold" style="font-size:11px;float:right;margin-right:10px">6일남음</div>
				</div>
				
				<!-- 여덟번째 이미지 -->
				<div style="height :335px ; width:275px" id ="dokdo" class=" max-w-xs rounded overflow-hidden shadow-lg xs:flex ">
				  <a href="<%=projectPath %>/campaign/detail_Campaign.jsp"><img  class="w-full " src="<%=projectPath %>/img/img_List/culture.jpg"></a>
				  <div style="height:100px; "class="px-6 py-4 ">
				    <div class="font-medium text-xl mb-2">  <a href="<%=projectPath %>/campaign/detail_Campaign.jsp">문화재 복원 후원</a></div>
				  </div>
				  <div class="px-6 py-4">
					<div class="relative w-full h-2 rounded-md bg-info-light">
                        <div class="absolute w-1/5 h-full border-solid border-gray border bg-danger rounded-md">
                        </div>
                    </div>
				  </div>
				  <div class="text-danger font-bold" style="font-size:11px;float:right;margin-right:10px">6일남음</div>
				</div>
				
			</div><!-- flex 박스 설정 -->
		</div><!-- 위시리스트 -->
		

		<div class="page_up_div text-2xl border border-gray text-center rounded h-12 w-12 bg-black opacity-75 text-white">
					<a id="scrollToTop" class="align-middle" href="#"><i class="xi-angle-up"></i></a>  
			</div>         
		 
</body>
</html>