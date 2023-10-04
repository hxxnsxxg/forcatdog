<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/message/sendMessageForm.css">
<link rel = "icon" href = "${ contextPath }/resources/images/favicon.ico">
<script src="${ contextPath }/resources/js/jquery-3.5.1.min.js"></script>
</head>
<body>
	<h2><img src="${ contextPath }/resources/images/sendamsg.png"></h2>
	
	<form action="sendMessage.ms" method="post">
		<input type="hidden" name="sendId" value="${ sessionScope.loginUser.id }">
		<input type="hidden" name="memberId" id="memberId" value="${ requestScope.memberId }">
		<c:if test="${ empty requestScope.memberId }">
			<input type="hidden" name="idCheck" value="N">
		</c:if>
		<c:if test="${ !empty requestScope.memberId }">
			<input type="hidden" name="idCheck" value="${ idCheck == null ? 'Y' : idCheck }">
		</c:if>
		<b>받는 사람 :</b>
		<div id="searchDiv">
		<c:if test="${ empty requestScope.memberId }">
			<input type="text" id="idSearch" maxlength="19" autocomplete="off" placeholder='닉네임을 입력하세요.'>
		</c:if>
		<c:if test="${ !empty requestScope.memberId }">
			<input type="text" id="idSearch" maxlength="19" autocomplete="off" value="${ requestScope.nickName }(${ requestScope.memberId })">
		</c:if>
			<div id="resultDiv">
			</div>
		</div>
		
		<input type="button" id="searchUser" value="찾기">
		
		<textarea rows="20" cols="70" name="mContent" id="mContent"></textarea>
		<br>
		<div class="btn_inline">
		
			<input type="submit" id="send" value="보내기">
		</div>
		<c:if test="${ empty requestScope.memberId }">
			<input type="button" id="cancel" value="취소" onclick="location.href='javascript:history.go(-1)'">
		</c:if>
		<c:if test="${ !empty requestScope.memberId }">
			<input type="button" id="cancel" value="취소" onclick="location.href='javascript:self.close()'">
		</c:if>
	</form>
	
	
	<script>
		$("#idSearch").on("keyup click", function() {
			var keyword = $(this).val();

			if(keyword != "") {
				$.ajax({
					url: 'searchUser.ms',
					type: 'post',
					data: {keyword: keyword},
					success: function(data) {
						var $resultDiv = $("#resultDiv");
						$resultDiv.html('');

						if(data.length > 0) {
							for(var i in data) {
								var $div = $('<div>').on("click", function() {
									var userInfo = $(this).children('.profile_area').children(".userName").text().split("(");
									userInfo[1] = userInfo[1].replace(")", "");
									
									$("#memberId").val(userInfo[1]);
									$('#idSearch').val(userInfo[0] + "(" + userInfo[1] + ")").attr("readonly", "");
									$resultDiv.css("display", "none");
								});
								var $profile = $('<div>').addClass('profile');
								if(data[i].changeFileName){
									var $img = $('<img>').attr("src", "resources/mprofileUploadFiles/" + data[i].changeFileName);
								} else {
									var $img = $('<img>').attr("src", "resources/images/user.png");
								}
								var $profile_area = $('<div>').addClass('profile_area');
								var $nickId = $('<div>').addClass("userName").text(data[i].nickName + "(" + data[i].id + ")");
								
								$profile.append($img);
								$profile_area.append($nickId);
								$div.append($profile);
								$div.append($profile_area);
	
								$resultDiv.append($div);
							}
							$resultDiv.css("display", "block");
						}
					}
				});
			} else {
				$("#resultDiv").css("display", "none");
			}
		}).focusout(function() {
			setTimeout(function() {
				$("#resultDiv").css("display", "none");
			}, 100);
		});

		document.getElementById("searchUser").onclick = function() {
			window.open('searchUserForm.ms', 'searchUserForm', 'width=540, height=690');
		};
		
		$(function(){
			$('#send').on('click', function(){
				
				var mContent = $('#mContent').val();
				var memberId = $('#checkId').val();
				var sendId = $('#sendId').val();
				
				location.href='sendMessage.ms?mContent=' + mContent + '&memberId=' + memberId + '&sendId=' + sendId;
			});
		});
		
	</script>
	
</body>
</html>