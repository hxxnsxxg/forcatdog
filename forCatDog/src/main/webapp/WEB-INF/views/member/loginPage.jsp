<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<%@ include file="/resources/globalVariable.jsp" %>

<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/base.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/content.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/member/login.css">
</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<%@ include file="/WEB-INF/views/common/nav.jsp" %>
		
		<div id='content'>
			<div id="container">
				<form action="login.me" method="post">
					<table>
						<tr id="theader">
							<td><img src="${ contextPath }/resources/images/loginhigh.png"></td>
						</tr>
						<tr id="tbody">
							<td>
								<br>
								<input type="text" name="id" placeholder="아이디" class="input"><br>
								<input type="password" name="pw" placeholder="패스워드" class="input"><br>
								<input type="submit" value="로그인" class="button" id="login"><br>
								<input type="button" value="아이디 찾기" class="button" id="findId" onclick="findId();">  
								<input type="button" value="비밀번호 찾기" class="button" id="findPwd" onclick="findPwd();">
								<br><br><br>
							</td>
						</tr>
						<tr id="tfooter">
							<td><img src="${ contextPath }/resources/images/loginlow.png"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
	<script>
	
	$(function(){
		$('#findId').on('click',function(){
			window.open('findIdForm.me', '' ,'width=540px, height=380px, location=no');
		});
	});
	
	$(function(){
		$('#findPwd').on('click', function(){
			window.open('findPwdForm.me', '' ,'width=540px, height=380px, location=no');
		});
	});
	</script>
</body>
</html>