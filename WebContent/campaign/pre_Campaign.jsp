<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	$(function(){
		$("#arrayKey").on("change", function(){
			location.href="<%=projectPath%>/campaign/pre_Campaign.do?arrayKey="+$(this).val();
		});
	});
</script>
<body>

	<div id="explain" class="w-full max-w-screen-xl my-2 mx-auto border-solid border-gray border-b  my-1 text-4xl py-4">일정보기</div>
	    <div class="w-full max-w-screen-xl my-2 mx-auto">
		    <div class="inline-block relative w-40 my-10">
				  <select  name="arrayKey" id="arrayKey" class="block appearance-none w-full bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline">
				    <option value="cam_no" <c:if test="${pageVO.arrayKey=='cam_no'}">selected</c:if>>최신순</option>
				    <option value="cam_goal_price"<c:if test="${pageVO.arrayKey=='cam_goal_price'}">selected</c:if>>펀딩금액순</option>
				    <option value="cam_end"<c:if test="${pageVO.arrayKey=='cam_end'}">selected</c:if>>마감순</option>
			  	  </select>
			  	    <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
	    				<svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/></svg>
	  				</div>
			 </div>
		 </div> 
		<div id="total" class="w-full max-w-screen-xl my-0 mx-auto flex flex-wrap mb-12">
				<c:forEach var="vo" items="${list}">
					<div class=" w-1/3 px-4 mb-12"> 
						<a class="block" href="<%=projectPath%>/campaign/detail_Campaign.do?cam_no=${vo.cam_no}&pageNum=${pageVO.pageNum}<c:if test='${pageVO.arrayKey!=null}'>&arraykey=${pageVO.arrayKey}</c:if>">
							<img class="h-64 w-full object-cover" src="<%=projectPath%>/img/campaign/${vo.cam_img}" class="rounded-md"/>
						</a>
							<div class=" truncate text-2xl my-2 hover:text-danger"><a href="<%=projectPath%>/campaign/detail_Campaign.do?cam_no=${vo.cam_no}&pageNum=${pageVO.pageNum}<c:if test='${pageVO.arrayKey!=null}'>&arraykey=${pageVO.arrayKey}</c:if>">${vo.cam_title}</a></div>
						
							<div class="relative w-full h-2 rounded-md bg-info-light">
								<div class="absolute h-full border-solid border-gray border bg-danger rounded-md" style="width:${vo.percent}%"></div>
							</div> 
							<div class="my-1">
								${vo.cam_end}<span class="float-right text-danger">${vo.cam_remainday}일 남음</span>
								
							</div> 
					  </div>
				</c:forEach>
			</div>
			<div class="w-full max-w-screen-xl my-0 mx-auto mb-12">
				<ul class="flex justify-center" id="page">
					<c:if test="${pageVO.pageNum==1}">
						<li><i class="xi-angle-left"></i></li>
					</c:if>
					<c:if test="${pageVO.pageNum!=1}">
						<li class="hover:text-danger"><a href="<%=projectPath%>/campaign/pre_Campaign.do?pageNum=${pageVO.pageNum-1}<c:if test='${pageVO.arrayKey!=null}'>&arrayKey=${pageVO.arrayKey}</c:if>"><i class="xi-angle-left"></i></a></li>
					</c:if>
					<c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.startPage + pageVO.onePageCount-1}">
						<c:if test="${i<=pageVO.totalPage}">
							<li class="hover:text-danger"><a href="<%=projectPath%>/campaign/pre_Campaign.do?pageNum=${i}<c:if test='${pageVO.arrayKey!=null}'>&arrayKey=${pageVO.arrayKey}</c:if>" <c:if test='${i==pageVO.pageNum}'>style='color:red'</c:if>>${i}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pageVO.pageNum == pageVO.totalPage}">
						<li><i class="xi-angle-right"></i></li>
					</c:if>
					<c:if test="${pageVO.pageNum < pageVO.totalPage}">
						<li class="hover:text-danger"><a href="<%=projectPath%>/campaign/pre_Campaign.do?pageNum=${pageVO.pageNum+1}<c:if test='${pageVO.arrayKey!=null}'>&arrayKey=${pageVO.arrayKey}</c:if>"><i class="xi-angle-right"></i></a></li>
					</c:if>
				</ul>
			</div>
			
   			<!-- 위로 이동 -->  
			<div class="page_up_div text-2xl border border-gray text-center rounded h-12 w-12 bg-black opacity-75 text-white">
					<a id="scrollToTop" class="align-middle" href="#"><i class="xi-angle-up"></i></a>  
			</div> 


</body>
</html>