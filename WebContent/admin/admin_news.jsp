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
		.campaign-tab-nav li.active a{
			color:#cb0802;
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
			        
			        $('.campaign-tab-nav .tab-item').removeClass('active');
			        $('.campaign-tab-content .tab-content-item').removeClass('active');

			        $(this).parent().addClass('active');
			        $($(this).attr('href')).addClass('active');
			    });
			   
		});//end
	</script>
	<header class="header p-4 bg-white text-xl border-b border-gray flex justify-between fixed w-full z-20 top-0">
		<div><span class="text-brand pr-4"><a href="admin.jsp">ChariTree</a></span>관리자 페이지</div>
		<div><c:if test="${login == 'Y' }"><a href="<%=adminPath %>/admin/admin_Logout.do" class="text-lg">로그아웃</a></c:if></div>
	</header>	
	<div class="content flex w-full"> 
		<!-- 메뉴선택 영역 -->
		<div class="bg-white h-16 fixed bottom-0 mt-12 md:relative md:h-screen z-10 w-full md:w-48 border-r border-gray"><!-- 가장 왼쪽, 메인 선택메뉴 -->
			<ul class="mt-16 p-4 w-48 fixed left-0 top-0 content-start text-left justify-between">
				<li class="border-b-2 border-gray hover:border-brand hover:text-brand p-2 m-2 leading-relaxed text-center"><a href="<%=adminPath %>/admin/admin.do">관리자 홈</a></li>
				<li class="border-b-2 border-gray hover:border-brand hover:text-brand p-2 m-2 leading-relaxed text-center"><a href="<%=adminPath %>/admin/admin_news.do">새소식 관리</a></li>
				<li class="border-b-2 border-gray hover:border-brand hover:text-brand p-2 m-2 leading-relaxed text-center"><a href="<%=adminPath %>/admin/admin_servicecenter.do">질문 관리</a></li>
			</ul>
		</div>
		<section class="flex-1 bg-gray-lightest mt-12 p-8" id="top"><!-- 해당 내용이 들어갈 부분. -->
			<div class="flex">
				<div class="viewDiv w-1/2">
					<div class="campaign-tab-nav w-full bg-white flex items-center justify-center">
						<ul class="flex items-center justify-center block py-4 font-bold">
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
										<div class="w-full flex">  
											<div class="w-full border-b border-l border-gray-light lg:border-l-0 lg:border-gray-lighte bg-white px-4 py-8 flex justify-between leading-normal">
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
										<div class="w-full flex">  
											<div class="w-full border-b border-l border-gray-light lg:border-l-0 lg:border-gray-lighte bg-white px-4 py-8 flex justify-between leading-normal">
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
							<c:forEach var="vo" items="${listArticle}">
								<div class="w-full my-0 mx-auto  max-w-screen-xl">  
									<div class="card mx-auto">    
										<div class="max-w-sm w-full lg:max-w-full lg:flex">  
											<div class="w-full border-b border-l border-gray-light lg:border-l-0 lg:border-gray-lighte bg-white px-4 py-8 flex justify-between leading-normal">
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
				<div class="editDiv w-1/2 pt-24 pl-8">
					<form method="post" action="<%=adminPath%>/admin/admin_news.do">
						<input type="hidden" name="regi" id="regi" value="startRegi"/>
						<div class="mb-4">
						<input type="text" name="title" id="title" placeholder="제목" class="appearance-none border border-gray rounded w-full py-2 px-3 leading-tight focus:outline-none focus:shadow-outline"/>
						</div>
						<div class="inline-block relative w-1/2 mr-2 mb-4">
							<select name="category" id="category" class="appearance-none w-full bg-white border border-gray hover:border-gray-dark px-4 py-2 pr-8 rounded leading-tight focus:outline-none focus:shadow-outline">
								<option value="1">공지사항</option>
								<option value="2">이벤트</option>
								<option value="3">보도자료</option>
							</select>
							<div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2">
								<i class="xi-angle-down-min"></i>
							</div><!--select-->
						</div>
						<div class="mb-4">
							<textarea name="content" id="content"></textarea>
						</div>
						<div>
							<input type="submit" value="등록" class="bg-brand hover:bg-brand-dark text-white font-bold py-2 px-4 rounded"/>
						</div>
					</form>
				</div>
			</div>
		</section>
	</div>
	<script type="text/javascript">
	$(function(){
		CKEDITOR.replace('content', {
			filebrowserUploadUrl:'<%=adminPath%>/nTnB/editorImgUpload.do'
		});
	});
	</script>
</body>
</html>