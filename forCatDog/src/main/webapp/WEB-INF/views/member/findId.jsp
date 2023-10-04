<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/member/findId.css">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<div id="outer" align="center">
		<div id="container">
		<form action="${ contextPath }/findId.me" method="post" id="findIdForm" onsubmit="return checkIt()">
			<table>
				<tr id="theader">
					<td align="center" colspan="2">
					<img src="<%= request.getContextPath() %>/resources/images/findid.png"><br><hr width="530">
					</td>
				</tr>
				<tr id="tbody">
					<td>
						이름 : 
					</td>
					<td>
						<input type="text" id="name" name="name" class="input">
					</td>
				</tr>
				<tr>
					<td>
						연락처 : 
					</td>
					<td>
						<select class="phone" id="phone1">
			                <option>010</option>
			                <option>011</option>
			                <option>016</option>
	                    </select>
						- <input type="text" class="phone" id="phone2" maxlength="4" required> 
						- <input type="text" class="phone" id="phone3" maxlength="4" required>
					</td>
				</tr>
				<tr>
					<td>
						생년월일 : 
					</td>
					<td>
						<select id="year" class="birth">
							<c:forEach begin="<%= new GregorianCalendar().get(Calendar.YEAR) - 100 %>" end="<%= new GregorianCalendar().get(Calendar.YEAR) %>" var="i">
								<option value="${ i }">${ i }</option>
							</c:forEach>
						</select>
						<select id="month" class="birth">
							<c:forEach begin="1" end="12" var="i">
								<option value="${ i }">${ i }</option>
							</c:forEach>
						</select>
						<select id="date" class="birth">
							<c:forEach begin="1" end="31" var="i">
								<option value="${ i }">${ i }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr id="tfooter">
					<td align="center" colspan="2">
						<input type="button" value="아이디 찾기" id="findId" class="button"> <input type="button" value="돌아가기" class="button" id="cancel" onclick="window.close();">
					</td>
				</tr>
			</table>
			</form>
		</div>
	</div>
	<script>
		$(function(){
			$('#findId').on('click', function(){
				
				if($("#name").val() == ''){
					alert('이름을 입력해주세요.');
					$("#name").focus();
					return false;
				}
				
				if($('#phone2').val() == '' && $('#phone3').val() == ''){
					alert('연락처를 입력해주세요.');
					$('#phone2').focus();
					return false;
				}
				
				var name = $('#name').val();
				
				var phone1 = $('#phone1').val();
				var phone2 = $('#phone2').val();
				var phone3 = $('#phone3').val();
				var phone = phone1 + '-' + phone2 + '-' + phone3;
				
				
				var year = $('#year').val();
				var month = $('#month').val();
				var date = $('#date').val();
				var birth = year + "-" + month + "-" + date;
				
				location.href='findId.me?name=' + name + '&phone=' + phone + '&birth=' + birth;
			});
		});

	</script>
</body>
</html>