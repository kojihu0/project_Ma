<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(function(){
	$("#idSet").click(function(){
		opener.document.getElementById("idStatus").value="Y";
		self.close();
	});
	$("#check").click(function(){
		window.close();
	});
});
</script>
</head>
<body>
<div id="container"> 
<span class="font-extrabold">${user_id }</span>는
<c:if test="${cnt==0}">
사용가능한 아이디 입니다.
<input type="button" id="idSet" value="사용하기" class="bg-danger hover:bg-danger-dark text-white font-bold py-2 px-4 rounded">
</c:if>
<c:if test="${cnt==1}">
사용불가능한 아이디 입니다.
사용할 아이디를 적으시고 다시 중복검사를 시도해주세요.
<input type="button" id="check" value="확인">
</c:if>

</div>
</body>
</html>