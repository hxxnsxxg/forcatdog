<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/manager/stopTerm.css">
</head>
<body>
	<h2 align="center">정지 기간 설정</h2>
	<br><br>
	<form action="<%= request.getContextPath() %>/updatePw.do" method="post" id="updatePwForm" name="updatePwForm">
		<table align="center">	
			<tr>
				<td><label id="label">기간(일)</label></td>
				<td><input type="number" name="term" id="term" min="1"></td>
			</tr>
		</table>
		
		<br><br><br>
		
		<div class="btns" align="center">
			<input type="button" id="checkbtn" onclick="closeAction();" value="확인">
			<input type="button" id="cbtn" value="취소" onclick="window.close();">
		</div>
	</form>
</body>
<script>
	function closeAction() {
		if(document.getElementById('term').value <= 0) {
			alert("정지 일수를 입력하세요");
			return;
		}
		opener.stopUser(document.getElementById('term').value);
		
		self.close();
	}
</script>
</html>