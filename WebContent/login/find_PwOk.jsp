<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<c:if test="${vo.user_pw !=null && vo.user_pw != ''}">
	<script>
		var user_pw = '${vo.user_pw}';
		alert("조회하신 비밀번호는 "+user_pw+" 입니다.");
		location.href="<%=projectPath%>/login/login.jsp";
	</script>
</c:if>
<c:if test="${vo.user_pw == null || vo.user_pw == ''}">
	<script>
		alert("비밀번호가 조회되지 않습니다. 다시 확인 후 조회부탁드립니다.");
		history.go(-1);
	</script>
</c:if>