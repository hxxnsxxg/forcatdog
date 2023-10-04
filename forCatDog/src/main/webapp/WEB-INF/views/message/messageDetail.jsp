<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/message/messageDetail.css?after">
<link rel = "icon" href = "<%= request.getContextPath() %>/resources/images/favicon.ico">
<script src="<%= request.getContextPath() %>/resources/js/jquery-3.5.1.min.js"></script>
</head>
<body>
	<h2><img src="${ contextPath }/resources/images/receivedms.png"></h2>
	<div id="messageBox">
		<form action="sendMessageForm.ms" name="sendmsg" method="post">
	    	<input type="hidden" name="userId" value="${ msg.sendId }">
	    	<input type="hidden" name="nickName" value="${ msg.sendNickName }">
	    	<input type="hidden" name="idCheck" value="D">
      	</form>

		<div id="sender">
			<b>보낸 사람 :</b>
			<div id="nickName">${ requestScope.msg.sendNickName }</div>
			<br>
			<b>받은 시간 :</b>
			<div id="sendDate"><fmt:formatDate value='${ requestScope.msg.sendDate }' pattern="yyyy-MM-dd HH:mm"/></div>
		</div>
		<div id="mContent">
			<% pageContext.setAttribute("newLineChar", "\r\n"); %>
			${ fn:replace(requestScope.msg.mContent, newLineChar, "<br>") }
		</div>
			<br>
		<input type="button" id="answerBtn" value="답장" onclick="sendMessage();">
		<input type="button" id="closeBtn" value="닫기" onclick="self.close();">
	</div>
	
	<script>
		opener.location.href = opener.location.href;

		function sendMessage() {
			document.sendmsg.submit();
		}
		
	</script>
</body>
</html>