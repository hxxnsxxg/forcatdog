<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/resources/globalVariable.jsp"%>
<title>forCatDog</title>
<link rel = "icon" href = "${ contextPath }/resources/images/favicon.ico">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/match/MatchingPopup3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body align="center">
	<form action="matchMember.mc" method="post" name="matchMember" onsubmit="return checkContent();">
		<input type="hidden" name="matchNum" value="${ matchNum }">
		<input type="hidden" name="matchCate" value="${ matchCate }">
	
		<div class="header">펫시터 신청</div>
		<br> <br>
		
		<p class="matchingPopupContent">정말로 신청하시겠습니까?</p>
		<p class="matchingPopupContent">신청 시 상대방에게 알림 메세지가 전달됩니다.</p>
		
		<br><br>
		
		<textarea name="mContent"></textarea>
		
		<br>

		<button class="applyBtn">
			<i class="fa fa-paw"></i>신청
		</button>
		<button class="closeBtn" onClick='window.close()'>취소</button>
	</form>
	
	<script>
		function checkContent() {
			if(document.getElementsByName("mContent")[0].value == "") {
				alert("내용을 입력하세요.");
				return false;
			} else {
				return true;
			}
		}
	</script>
</body>
</html>