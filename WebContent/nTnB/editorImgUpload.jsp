<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
response.setContentType("application/json");
JSONObject obj = new JSONObject();
obj.put("uploaded", request.getAttribute("uploaded"));
obj.put("filename", request.getAttribute("filename"));
obj.put("url", request.getAttribute("url"));
out.println(obj);
%>