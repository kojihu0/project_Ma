<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin page</title>
</head>
<body> 
	<header class="header p-4 my-4 bg-danger text-xl text-white">
		<span class="danger"><a href="admin.jsp">ChariTree</span></a>&nbsp;&nbsp;관리자 페이지
	</header>
	<div class="content flex"> 
		
		<!-- 메뉴선택 영역 -->
		<div class="flex-initial"><!-- 가장 왼쪽, 메인 선택메뉴 -->
			<ul> 
				<li class="hover:bg-danger-dark p-4 m-2 leading-relaxed text-xl border-b text-white bg-danger-dark rounded text-center"><a href="admin.jsp">관리자 홈</a></li>
				<li class="hover:bg-danger-dark p-4 m-2 leading-relaxed text-xl border-b text-white bg-danger rounded text-center"><a href="admin_news.jsp">새소식 관리</a></li>
				<li class="hover:bg-danger-dark p-4 m-2 leading-relaxed text-xl border-b text-white bg-danger rounded text-center"><a href="admin_servicecenter.jsp">질문 관리</a></li>
			</ul>
		</div>

		
		<section class="border flex-initial h-128"><!-- 해당 내용이 들어갈 부분. -->
		
			환영합니다 관리자님 불라불라불라. 여기 들어갈 내용은 같이 생각해봅세.
	
		</section>
	</div>
</body>
</html>