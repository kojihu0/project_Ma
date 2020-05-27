<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:if test="${cnt>0}">
<script>
alert('등록되었습니다.');
location.href='<%=projectPath%>/campaign/detail_Campaign.do?cam_no=<%=request.getAttribute("cam_no")%>#comments';
</script>
</c:if>
<c:if test="${cnt<=0}">
<script>
alert('등록을 실패했습니다.');
location.href='<%=projectPath%>/campaign/detail_Campaign.do?cam_no=<%=request.getAttribute("cam_no")%>#comments';
</script>
</c:if>
