<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<c:if test="${login == 'Y' }">

	<script>
		alert("환영합니다. 관리자님.");
		location.href = "<%=request.getContextPath()%>/admin/admin.do";
	</script>

</c:if>

<c:if test="${login == 'N' }">
	<script>
		alert("잘못된 접근입니다.");
		history.back();
	</script>
</c:if>