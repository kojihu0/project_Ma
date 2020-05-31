<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${loginStatus=='Y'}">
	<script>
		alert("로그인 성공하셨습니다. 환영합니다!");
		location.href="<%=projectPath%>/index.do";
	</script>
</c:if>
<c:if test="${loginStatus=='N'}">
	<script>
		alert("로그인 실패하였습니다. 확인 후 다시 시도해주세요.");
		history.go(-1);
	</script>
</c:if>