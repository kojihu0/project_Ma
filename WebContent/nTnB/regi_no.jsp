<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<script>
$(function(){
	$("#regi_no_Set").click(function(){
		opener.document.getElementById("regi_no_Status").value="Y";
		self.close();
	});
	$("#check").click(function(){
		window.close();
	});
});
</script>
<body>
<div id="container"> 
<span class="font-extrabold">${corpo_regi_no }</span>는
<c:if test="${cnt==0}">
정상적으로 조회가 완료 되었습니다.
<input type="button" id="regi_no_Set" value="사용하기" class="bg-danger hover:bg-danger-dark text-white font-bold py-2 px-4 rounded">
</c:if>
<c:if test="${cnt==1}">
이미 존재하는 사업자 등록번호 입니다 .
다시 입력해주세요. 
<input type="button" id="check" value="확인" class="bg-danger hover:bg-danger-dark text-white font-bold py-2 px-4 rounded">
</c:if>
</div>
</body>
</html>