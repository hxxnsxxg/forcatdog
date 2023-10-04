<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<%@ include file="/resources/globalVariable.jsp" %>
<link rel = "icon" href = "${ contextPath }/resources/images/favicon.ico">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/member/matchPetInfo.css">

</head>
<body>
	<div class="header">
		<i class="fa fa-paw"></i> 신청 정보
	</div>
	<div id="person">신청인 : ${ requestScope.nickName }</div>
	<div id="content">
		<form method="post" name="reqForm">
			<input type="hidden" name="matchNum" value="${ requestScope.matchNum }">
			<input type="hidden" name="memberId" value="${ requestScope.id }">
			<c:forEach items="${ requestScope.petList }" var="mp">
				<div class='pet'>
					<div class="petImgArea">
						<img class="petImg" src='${ contextPath }/resources/mpetUploadFiles/${ mp.changeFileName }'>
					</div>
					<div class="petInfo">
						<div>
							<span class="title">이름</span> 
							<span class="content">${ mp.petName }(${ mp.gender == 'M' ? "남" : "여" })</span>
						</div>
						<div>
							<span class="title">종류</span> 
							<span class="content">${ mp.petType1 } / ${ mp.petType2 }</span>
						</div>
						<div>
							<span class="title">몸무게</span> 
							<span class="content">${ mp.weight }</span>
						</div>
						<div>
							<span class="title">생년</span> 
							<span class="content">${ mp.birthYear }</span>
							
							<br>
							
							<span class="title">성격</span> 
							<span class="content">${ mp.personality }</span>
						</div>
					</div>
					<div style="display: none;" class="inform">
						<span class="title">기타 정보</span>
						<br>
						<span class="content">${ mp.inform }</span>
					</div>
				</div>
			</c:forEach>
			<%
				pageContext.setAttribute("newLineChar", "\r\n");
			%>
			
			<div class="contentBlock">
				<div class="match">
					기타 내용
				</div>
				<div class="matchContent">
					${ fn:replace(matchContent, newLineChar, "<br>") }
				</div>
			</div>
			<div id="buttonPanel">
				<c:if test="${ option == 'P' }">
					<button type="button" id="accept">
						<i class="fa fa-check"> 수락</i>
					</button>
					<button type="button" id="reject">
						<i class="fa fa-times"> 거절</i>
					</button>
				</c:if>
				<c:if test="${ option != 'P' }">
					<input type="button" id="close" value="닫기" onclick="self.close();">
				</c:if>
			</div>
		</form>
	</div>
	
	<script>
		<c:if test='${petList.size() <= 0}'>
			window.resizeTo(720, 500);
		</c:if>
	
		$('.pet').mouseenter(function(){
	    	$(this).css('background','#F2EBEB');
	  	});
	  	$('.pet').mouseleave(function(){
	    	$(this).css('background','none');
	  	});
	
		$(".pet").on("click", function(e) {
			if($(this).children(".inform").css("display") == "none") {
				$(this).children(".inform").css("display", "block");
			} else {
				$(this).children(".inform").css("display", "none");
			}
		});

		document.getElementById("accept").onclick = function() {
			document.reqForm.action = "acceptMatch.me";
			document.reqForm.submit();
		};
		
		document.getElementById("reject").onclick = function() {
			document.reqForm.action = "rejectMatch.me";
			document.reqForm.submit();
		};
	</script>
	
</body>
</html>