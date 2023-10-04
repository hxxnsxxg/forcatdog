<%@page import="com.kh.forcatdog.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/header.css">
</head>
<body>
<div id="headline"></div>
	<div id='header'>
		<div id='linemenu'>
			<div id='linemenulink'>
				<div>
					<c:if test="${ sessionScope.loginUser == null }">
						<a href='${ contextPath }/loginForm.me'><span>로그인</span></a>
						<a href='${ contextPath }/joinForm.me'><span>회원가입</span></a>
					</c:if>
					<c:if test="${ sessionScope.loginUser != null }">
						<a onclick="window.open('${ contextPath }/messageListForm.ms', 'messageListForm', 'width=580, height=690');"><span>쪽지함<span id="msgCount"></span></span></a>
						<a href='${ contextPath }/logout.me'><span>로그아웃</span></a>
						<c:if test="${ loginUser.adminQ eq 'Y' }">
							<a href='${ contextPath }/managerMain.mn'><span>관리자 페이지</span></a>
						</c:if>
						<a href='${ contextPath }/myPage.me'><span>마이페이지</span></a>
					</c:if>
					<a href='${ contextPath }/notice.cs'><span>고객센터</span></a>
				</div>
			</div>
		</div>
		
		<a href="${ contextPath }">
			<img id='logo-img' alt="포캣독" src="${ contextPath }/resources/images/titleIcon.png">
		</a>
			
		<form action="allSearch.all" method="get" class="AllSearchForm" onsubmit="return check();">
	       	 <div id="header-search">
	         	<input type="text" id="area" name="word" placeholder="검색어를 입력하세요!" value="${ word != null ? word : '' }"> 
	         	<button id="AllSearchBtn"><i class="fa fa-search fa-2x"></i></button>
	         </div>
		</form>
	</div>
	<script>
		function check(){
			var textArea = document.getElementById("area").value;
			 
			if(textArea == '') {
				alert('검색어를 입력하세요.');
				return false;
			} else {
				return true;
			}
		}

		<c:if test="${ sessionScope.loginUser != null }">
			$.ajax({
				url: "nonReadMessageCount.ms",
				success: function(data) {
					if(data > 0) {
						document.getElementById("msgCount").innerHTML = "(" + data + ")";
					}
				}
			});
		</c:if>
	</script>
</body>
</html>