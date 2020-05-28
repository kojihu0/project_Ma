<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:if test="${action=='add'}">
	<c:if test="${cnt>0}">
	<script>
	alert('캠페인이 위시리스트에 등록되었습니다.');
	location="<%=projectPath%>/campaign/detail_Campaign.do?cam_no=${cam_no}"
	</script>
	</c:if>
	<c:if test="${cnt<=0}">
	<script>
	alert('위시리스트 등록이 실패했습니다.');
	location="<%=projectPath%>/campaign/detail_Campaign.do?cam_no=${cam_no}"
	</script>
	</c:if>
</c:if>
<c:if test="${action=='delete'}">
	<c:if test="${cnt>0}">
	<script>
	alert('캠페인이 위시리스트에서 삭제되었습니다.');
	location="<%=projectPath%>/campaign/detail_Campaign.do?cam_no=${cam_no}"
	</script>
	</c:if>
	<c:if test="${cnt<=0}">
	<script>
	alert('위시리스트 삭제가 실패했습니다.');
	location="<%=projectPath%>/campaign/detail_Campaign.do?cam_no=${cam_no}"
	</script>
	</c:if>
</c:if>
