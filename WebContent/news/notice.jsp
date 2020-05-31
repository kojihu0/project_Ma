<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>news_notice</title>
</head>
<body>
			<!-- card_box start --> 
			<div class="card_box w-full my-0 mx-auto max-w-screen-xl"> 
				<!-- notice-navigation -->
				<nav id="notice-navigation" class="flex items-center justify-between flex-wrap flex-grow w-3/4 my-0 mx-auto pt-8">
						<ul class="notice-menu flex flex-wrap flex-grow block text-lg"> 
							<li id="tab_01" class="notice_menu_item rounded-lg bg-danger-dark text-white text-center flex items-center mr-2"><a href="<%=projectPath %>/news/notice.do" class="border ">공지사항</a></li>
							<li id="tab_02" class="notice_menu_item rounded-lg bg-danger text-white text-center flex items-center mr-2"><a href="<%=projectPath %>/news/event.do" class="border">이벤트</a></li>
							<li id="tab_03" class="notice_menu_item rounded-lg bg-danger text-white text-center flex items-center mr-2"><a href="<%=projectPath %>/news/article.do" class="border ">보도자료</a></li> 
						</ul> 					    
				</nav><!-- notice-navigation end -->  
			
			
					<!-- 공지사항 폼 -->
					<c:forEach var="vo" items="${list }">
						<div class="w-full my-0 mx-auto  max-w-screen-xl">  
							<div class="card mx-auto">    
								<div class="max-w-sm w-full lg:max-w-full lg:flex">  
									<div class="border-b border-l border-gray-lighte lg:border-l-0 lg:border-gray-lighte bg-white px-4 py-8 flex justify-between leading-normal">
					  					<div class="w-2/3">  
					    					<div class="mb-8"> 
					      		 				<p class="text-sm"><i class="xi-lock text-brand"></i> ${vo.news_date }</p>   
					      						<div class="text-gray-darkest font-bold text-xl mb-2"><a style="overflow:ellipsis" href="<%=projectPath %>/news/newsContent.do?news_no=${vo.news_no}&pageNum=${pVo.pageNum}&news_category=${vo.news_category}">${vo.news_title }</a></div>
					      	  					<p style="overflow:ellipsis"class="text-gray-dark text-base"><a href="<%=projectPath %>/news/newsContent.do?news_no=${vo.news_no}&pageNum=${pVo.pageNum}&news_category=${vo.news_category}">${vo.news_content }</a></p>
					    	  		 		</div> 
					   						<div>   
					  							<div class="admin_name text-sm"> 
					        						<p class="text-gray-darkest leading-none"><a href="<%=projectPath %>/news/newsContent.do?news_no=${vo.news_no}&pageNum=${pVo.pageNum}&news_category=${vo.news_category}">&nbsp;관리자&nbsp;:&nbsp;&nbsp;${vo.user_id }</a></p>
					      						</div>  
					    					</div> 
					 					</div>  	  
					 					<div class="notice_img_box h-48 flex-initial w-1/3 rounded-t lg:rounded-t-none lg:rounded-l text-center"   title=""> 
					  						<a href="/project_Ma/news/newsContent.do?news_no=${vo.news_no }&pageNum=${pVo.pageNum}&news_category=${vo.news_category}"><img class="notice_img object-cover" src="<%=projectPath %>/img/${vo.news_img}"/></a>  
					  					</div> 
					 				</div>
								</div>
							</div>
						</div><!-- 공지사항 폼 end -->
					</c:forEach>
				</div><!-- card_box end -->
				
				
					   	<!-- 위로 이동 -->  
			<div class="page_up_div text-2xl border border-gray text-center rounded h-12 w-12 bg-black opacity-75 text-white">
				<a id="scrollToTop" class="align-middle" href="#"><i class="xi-angle-up"></i></a>  
			</div>      
				 
			<div class="pageDiv">
				<!-- 여기에 페이징이 들어와야 한다. -->
				<ul id="main_QnA_page" class="pagenation flex items-center justify-center my-4">
					<!-- prev -->
					<li class="page-item"> 
						<c:if test="${pVo.pageNum == 1 }">
							<a class="page-link block py-1 px-2 hover:text-danger pointer-events-none" href=""><i class="xi-angle-left-min"></i></a>
						</c:if> 
						<c:if test="${pVo.pageNum > 1 }">
							<a class="page-link block py-1 px-2 hover:text-danger" href="<%=projectPath%>/news/notice.do?pageNum=${pVo.pageNum - 1}"><i class="xi-angle-left-min"></i></a>
						</c:if>	
					</li>
					<!-- 페이지 수 -->
					<c:forEach var="i" begin="${pVo.startPage }" end="${pVo.startPage + pVo.pageCount - 1 }">
						<c:if test="${i <= pVo.totalPage }">  
							<li class="page-item acitve"><a class="pn page-link block py-1 px-2 hover:text-brand text-black" href="<%=projectPath%>/news/notice.do?pageNum=${i}"<c:if test="${i == pVo.pageNum }">style='color:red'</c:if>>${i}</a></li>
						</c:if>
					</c:forEach>	
					<!-- next -->
					<li class="page-item">
						<c:if test="${pVo.pageNum == pVo.totalPage}">
							<a class="page-link block py-1 px-2 hover:text-danger pointer-events-none" href=""><i class="xi-angle-right-min"></i></a>  
						</c:if>
						<c:if test="${pVo.pageNum < pVo.totalPage}">  
							<a class="page-link block py-1 px-2 hover:text-danger" href="<%=projectPath%>/news/notice.do?pageNum=${pVo.pageNum + 1}"><i class="xi-angle-right-min"></i></a>
						</c:if>		
					</li>
				</ul>	
			</div>				
				
	
</body>
</html>