<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String) request.getAttribute("msg");
	String path = (String) request.getAttribute("path");
	String action = (String) request.getAttribute("action");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림</title>
</head>
<body>
	<script>
		<% if(action != null) { %>
			<%= action %>
		<% } %>
	
		alert('<%= msg %>');
		location.href='<%= path %>';
	</script>
</body>
</html>