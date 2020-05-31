<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:if test="${vo.user_id != null && vo.user_id != ''}">
	<script>
		var user_id = '${vo.user_id}';
		alert("조회하신 아이디는  "+user_id+" 입니다.");
		location.href="<%=projectPath%>/login/login.jsp";
	</script>
</c:if>
<c:if test="${vo.user_id ==null || vo.user_id == '' }">
	<script>
		alert("아이디가 조회되지 않습니다. 다시 확인 후 조회부탁드립니다.");
		history.go(-1);
	</script>
</c:if>