<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
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
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/member/joinMember.css">

<script src="${ contextPath }/resources/js/join.js"></script>
<script src="${ contextPath }/resources/js/memberLocation.js"></script>

</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<%@ include file="/WEB-INF/views/common/nav.jsp" %>
		
		<div id='content'>
			<div id="container">
				<form action="${ contextPath }/join.me" method="post" id="joinForm">
					<table>
						<tr>
							<td colspan="2">
								<img src="${ contextPath }/resources/images/join.png"><br>
								<hr>
							</td>
						</tr>
						<tr>
							<td>
								아이디 :
							</td>
							<td>
								<input type="text" class="input" name="id" required>
								<input type="button" id="idCheckBtn" value="중복확인" class="overlap">
							</td>
						</tr>
						<tr>
							<td>
								비밀번호 :
							</td>
							<td>
								<input type="password" class="input" name="pw" required>
							</td>
						</tr>
						<tr>
							<td>
								비밀번호 확인 :
							</td>
							<td>
								<input type="password" class="input" name="pw2" required>
							</td>
						</tr>
						<tr>
							<td>
								이름 :
							</td>
							<td>
								<input type="text" id="name" class="input" name="name" maxlength="20" required>
							</td>
						</tr>
						<tr>
							<td>
								성별 :
							</td>
							<td>
								<input type="radio" value="M" name="gender" id='male' checked required><label for="male">남</label>
								<input type="radio" value="F" name="gender" id='female' required><label for="female">여</label>
							</td>
						</tr>
						<tr>
							<td>
								닉네임 :
							</td>
							<td>
								<input type="text" class="input" name="nickName" maxlength="20" required>
								<input type="button" id="checkNickname" value="중복확인" class="overlap">
							</td>
						</tr>
						<tr>
							<td>
								연락처 :
							</td>
							<td>
								<input type="hidden" name="phone">
								<select class="phone" name="phone1">
			                        <option>010</option>
			                        <option>011</option>
			                        <option>016</option>
	                    		</select>
								- <input type="text" class="phone" name="phone2" maxlength="4" required> 
								- <input type="text" class="phone" name="phone3" maxlength="4" required>
							</td>
						</tr>
						<tr>
							<td>
								생년월일 : 
							</td>
							<td>
								<input type="hidden" name="birth">
								<select name="year" class="birth">
									<c:forEach begin="<%= new GregorianCalendar().get(Calendar.YEAR) - 100 %>" end="<%= new GregorianCalendar().get(Calendar.YEAR) %>" var="i">
										<option value="${ i }">${ i }</option>
									</c:forEach>
								</select>
								<select name="month" class="birth">
									<c:forEach begin="1" end="12" var="i">
										<option value="${ i }">${ i }</option>
									</c:forEach>
								</select>
								<select name="date" class="birth">
									<c:forEach begin="1" end="31" var="i">
										<option value="${ i }">${ i }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								이메일 :
							</td>
							<td class="email">
								<input type="hidden" name="email">
								<input type="text" class="input" name="email1" required>
								@
								<input type="text" class="input" name="email2" maxlength="20" required>
								<select id="emailSelect" class="input">
									<option value="">직접입력</option>
									<option>naver.com</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								비밀번호 힌트 :
							</td>
							<td>
								<select name="pwHintNo" class="input">
									<c:forEach items="${ requestScope.pwHint }" var="hint">
										<option value="${ hint.PW_HINT_NUM }">${ hint.PW_HINT }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								비밀번호 힌트 답 :
							</td>
							<td>
								<input type="text" class="input" name="pwHintAns">
							</td>
						</tr>
						<tr>
							<td>
								거주 지역 :
							</td>
							<td>
								<select name="addr1" class="input" onchange="sidoChange();">
				                     <option value="">시/도</option>
				                     <c:forEach items="${ location1 }" var="l1">
				                     	<option>${ l1 }</option>
				                     </c:forEach>
			                    </select>
			                    <select name="addr2" class="input" onchange="sigunguChange();" disabled>
			                     	<option value="">시/군/구</option>
			                    </select>
			                    <select name="addr3" class="input" disabled>
			                     	<option value="">동</option>
			                    </select>
							</td>
						</tr>
						
						<tr>
							<td colspan="2">
								<input type="button" value="회원가입" id="join" class="button">
								<input type="button" value="돌아가기" class="button" id="cancel">
							</td>
						</tr>
						
					</table>
				</form>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
</body>
</html>