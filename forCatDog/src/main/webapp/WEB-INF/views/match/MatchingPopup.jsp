<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/resources/globalVariable.jsp" %>
<title>forCatDog</title>
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/match/MatchingPopup.css">
</head>
<body>
	<div class="header">짝 신청</div>
	<br>
	<br>
	<p class="matchingPopupContent">
		정말로 신청하시겠습니까?
	</p>
	<p class="matchingPopupContent">
		신청 시 상대방에게 알림 메세지가 전달됩니다.
	</p>
	
	<button class="applyBtn">신청</button>
	<button class="closeBtn" onClick='window.close()'>취소</button>
</body>
</html>