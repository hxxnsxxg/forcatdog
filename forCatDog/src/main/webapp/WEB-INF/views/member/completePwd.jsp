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
					<img src="<%= request.getContextPath() %>/resources/images/findpwd.png"><br><hr width="500">
					</td>
				</tr>
				<tr id="tbody">
					<td>
						<p>'${ name }'님의 비밀번호를 변경하였습니다.</p><br><br>
					</td>
				</tr>
				<tr id="tfooter">
					<td align="center">
						<input type="submit" value="로그인 하기" id="loginbtn" class="button" onclick="login();">
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	<script>
	function login(){
		window.close();
	}
	</script>
</body>
</html>