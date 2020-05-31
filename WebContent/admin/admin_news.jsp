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
	</header>	<div class="content flex"> 
		
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
						
							</div>
							<div id="event" class="tab-content-item">
						
							</div>
							<div id="article" class="tab-content-item">
						
							</div>
						</div>
					</div>
					
					<div class="editDiv w-1/2 border">
						
					asdasd
					</div>
				</div>
		</section>
	</div>

</body>
</html>