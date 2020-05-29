<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:if test="${camInsCnt>0}">
<script>
	alert("캠페인을 수정했습니다.");
	location.href="<%=projectPath %>/mypage/campaignControlPage.do";
</script>
</c:if>
<c:if test="${camInsCnt<=0 || camInsCnt=='' || camInsCnt==null}">
<script>
	alert("캠페인 수정을 실패했습니다.");
	history.go(-1);
</script>
</c:if>