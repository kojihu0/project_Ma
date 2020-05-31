<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String adminPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>news</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<link href="<%=adminPath %>/lib/css/tailwind.css" rel="stylesheet" type="text/css"/>
	<link href="<%=adminPath %>/lib/css/slick-theme.css" rel="stylesheet" type="text/css"/>
	<link href="<%=adminPath %>/lib/css/slick.css" rel="stylesheet" type="text/css"/>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="<%=adminPath %>/lib/js/jquery-ui.min.js"></script> 
	<script src="<%=adminPath %>/lib/js/datepicker-ko.js"></script>
	<script src="<%=adminPath %>/lib/js/jquery.number.min.js"></script>
	<script src="<%=adminPath %>/lib/ckeditor/ckeditor.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/clipboard@2/dist/clipboard.min.js"></script>

   <!--css-->
	<style>
		.campaign-tab-content .tab-content-item{
 		   display: none;
		}
		
		.campaign-tab-content .tab-content-item.active{
   		 	display: block;
		}
		
	</style>
   <!--js-->
   



</head>
<body>
	<script>
		$(function(){
			   $("a.main-qna-title").on('click', function(e){
			        e.preventDefault();
			        $($(this).attr('href')).toggleClass('hidden');
			   });
			   
			   
			    $('.campaign-tab-nav .tab-item a').on('click', function(e){
			        e.preventDefault();
			        
			        $('html,body').animate({
			            scrollTop: $("#top").offset().top
			        });

			        $('.campaign-tab-nav .tab-item').removeClass('active');
			        $('.campaign-tab-content .tab-content-item').removeClass('active');

			        $(this).parent().addClass('active');
			        $($(this).attr('href')).addClass('active');
			    });
			   
			   
			   
			   
		});//end
	</script>
	<header class="header p-4 my-4 bg-danger text-xl text-white">
		<span class="danger"><a href="admin.jsp">ChariTree</a></span>&nbsp;&nbsp;관리자 페이지
		<c:if test="${login == 'Y' }">
			<a href="<%=adminPath %>/admin/admin_Logout.do">로그아웃</a>
		</c:if>
	</header>	
	<div class="content flex"> 
		
		<!-- 메뉴선택 영역 -->
		<div class="flex-initial"><!-- 가장 왼쪽, 메인 선택메뉴 -->
			<ul>
				<li class="hover:bg-danger-dark p-4 m-2 leading-relaxed text-xl border-b text-white bg-danger rounded text-center"><a href="<%=adminPath %>/admin/admin.do">관리자 홈</a></li>
				<li class="hover:bg-danger-dark p-4 m-2 leading-relaxed text-xl border-b text-white bg-danger-dark rounded text-center"><a href="<%=adminPath %>/admin/admin_news.do">새소식 관리</a></li>
				<li class="hover:bg-danger-dark p-4 m-2 leading-relaxed text-xl border-b text-white bg-danger rounded text-center"><a href="<%=adminPath %>/admin/admin_servicecenter.do">질문 관리</a></li>
			</ul>
		</div>

		<section class="border flex-initial  w-full" id="top"><!-- 해당 내용이 들어갈 부분. -->
			<div class="border flex">
				<div class="viewDiv w-1/2 border">
					<div class="campaign-tab-nav w-full bg-white flex items-center justify-center">
						<ul class="flex items-center justify-center block py-8 font-bold">
							<li class="flex-initial tab-item text-center mr-4 active"><a href="#news" class="inline-block py-4 px-4">공지사항</a></li>
							<li class="flex-initial tab-item text-center mr-4"><a href="#event" class="inline-block py-4 px-4">이벤트</a></li>
							<li class="flex-initial tab-item text-center mr-4"><a href="#article" class="inline-block py-4 px-4">보도자료 </a></li>
						</ul>
					</div>
						
					<hr/> 
						
					<div class="campaign-tab-content">
						<div id="news" class="tab-content-item active">
							<!-- 공지사항 폼 -->
							<c:forEach var="vo" items="${listNews }">
								<div class="w-full my-0 mx-auto  max-w-screen-xl">  
									<div class="card mx-auto">    
										<div class="max-w-sm w-full lg:max-w-full lg:flex">  
											<div class="border-b border-l border-gray-lighte lg:border-l-0 lg:border-gray-lighte bg-white px-4 py-8 flex justify-between leading-normal">
					  							<div class="w-2/3">  
					    							<div class="mb-8"> 
					      		 						<p class="text-sm"><i class="xi-lock text-brand"></i> ${vo.news_date }</p>    
					      								<div class="text-gray-darkest font-bold text-xl mb-2"><a style="overflow:ellipsis" href="<%=adminPath %>/admin/admin_news.do?news_no=${vo.news_no}&pageNum=${pVo.pageNum}&news_category=${vo.news_category}">${vo.news_title }</a></div>
					      	  							<p style="overflow:ellipsis"class="text-gray-dark text-base"><a href="<%=adminPath %>/admin/admin_news.do?news_no=${vo.news_no}&pageNum=${pVo.pageNum}&news_category=${vo.news_category}">${vo.news_content }</a></p>
					    	  		 				</div> 
					   								<div>   
					  									<div class="admin_name text-sm"> 
					        								<p class="text-gray-darkest leading-none"><a href="<%=adminPath %>/admin/admin_news.do?news_no=${vo.news_no}&pageNum=${pVo.pageNum}&news_category=${vo.news_category}">&nbsp;관리자&nbsp;:&nbsp;&nbsp;${vo.user_id }</a></p>
					      								</div>  
					    							</div> 
					 							</div>  	  
					 							<div class="notice_img_box h-48 flex-initial w-1/3 rounded-t lg:rounded-t-none lg:rounded-l text-center"   title=""> 
					  								<a href="<%=adminPath %>/admin/admin_news.do?news_no=${vo.news_no }&pageNum=${pVo.pageNum}&news_category=${vo.news_category}"></a>  
					  							</div> 
					 						</div>
										</div>
									</div>
								</div><!-- 공지사항 폼 end -->
							</c:forEach>
							<div class="pageDiv">
								<!-- 여기에 페이징이 들어와야 한다. -->
								<ul id="main_QnA_page" class="pagenation flex items-center justify-center my-4">
										<!-- prev -->
										<li class="page-item"> 
											<c:if test="${pVo.pageNum == 1 }">
												<a class="page-link block py-1 px-2 hover:text-danger pointer-events-none" href=""><i class="xi-angle-left-min"></i></a>
											</c:if> 
											<c:if test="${pVo.pageNum > 1 }">
												<a class="page-link block py-1 px-2 hover:text-danger" href="<%=adminPath%>/admin/admin_news.do?pageNum=${pVo.pageNum - 1}"><i class="xi-angle-left-min"></i></a>
											</c:if>	
										</li>
										<!-- 페이지 수 -->
										<c:forEach var="i" begin="${pVo.startPage }" end="${pVo.startPage + pVo.pageCount - 1 }">
											<c:if test="${i <= pVo.totalPage }">  
												<li class="page-item acitve"><a class="pn page-link block py-1 px-2 hover:text-brand text-black" href="<%=adminPath%>/admin/admin_news.do?pageNum=${i}"<c:if test="${i == pVo.pageNum }">style='color:red'</c:if>>${i}</a></li>
											</c:if>
										</c:forEach>	
										<!-- next -->
										<li class="page-item">
											<c:if test="${pVo.pageNum == pVo.totalPage}">
												<a class="page-link block py-1 px-2 hover:text-danger pointer-events-none" href=""><i class="xi-angle-right-min"></i></a>  
											</c:if>
											<c:if test="${pVo.pageNum < pVo.totalPage}">  
												<a class="page-link block py-1 px-2 hover:text-danger" href="<%=adminPath%>/admin/admin_news.do?pageNum=${pVo.pageNum + 1}"><i class="xi-angle-right-min"></i></a>
											</c:if>		
										</li>
									</ul>	
							</div>				
						</div><!-- news -->
						
						<div id="event" class="tab-content-item">
							<!-- 공지사항 폼 -->
							<c:forEach var="vo" items="${listEvent }">
								<div class="w-full my-0 mx-auto  max-w-screen-xl">  
									<div class="card mx-auto">    
										<div class="max-w-sm w-full lg:max-w-full lg:flex">  
											<div class="border-b border-l border-gray-lighte lg:border-l-0 lg:border-gray-lighte bg-white px-4 py-8 flex justify-between leading-normal">
					  							<div class="w-2/3">  
					    							<div class="mb-8"> 
					      		 						<p class="text-sm"><i class="xi-lock text-brand"></i> ${vo.news_date }</p>    
					      								<div class="text-gray-darkest font-bold text-xl mb-2"><a style="overflow:ellipsis" href="<%=adminPath %>/admin/admin_news.do?news_no=${vo.news_no}&pageNum=${pVo.pageNum}&news_category=${vo.news_category}">${vo.news_title }</a></div>
					      	  							<p style="overflow:ellipsis"class="text-gray-dark text-base"><a href="<%=adminPath %>/admin/admin_news.do?news_no=${vo.news_no}&pageNum=${pVo.pageNum}&news_category=${vo.news_category}">${vo.news_content }</a></p>
					    	  		 				</div> 
					   								<div>   
					  									<div class="admin_name text-sm"> 
					        								<p class="text-gray-darkest leading-none"><a href="<%=adminPath %>/admin/admin_news.do?news_no=${vo.news_no}&pageNum=${pVo.pageNum}&news_category=${vo.news_category}">&nbsp;관리자&nbsp;:&nbsp;&nbsp;${vo.user_id }</a></p>
					      								</div>  
					    							</div> 
					 							</div>  	  
					 							<div class="notice_img_box h-48 flex-initial w-1/3 rounded-t lg:rounded-t-none lg:rounded-l text-center"   title=""> 
					  								<a href="<%=adminPath %>/admin/admin_news.do?news_no=${vo.news_no }&pageNum=${pVo.pageNum}&news_category=${vo.news_category}"></a>  
					  							</div> 
					 						</div>
										</div>
									</div>
								</div><!-- 공지사항 폼 end -->
							</c:forEach>
							<div class="pageDiv">
								<!-- 여기에 페이징이 들어와야 한다. -->
								<ul id="main_QnA_page" class="pagenation flex items-center justify-center my-4">
										<!-- prev -->
										<li class="page-item"> 
											<c:if test="${pVo.pageNum == 1 }">
												<a class="page-link block py-1 px-2 hover:text-danger pointer-events-none" href=""><i class="xi-angle-left-min"></i></a>
											</c:if> 
											<c:if test="${pVo.pageNum > 1 }">
												<a class="page-link block py-1 px-2 hover:text-danger" href="<%=adminPath%>/admin/admin_news.do?pageNum=${pVo.pageNum - 1}"><i class="xi-angle-left-min"></i></a>
											</c:if>	
										</li>
										<!-- 페이지 수 -->
										<c:forEach var="i" begin="${pVo.startPage }" end="${pVo.startPage + pVo.pageCount - 1 }">
											<c:if test="${i <= pVo.totalPage }">  
												<li class="page-item acitve"><a class="pn page-link block py-1 px-2 hover:text-brand text-black" href="<%=adminPath%>/admin/admin_news.do?pageNum=${i}"<c:if test="${i == pVo.pageNum }">style='color:red'</c:if>>${i}</a></li>
											</c:if>
										</c:forEach>	
										<!-- next -->
										<li class="page-item">
											<c:if test="${pVo.pageNum == pVo.totalPage}">
												<a class="page-link block py-1 px-2 hover:text-danger pointer-events-none" href=""><i class="xi-angle-right-min"></i></a>  
											</c:if>
											<c:if test="${pVo.pageNum < pVo.totalPage}">  
												<a class="page-link block py-1 px-2 hover:text-danger" href="<%=adminPath%>/admin/admin_news.do?pageNum=${pVo.pageNum + 1}"><i class="xi-angle-right-min"></i></a>
											</c:if>		
										</li>
									</ul>	
							</div>							
						</div>
					
					
						<div id="article" class="tab-content-item">
							<!-- 공지사항 폼 -->
							<c:forEach var="vo" items="${listArticle }">
								<div class="w-full my-0 mx-auto  max-w-screen-xl">  
									<div class="card mx-auto">    
										<div class="max-w-sm w-full lg:max-w-full lg:flex">  
											<div class="border-b border-l border-gray-lighte lg:border-l-0 lg:border-gray-lighte bg-white px-4 py-8 flex justify-between leading-normal">
					  							<div class="w-2/3">  
					    							<div class="mb-8"> 
					      		 						<p class="text-sm"><i class="xi-lock text-brand"></i> ${vo.news_date }</p>    
					      								<div class="text-gray-darkest font-bold text-xl mb-2"><a style="overflow:ellipsis" href="<%=adminPath %>/admin/admin_news.do?news_no=${vo.news_no}&pageNum=${pVo.pageNum}&news_category=${vo.news_category}">${vo.news_title }</a></div>
					      	  							<p style="overflow:ellipsis"class="text-gray-dark text-base"><a href="<%=adminPath %>/admin/admin_news.do?news_no=${vo.news_no}&pageNum=${pVo.pageNum}&news_category=${vo.news_category}">${vo.news_content }</a></p>
					    	  		 				</div> 
					   								<div>   
					  									<div class="admin_name text-sm"> 
					        								<p class="text-gray-darkest leading-none"><a href="<%=adminPath %>/admin/admin_news.do?news_no=${vo.news_no}&pageNum=${pVo.pageNum}&news_category=${vo.news_category}">&nbsp;관리자&nbsp;:&nbsp;&nbsp;${vo.user_id }</a></p>
					      								</div>  
					    							</div> 
					 							</div>  	  
					 							<div class="notice_img_box h-48 flex-initial w-1/3 rounded-t lg:rounded-t-none lg:rounded-l text-center"   title=""> 
					  								<a href="<%=adminPath %>/admin/admin_news.do?news_no=${vo.news_no }&pageNum=${pVo.pageNum}&news_category=${vo.news_category}"></a>  
					  							</div> 
					 						</div>
										</div>
									</div>
								</div><!-- 공지사항 폼 end -->
							</c:forEach>
							<div class="pageDiv">
								<!-- 여기에 페이징이 들어와야 한다. -->
								<ul id="main_QnA_page" class="pagenation flex items-center justify-center my-4">
										<!-- prev -->
										<li class="page-item"> 
											<c:if test="${pVo.pageNum == 1 }">
												<a class="page-link block py-1 px-2 hover:text-danger pointer-events-none" href=""><i class="xi-angle-left-min"></i></a>
											</c:if> 
											<c:if test="${pVo.pageNum > 1 }">
												<a class="page-link block py-1 px-2 hover:text-danger" href="<%=adminPath%>/admin/admin_news.do?pageNum=${pVo.pageNum - 1}"><i class="xi-angle-left-min"></i></a>
											</c:if>	
										</li>
										<!-- 페이지 수 -->
										<c:forEach var="i" begin="${pVo.startPage }" end="${pVo.startPage + pVo.pageCount - 1 }">
											<c:if test="${i <= pVo.totalPage }">  
												<li class="page-item acitve"><a class="pn page-link block py-1 px-2 hover:text-brand text-black" href="<%=adminPath%>/admin/admin_news.do?pageNum=${i}"<c:if test="${i == pVo.pageNum }">style='color:red'</c:if>>${i}</a></li>
											</c:if>
										</c:forEach>	
										<!-- next -->
										<li class="page-item">
											<c:if test="${pVo.pageNum == pVo.totalPage}">
												<a class="page-link block py-1 px-2 hover:text-danger pointer-events-none" href=""><i class="xi-angle-right-min"></i></a>  
											</c:if>
											<c:if test="${pVo.pageNum < pVo.totalPage}">  
												<a class="page-link block py-1 px-2 hover:text-danger" href="<%=adminPath%>/admin/admin_news.do?pageNum=${pVo.pageNum + 1}"><i class="xi-angle-right-min"></i></a>
											</c:if>		
										</li>
									</ul>	
							</div>							
						</div>
						
					</div>
				</div>
				
				<div class="editDiv w-1/2 border">
				
					<form method="post" enctype="multipart/form-data" action="<%=adminPath%>/admin/admin_news.do">
						<input type="hidden" name="regi" id="regi" value="startRegi"/><br/>
						<input type="text" name="title" id="title" class="border"/> <br/>
						<select name="category" id="category">
							<option value="1">공지사항</option>
							<option value="2">이벤트</option>
							<option value="3">보도자료</option>
						</select><br/>
						<textArea name="content" id="content" cols="10" rows="10"></textArea><br/>
						<input type="submit" value="등록" />
					</form>
				</div>
			</div>
		</section>
	</div>
</body>
</html>