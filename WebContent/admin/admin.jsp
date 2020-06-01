<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String adminPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin page</title>
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

   <!--js-->
</head>
<body> 
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
		<section class="flex-1 bg-gray-lightest mt-12 p-8"><!-- 해당 내용이 들어갈 부분. -->
			<div>
				<div class="text-xl">ChariTree 관리자 페이지 입니다!</div>
			</div>
		</section>
	</div>
</body>
</html>