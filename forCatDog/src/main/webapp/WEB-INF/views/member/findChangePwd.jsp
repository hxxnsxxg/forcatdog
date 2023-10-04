<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/member/findChangePwd.css">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<div id="outer" align="center">
		<div id="container">
		<form method="post" action="findChangePwd.me" onsubmit="return checkIt()">
		<input type="hidden" value="${ member.id }" name="id">
		<input type="hidden" value="${ member.name }" name="name">
			<table>
				<tr id="theader">
					<td align="center" colspan="2">
					<img src="<%= request.getContextPath() %>/resources/images/findpwd.png"><br><hr width="500">
					</td>
				</tr>
				<tr id="tbody">
					<td colspan="2">
						<p id="alram">${ member.name } 회원님의 새로운 비밀번호를 설정 해 주세요.</p><br>
					</td>
				</tr>
				<tr>
					<td>
						새로운 비밀번호 : 
					</td>
					<td>
						<input type="password" class="input" name="newPwd1">
					</td>
				</tr>
				<tr>
					<td>
						새로운 비밀번호 확인 : 
					</td>
					<td>
						<input type="password" class="input" name="newPwd2">
					</td>
				</tr>
				<tr id="tfooter">
					<td align="center" colspan="2">
						<input type="submit" value="변경완료" id="change" class="button"> <input type="button" value="돌아가기" class="button" id="mainbtn">
					</td>
				</tr>
			</table>
			</form>
		</div>
	</div>
	<script>
	function checkIt(){
		if($("#opTitle").val() == ''){
			alert('제목을 입력해주세요.');
			$("#opTitle").focus();
			return false;
		}
		
		if($('#opContent').val() == ''){
			alert('내용을 입력해주세요.');
			$('#opContent').focus();
			return false;
		}
		
		return true;
	}
	</script>
</body>
</html>