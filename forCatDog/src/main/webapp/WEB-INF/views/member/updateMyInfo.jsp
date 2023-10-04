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
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/member/updateMyInfo.css">

<script src="${ contextPath }/resources/js/memberUpdate.js"></script>
<script src="${ contextPath }/resources/js/memberLocation.js"></script>

</head>
<body>
	<c:set var="info" value="${ requestScope.memberInfo }"/>

	<div class="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<%@ include file="/WEB-INF/views/common/nav.jsp" %>
		
		<div id='content'>
			<div class='paddingdiv'>
				<h1>내 정보 수정</h1>
				<form action="mUpdate.me" method="post" id="updateForm">
					<table id='myinfotable'>
						<tr>
							<th>아이디</th>
							<td>
								<input type="hidden" name="id" value="${ info.id }">
								${ info.id }
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><button type="button" id="updatePw">비밀번호 수정</button></td>
						</tr>
						<tr>
							<th>이름</th>
							<td>
								${ info.name }(${ info.gender == "M" ? "남자" : "여자" })
							</td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td>
								<input type="text" class="inputShort" name="nickName" required value="${ info.nickName }"> 
								<input type="button" id="checkNickname" value="중복확인">
							</td>
						</tr>
						<tr>
							<th>
								생년월일 
							</th>
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
							<th>이메일</th>
							<td>
								<input type="hidden" name="email">
								
								<c:set var="email" value="${ info.email.split('@') }"/>
								<input type="text" class="inputShort" name="email1" required value='${ email[0] }'>
								@
								<input type="text" class="inputShort" name="email2" maxlength="20" required value='${ email[1] }'>
								<select id="emailSelect" class="input">
									<option value="">직접입력</option>
									<option>naver.com</option>
									<option>google.com</option>
									<option>hanmail.net</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>연락처</th>
							<td>
								<input type="hidden" name="phone" class="inputShort">
							
								<c:set var="phone" value="${ info.phone.split('-') }"/>
							
								<select name="phone1" id="phone1" class="inputShort">
									<option>010</option>
									<option>011</option>
									<option>016</option>
								</select> 
								&nbsp; - &nbsp; 
								<input type="text" maxlength="4" size="4" name="phone2" id="phone2" class="inputShort" required value="${ phone[1] }"> 
								&nbsp; - &nbsp; 
								<input type="text" maxlength="4" size="4" name="phone3" id="phone3" class="inputShort" required value="${ phone[2] }">
							</td>
						</tr>
						<tr>
							<th>비밀번호 힌트</th>
							<td>
								<br>
								<div>
									<select name="pwHintNo" class="input" style="width: 280px;">
										<c:forEach items="${ requestScope.pwHint }" var="hint">
											<option value="${ hint.PW_HINT_NUM }">${ hint.PW_HINT }</option>
										</c:forEach>
									</select>
								</div>
									<br>
								<div id="pwAns">비밀번호 찾기 답변</div>
								<br>
								<div>
									<input size="32" name="pwHintAns" class="input" required value="${ info.pwHintAns }" placeholder="답변"><br> <br>
								</div>
							</td>
						</tr>
						<tr>
							<th>
								거주 지역
							</th>
							<td>
								<select name="addr1" class="input" onchange="sidoChange();">
					            	<option value="">시/도</option>
					                <c:forEach items="${ location1 }" var="l1">
					                     <option>${ l1 }</option>
					                </c:forEach>
				                </select>
				                <select name="addr2" class="input" onchange="sigunguChange();">
				                    <c:forEach items="${ location2 }" var="l2">
					                     <option>${ l2 }</option>
					                </c:forEach>
				                </select>
				                <select name="addr3" class="input">
				                    <c:forEach items="${ location3 }" var="l3">
					                     <option>${ l3 }</option>
					                </c:forEach>
				                </select>
							</td>
						</tr>
					</table>
				
					<button type="button" id='updatebtn'>
						<i class="fa fa-highlighter fa-2x"> &nbsp;수정</i>
					</button>
				</form>
			</div>
		</div>
		
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
	
	<script>
		$(function() {
			var birth = '${ info.birth }'.split('-');
			for(var i = 0; i < birth.length; i++) {
				birth[i] = parseInt(birth[i]);
			}
			
			var year = document.getElementsByName("year")[0].children;
			for(var i = 0; i < year.length; i++) {
				if(year[i].value == birth[0]) {
					year[i].selected = true;
					break;
				}
			}

			var month = document.getElementsByName("month")[0].children;
			for(var i = 0; i < month.length; i++) {
				if(month[i].value == birth[1]) {
					month[i].selected = true;
					break;
				}
			}

			var date = document.getElementsByName("date")[0].children;
			for(var i = 0; i < date.length; i++) {
				if(date[i].value == birth[2]) {
					date[i].selected = true;
					break;
				}
			}
			
			var email = document.getElementById("emailSelect");
			email.onchange = function() {
				var email2 = document.getElementsByName("email2")[0];
				var value = this.value;
		
				if (value != "") {
					email2.setAttribute("readonly", "");
				} else {
					email2.removeAttribute("readonly");
				}
		
				email2.value = value;
			};
		
			var emailOption = email.children;
			for(var i = 0; i < emailOption.length; i++) {
				if(emailOption[i].value == '${ email[1] }') {
					var email2 = document.getElementsByName("email2")[0];
					var value = emailOption[i].value;
			
					if (value != "") {
						email2.setAttribute("readonly", "");
					} else {
						email2.removeAttribute("readonly");
					}
					emailOption[i].selected = true;
					break;
				}
			}

			var phoneOption = document.getElementById("phone1").children;
			for(var i = 0; i < phoneOption.length; i++) {
				if(phoneOption[i].value == '${ phone[0] }') {
					phoneOption[i].selected = true;
					break;
				}
			}

			var pwHintOption = document.getElementsByName("pwHintNo")[0].children;
			for(var i = 0; i < pwHintOption.length; i++) {
				if(pwHintOption[i].value == '${ info.pwHintNo }') {
					pwHintOption[i].selected = true;
					break;
				}
			}

			var addr1 = document.getElementsByName("addr1")[0].children;
			for(var i = 0; i < addr1.length; i++) {
				if(addr1[i].value == '${ info.addr1 }') {
					addr1[i].selected = true;
					break;
				}
			}

			var addr2 = document.getElementsByName("addr2")[0].children;
			for(var i = 0; i < addr2.length; i++) {
				if(addr2[i].value == '${ info.addr2 }') {
					addr2[i].selected = true;
					break;
				}
			}

			var addr3 = document.getElementsByName("addr3")[0].children;
			for(var i = 0; i < addr3.length; i++) {
				if(addr3[i].value == '${ info.addr3 }') {
					addr3[i].selected = true;
					break;
				}
			}
			
			$('#updatebtn').mouseenter(function(){
			    $(this).css('color','black');
			});
			$('#updatebtn').mouseleave(function(){
			   	$(this).css('color','gray');
			});
		});
	</script>
</body>
</html>