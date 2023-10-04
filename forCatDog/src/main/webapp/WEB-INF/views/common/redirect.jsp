<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림</title>
<%@ include file="/resources/globalVariable.jsp" %>
</head>
<body>
	<script>
		alert('${ msg }');
		location.href='<c:out value="${ contextPath }"/>${url}';
	</script>
</body>
</html>