<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${cnt>0 }">
	<script>
		alert("회원탈퇴가 완료되었습니다.");
		location.href="<%=projectPath%>/index.do";
	</script>
</c:if>
<c:if test="${cnt<=0 }">
	<script>
		alert("회원탈퇴를 실패하였습니다. 다시시도해주세요.");
		history.go(-1);
	</script>
</c:if>