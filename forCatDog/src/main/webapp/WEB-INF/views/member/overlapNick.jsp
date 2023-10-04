<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/member/overlapNick.css">
</head>
<body>
	<div id="headline"></div>
	<div id='header'>
	</div>
	<div id='content'>
			<table>
				<tr>
					<td style="margin-top:20px;"><img src="<%= request.getContextPath() %>/resources/images/idcheck.png"><br>
					<hr color="#F2EBEB"></td>
				</tr>
				<tr>
					<td><p>아이디 : <input type="text" id="name" class="input"> <input type="button" value="중복확인" class="btn"></p></td>
				</tr>
				<tr>
					<td><p>아이디 중복확인을 해주세요.</p></td>
				</tr>
				<tr>
					<td align="center"><input type="button" class="btn" value="확인" id="ok"><input type="button" class="btn" value="취소">
				</tr>
			</table>
	</div>
	
	<div id='footer'>
	</div>
</body>
</html>