<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/member/completeFind.css">
</head>
<body>
	<div id="outer" align="center">
		<div id="container">
			<table>
				<tr id="theader">
					<td align="center">
						<img src="<%= request.getContextPath() %>/resources/images/findid.png"><br><hr width="500">
					</td>
				</tr>
				<tr id="tbody">
					<td>
						<p>'${ member.name }'님의 아이디는 <b>${ member.id }</b>입니다.</p><br><br>
					</td>
				</tr>
				<tr id="tfooter">
					<td align="center">
						<input type="submit" value="로그인 하기" id="loginbtn" class="button" onclick="window.close();"> <input type="button" value="비밀번호 찾기" class="button" id="mainbtn" onclick="location.href='findPwdForm.me'">
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>