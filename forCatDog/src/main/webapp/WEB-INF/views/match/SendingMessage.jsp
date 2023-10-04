<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/resources/globalVariable.jsp" %>
<title>forCatDog</title>
<link rel = "icon" href = "${ contextPath }/resources/images/favicon.ico">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/match/SendingMessage.css">
</head>
<body>
	<div class="header">쪽지</div>
	<br>
	<form action="">
		<p class="sendingPopupContent">
			받는 사람 : 강건강
		</p>
		<textarea class="contentarea"rows="20" cols="100" placeholder="내용을 입력해주세요"></textarea>
		
		<input type="submit" class="applyBtn" value="보내기">
		<button class="closeBtn" onClick='window.close()'>취소</button>
	
	</form>
	
	
	<script>
	
	</script>
</body>
</html>