<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/resources/globalVariable.jsp"%>
<title>forCatDog</title>
<link rel = "icon" href = "${ contextPath }/resources/images/favicon.ico">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/match/MatchingPopup2.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/paging.css">
</head>
<body align="center">
	<form action="matchMember.mc" method="post" name="matchMember">
		<input type="hidden" name="matchNum" value="${ matchNum }">
		<input type="hidden" name="matchCate" value="${ matchCate }">
		<div class="header">산책메이트 신청</div>
		<br> <br>
		<p class="matchingPopupContent">정말로 신청하시겠습니까?</p>
		<p class="matchingPopupContent">신청 시 상대방에게 알림 메세지가 전달됩니다.</p>
		
		<br>
		
		<div id="selectedPet">
			<c:forEach items="${ requestScope.checkPet }" var="p">
				<div id="div${ fn:split(p, '/')[0] }">
					${ fn:split(p, '/')[1] }
					<input type="hidden" name="petNum" value="${ fn:split(p, '/')[0] }">
					<input type="hidden" name="checkPet" value="${ p }">
					<input type="button" value="x" onclick="removePet(${ fn:split(p, '/')[0] });">
				</div>
			</c:forEach>
		</div>
		
		<div class='block'>
			<c:if test="${ requestScope.mpList.size() <= 0 }">
				<script>
					alert("등록된 펫이 없습니다.");
					self.close();
				</script>
			</c:if>
			<c:forEach items="${ requestScope.mpList }" var="mp">
				<div class='pet' onclick="petClick(${ mp.petNum }, '${ mp.petName }');">
					<input type="checkbox" class="checkPet" id="check${ mp.petNum }" value="${ mp.petNum }">
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
		
		<button class="applyBtn" type="sumit" onclick="checkPet();">
			<i class="fa fa-paw"></i>신청
		</button>
		<button class="closeBtn" type="button" onClick='window.close()'>취소</button>
	</form>
	
	<script>
		$(function() {
			$(".checkPet").each(function(i, element) {
				var checkPet = document.getElementsByName("petNum");	
				for(var i = 0; i < checkPet.length; i++) {
					if(element.value == checkPet[i].value) {
						element.checked = true;
						break;
					}
				}
			});
		});
	
		function petClick(petNum, petName) {
			var check = document.getElementById("check" + petNum);

			if(check.checked) {
				check.checked = false;

				var petDiv = document.getElementById("div" + petNum);

				document.getElementById("selectedPet").removeChild(petDiv);
				
			} else {
				check.checked = true;

				var input = document.createElement("input");
				input.type = "hidden";
				input.name = "petNum";
				input.value = petNum;

				var input2 = document.createElement("input");
				input2.type = "hidden";
				input2.name = "checkPet";
				input2.value = petNum + "/" + petName;

				var button = document.createElement("input");
				button.type = "button";
				button.value = "x";
				button.addEventListener("click", function(e) {
					removePet(petNum);
				});

				var div = document.createElement("div");
				div.id = "div" + petNum;
				div.innerHTML = petName;

				div.appendChild(input);
				div.appendChild(input2);
				div.appendChild(button);
				document.getElementById("selectedPet").appendChild(div);
			}
		}

		function removePet(petNum) {
			var petDiv = document.getElementById("div" + petNum);

			var checkbox = document.getElementById("check" + petNum);

			if(checkbox != null) {
				document.getElementById("check" + petNum).checked = false;
			}
			document.getElementById("selectedPet").removeChild(petDiv);
		}

		function paging(e) {
			var checkPet = document.getElementsByName("checkPet");

			var form = document.createElement("form");
			form.action = "MatchingPopup.mc" + e;
			form.method = "post";
			
			for(var i = 0; i < checkPet.length; i++) {
				form.appendChild(checkPet[i].cloneNode());
			}
			
			document.body.appendChild(form);

			form.submit();

			document.body.removeChild(form);
		}

		$("form[name=matchMember]").on("submit", function() {
			var checkPet = document.getElementsByName("petNum");
			
			if(checkPet.length > 0) {
				if(document.getElementsByName("mContent")[0].value == "") {
					alert("내용을 입력하세요.");
					return false;
				} else {
					return true;
				}
			} else {
				alert("펫을 선택하세요.");
				return false;
			}
		});
	</script>
</body>
</html>