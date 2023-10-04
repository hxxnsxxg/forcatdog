<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<%@ include file="/resources/globalVariable.jsp" %>
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/base.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/content.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/match/FindMateDetail.css">
</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<%@ include file="/WEB-INF/views/common/nav.jsp" %>
		
		<div id='content'>
			<input type="hidden" id="matchNum" name="matchNum" value="${ requestScope.mc.matchNum }">
			<input type="hidden" id="matchCate" name="matchCate" value="${ requestScope.mc.matchCate }">
			
			<div class="match_title"><h1>매칭</h1></div>
			
			<br>
			
			<button type="button" class="match_type_btn" ${ cate == 1 ? "id='btn_on'" : "" } onClick="location.href='${ contextPath }/findMatchList.mc?cate=1'">
				<i class="fa fa-heart"></i> 짝
			</button>
			<button type="button" class="match_type_margin_btn0" ${ cate == 2 ? "id='btn_on'" : "" } onClick="location.href='${ contextPath }/findMatchList.mc?cate=2'">
				<i class="fa fa-walking"></i> 산책메이트
			</button>
			<button type="button" class="match_type_margin_btn1" ${ cate == 3 ? "id='btn_on'" : "" } onClick="location.href='${ contextPath }/findMatchList.mc?cate=3'">
				<i class="fa fa-baby-carriage"></i> 펫 시터
			</button>
			<c:url var="insertmatchform" value="insertMatchForm.mc">
				<c:param name="cate" value="${ mc.matchCate }"/>
			</c:url>
					
			<br><br>
			
			<div class="match_content">
				<h1 class="detail_title">${ mc.matchTitle }</h1>
				<div class="margin-top">
					<p class="font_deco4">작성자 </p> <p class="font_deco5">${ mc.nickName }</p>
				</div>
				<div class="inform">
				<h1></h1>
					<c:forEach items="${ requestScope.mc.petList }" var="mcf">
						<img class="mypet_detail" alt="나의펫" src="${ contextPath }/resources/mpetUploadFiles/${ mcf.changeFileName }">
						<div class="info_area">
							<p class="font_deco1">이름 </p> <p class="font_deco2">${ mcf.petName }</p><br>
							<p class="font_deco1">견종 </p> <p class="font_deco2">${ mcf.petType2 }</p><br>
							<p class="font_deco1">성격 </p> <p class="font_deco2">${ mcf.personality }</p><br>
							<p class="font_deco1">지역 </p> <p class="font_deco2">${ mc.addr1 } / ${ mc.addr2 } / ${ mc.addr3 }</p><br>
							<p class="font_deco1">성별 </p> <p class="font_deco2">${ mcf.gender }</p><br>
							<p class="font_deco1">나이 </p> <p class="font_deco2">${ mcf.birthYear }년생</p><br>
							<p class="font_deco1">기타 </p>
							<p class="font_deco2">${ fn:replace(mc.petList[0].inform, replaceChar, "<br/>") }</p>
						</div>
						<br>
						<br>
					</c:forEach>
			
				<br>
					<div class="matchContent">
							<p class="font_deco1">기타내용 </p><br>
							<p class="font_deco2_width">${ fn:replace(mc.matchContent, replaceChar, "<br/>") }</p>
							
					</div>	
				</div>
				<div class="btnArea">
					<button class="returnListBtn"z onClick="location.href='${ contextPath }/findMatchList.mc?cate=${ mc.matchCate }'">
						<i class="fa fa-undo"></i> 목록으로
					</button>
					<c:if test="${loginUser != null && sessionScope.loginUser.id == requestScope.mc.memberId }">
						<c:if test="${ matchCount <= 0 }">
							<form action="matchUpdateForm.mc" method="post" role="form">
								<input type="hidden" name="matchNum" value="${ mc.matchNum }">
								<button class="updateMatch">
									<i class="fa fa-edit"></i>수정하기
								</button>
							</form>
						</c:if>
						<c:if test="${ matchYCount <= 0 }">
							<form action="matchDelete.mc" method="post" role="form">
								<input type="hidden" name="matchNum" value="${ mc.matchNum }">
								<input type="hidden" name="cate" value="${ mc.matchCate }">
								<button class="deleteMatch">
									<i class="fa fa-times"></i>삭제하기
								</button>
							</form>
						</c:if>
					</c:if>
					<c:if test="${ sessionScope.loginUser != null && sessionScope.loginUser.id != requestScope.mc.memberId }">
						<button class="applyBtn" onclick="matchingPopup();">
							<i class="fa fa-sign-in-alt"></i> 신청하기
						</button>
		                <button type="button" class="sendMessageBtn" id="sendmsg" onclick="sendMessagePopup();">
		                	<i class="fa fa-paper-plane"></i> 쪽지하기
		                </button>
                   	</c:if>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
	<script>
		function matchingPopup(){
			var popupX = (window.screen.width / 2) - (377 / 2);
			var popupY = (window.screen.height / 2) - (330 / 2);
		
			window.open("", "MatchingPopup",'status=no, height=770, width=650, left='+ popupX + ', top='+ popupY);
			var form = document.createElement("form");
			form.action = "${ contextPath }/MatchingPopup.mc";
			form.method = "post";
			form.target = "MatchingPopup";

			var matchNum = document.getElementById("matchNum").cloneNode();
			var matchCate = document.getElementById("matchCate").cloneNode();

			form.appendChild(matchNum);
			form.appendChild(matchCate);

			document.body.appendChild(form);

			form.submit();

			document.body.removeChild(form);
			
		}
		
		function sendMessagePopup(){
			var popupX = (window.screen.width / 2) - (853 / 2);
			var popupY = (window.screen.height / 2) - (632 / 2);
			
			window.open("", "sendingMessage",'status=no, height=690, width=580, left='+ popupX + ', top='+ popupY);
			var form = document.createElement("form");
			form.action = "${ contextPath }/sendMessageForm.ms";
			form.method = "post";
			form.target = "sendingMessage";

			var userId = document.createElement("input");
			userId.type = "hidden";
			userId.name = "userId";
			userId.value = "${ mc.memberId }";
			var nickName = document.createElement("input");
			nickName.type = "hidden";
			nickName.name = "nickName";
			nickName.value = "${ mc.nickName }";

			form.appendChild(userId);
			form.appendChild(nickName);

			document.body.appendChild(form);

			form.submit();

			document.body.removeChild(form);

		}
	</script>
</body>
</html>