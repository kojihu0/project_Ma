<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${cnt>0 }">
	<script>
		alert("비밀번호가 변경 되었습니다.");
		history.go(-1);
	</script>
</c:if>
<c:if  test="${cnt<=0 }">
	<script>
		alert("비밀번호 변경에 실패하였습니다.");
		history.go(-1);
	</script>
</c:if>