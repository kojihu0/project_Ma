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
	<header class="header p-4 my-4 bg-danger text-xl text-white">
		<span class="danger"><a href="admin.do">ChariTree</a></span>&nbsp;&nbsp;관리자 페이지
		<c:if test="${login == 'Y' }">
			<a href="<%=adminPath %>/admin/admin_Logout.do">로그아웃</a>
		</c:if>
	</header>
	<div class="content flex"> 
		
		<!-- 메뉴선택 영역 -->
		<div class="flex-initial"><!-- 가장 왼쪽, 메인 선택메뉴 -->
			<ul> 
				<li class="hover:bg-danger-dark p-4 m-2 leading-relaxed text-xl border-b text-white bg-danger-dark rounded text-center"><a href="<%=adminPath %>/admin/admin.do">관리자 홈</a></li>
				<li class="hover:bg-danger-dark p-4 m-2 leading-relaxed text-xl border-b text-white bg-danger rounded text-center"><a href="<%=adminPath %>/admin/admin_news.do">새소식 관리</a></li>
				<li class="hover:bg-danger-dark p-4 m-2 leading-relaxed text-xl border-b text-white bg-danger rounded text-center"><a href="<%=adminPath %>/admin/admin_servicecenter.do">질문 관리</a></li>
			</ul>
		</div>

		
		<section class="border flex-initial h-128"><!-- 해당 내용이 들어갈 부분. -->
		
			환영합니다 관리자님 불라불라불라. 여기 들어갈 내용은 같이 생각해봅세.
	
		</section>
	</div>
</body>
</html>