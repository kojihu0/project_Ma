<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String adminPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>



<meta charset="UTF-8">
<title>어드민 로그인</title>

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
	<div class="w-full max-w-screen-xl my-0 mx-auto justify-center">
		<div>
			<div class="text-4xl">관리자 로그인</div> 
				<div class="w-full max-w-lg">					
					<form id="adminForm" method="post" action="<%=adminPath %>/admin/admin_LoginOk.do" class="bg-white rounded px-8 pt-6 pb-8 mb-4">
						<div class="mb-4">
							<label class="block text-gray-700 text-sm font-bold mb-2" for="username">아이디</label>
						      <input class="border rounded w-full py-2 px-3 text-gray-700 leading-tight h-12" id="username" name="admin_id" type="text" placeholder="아이디">
						</div>
						<div class="mb-6">
							<label class="block text-gray-700 text-sm font-bold mb-2" for="password">비밀번호</label>
						    <input class="border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight h-12" id="password" type="password" name="admin_pw" placeholder="비밀번호">
						</div>
						<button class="text-white font-bold py-2 px-4 rounded bg-danger w-full my-8 h-12">로그인</button>
					</form>
				</div>
		</div> 
	</div>
</body>
</html>