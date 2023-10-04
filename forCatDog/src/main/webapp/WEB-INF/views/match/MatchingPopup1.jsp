<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/resources/globalVariable.jsp"%>
<title>forCatDog</title>
<link rel = "icon" href = "${ contextPath }/resources/images/favicon.ico">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/match/MatchingPopup1.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/paging.css">
</head>
<body align="center">
	<form action="matchMember.mc" method="post" name="matchMember">
		<input type="hidden" name="matchNum" value="${ matchNum }">
		<input type="hidden" name="matchCate" value="${ matchCate }">
	
		<div class="header">짝 신청</div>
		<br> <br>
		<p class="matchingPopupContent">정말로 신청하시겠습니까?</p>
		<p class="matchingPopupContent">신청 시 상대방에게 알림 메세지가 전달됩니다.</p>
		
		<br>
		
		<div class='block'>
			<c:if test="${ requestScope.mpList.size() <= 0 }">
				<script>
					alert("등록된 펫이 없습니다.");
					self.close();
				</script>
			</c:if>
			<c:forEach items="${ requestScope.mpList }" var="mp">
				<div class='pet' onclick="petClick(${ mp.petNum });">
					<input type="radio" name="petNum" class="selectBtn" id="radio${ mp.petNum }" value="${ mp.petNum }">
					<div class="petImgArea">
						<img class="petImg" src='${ contextPath }/resources/mpetUploadFiles/${ mp.changeFileName }'>
					</div>
					<span>${ mp.petName }</span>
				</div>
			</c:forEach>
		</div>
		
		<c:if test="${ requestScope.mpList.size() > 0 }">
			<div class="pagingArea" align="center">
				<!-- [이전] -->
				<c:if test="${ 1 >= pi.startPage }">
					<button class="border first"><i class="fas fa-chevron-left"></i></button>&nbsp;
				</c:if>
				<c:if test="${ 1 < pi.startPage }">
					<c:url var="before" value="${ loc }">
						<c:param name="page" value="${ pi.startPage - 1 }"/>
						<c:param name="matchNum" value="${ matchNum }"/>
						<c:param name="matchCate" value="${ matchCate }"/>
					</c:url>
					<button class="border pointer" onclick="location.href='${ before }'"><i class="fas fa-chevron-left"></i></button>&nbsp;
				</c:if>
				
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<button class="num selected">${ p }</button>
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="${ loc }">
							<c:param name="page" value="${ p }"/>
							<c:param name="matchNum" value="${ matchNum }"/>
							<c:param name="matchCate" value="${ matchCate }"/>
						</c:url>
						<button class="num pointer" onclick="location.href='${ pagination }'">${ p }</button>&nbsp;
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ pi.maxPage <= pi.endPage }">
					 <button class="border last"><i class="fas fa-chevron-right"></i></button>&nbsp;
				</c:if>
				<c:if test="${ pi.maxPage > pi.endPage }">
					<c:url var="after" value="${ loc }">
						<c:param name="page" value="${ pi.endPage + 1 }"/>
						<c:param name="matchNum" value="${ matchNum }"/>
						<c:param name="matchCate" value="${ matchCate }"/>
					</c:url> 
					<button class="border pointer" onclick="location.href='${ after }'"><i class="fas fa-chevron-right"></i></button>&nbsp;
				</c:if>			
			</div>			
		</c:if>
		
		<textarea name="mContent"></textarea>
		
		<br>

		<button class="applyBtn" type="submit" onclick="checkPet();">
			<i class="fa fa-paw"></i>신청
		</button>
		<button class="closeBtn" type="button" onClick='window.close()'>취소</button>
	</form>
	
	
	
	<script>
		function petClick(petNum) {
			document.getElementById("radio" + petNum).checked = true;
		}

		function checkPet() {
			var radio = document.getElementsByName("petNum");

			var check = false;
			for(var i in radio) {
				if(radio[i].checked == true) {
					check = true;
				}
			}
			if(check) {
				if(document.getElementsByName("mContent")[0].value == "") {
					alert("내용을 입력하세요.");
				} else {
					document.matchMember.submit();
				}
			} else {
				alert("펫을 선택하세요.");
			}
			
		}
	</script>
</body>
</html>