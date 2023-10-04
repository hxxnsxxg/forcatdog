<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<script>
	var contextPath = "${ contextPath }";
</script>
<script src="https://kit.fontawesome.com/8ed0aa7c41.js" crossorigin="anonymous"></script>
<script src="${ contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<link rel = "icon" href = "${ contextPath }/resources/images/favicon.ico">