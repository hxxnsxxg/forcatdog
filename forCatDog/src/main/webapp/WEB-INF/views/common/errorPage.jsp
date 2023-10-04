<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<%@ include file="/resources/globalVariable.jsp"%>
<link rel = "icon" href = "${ contextPath }/resources/images/favicon.ico">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/base.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/error.css">
</head>
<body>
	<div id="error-container">
		<span id="tri"><i id="exclamation" class="fa fa-exclamation-triangle fa-5x"></i></span>
		<br>
		
		<span id="announce">죄송합니다. 다시 시도해 주세요.</span>
		
		<br><br><br>
		
		<button id="btn">
			<i class="fa fa-reply fa-3x"></i> 뒤로가기
		</button>
	</div>
	
	<script>
		$(function(){
			$('#btn').mouseenter(function(){
		    	$(this).css('color','black');
		  	});
		  	$('#btn').mouseleave(function(){
		    	$(this).css('color','gray');
		  	});
		  	$('#btn').click(function(){
		    	window.history.back();
		  	});
		});
	</script>
</body>
</html>