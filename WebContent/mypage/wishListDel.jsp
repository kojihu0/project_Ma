<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${cnt>0 }">
	<script>
		alert("선택하신 위시리스트가 삭제되었습니다.");
	</script>
</c:if>
<c:if  test="${cnt<=0 }">
	<script>
		alert("선택하신 위시리스트 삭제에 실패하였습니다.");
	</script>
</c:if>