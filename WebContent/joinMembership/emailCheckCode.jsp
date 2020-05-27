<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>
<hr id='z'>
<c:if test="${code=='ok'}">
ok
</c:if>
<c:if test="${code=='yes'}">
yes
</c:if>
<c:if test="${code==null || code == ''}">
not
</c:if>
<hr id='z'>