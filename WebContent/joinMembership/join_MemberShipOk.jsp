<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${cnt>0 }">
	<script>
		alert("회원가입이 완료되었습니다.");
		location.href="<%=projectPath%>/joinMembership/join_Completed.do";
	</script>
</c:if>
<c:if test="${cnt<0 }">
	<script>
		alert("회원가입에 실패하였습니다. /n 회원가입 페이지로 이동합니다");
		history.go(-1);
	</script>
</c:if>