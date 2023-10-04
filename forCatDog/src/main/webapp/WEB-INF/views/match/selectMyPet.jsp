<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<%@ include file="/resources/globalVariable.jsp" %>
<link rel = "icon" href = "${ contextPath }/resources/images/favicon.ico">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/match/selectMyPet.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/paging.css">
</head>
<body>
	<div class='paddingdiv'>
		<div class='block'>
			<h1>마이펫 목록</h1>
		</div>
		
		<hr>
		
		<div class='block'>
			<c:if test="${ requestScope.mpList.size() <= 0 }">
				등록된 펫이 없습니다.
			</c:if>
			<c:forEach items="${ requestScope.mpList }" var="mp">
				<div class='pet' onclick="petClick(${ mp.petNum }, '${ mp.changeFileName }', '${ mp.petName }');">
					<div class="petImgArea">
						<img class="petImg" src='${ contextPath }/resources/mpetUploadFiles/${ mp.changeFileName }'>
					</div>
					<span>${ mp.petName }</span>
					<p>${ mp.petType2 } / ${ mp.gender == "M" ? "남" : "여" }  /  ${ mp.birthYear }</p>
				</div>
			</c:forEach>
		</div>
		
		<div class="pagingArea" align="center">
			<c:if test="${ requestScope.mpList.size() > 0 }">
					<div class="pagingArea" align="center">
						<c:if test="${ 1 >= pi.startPage }">
							<button class="border first"><i class="fas fa-chevron-left"></i></button>&nbsp;
						</c:if>
						<c:if test="${ 1 < pi.startPage }">
							<c:url var="before" value="${ loc }">
								<c:param name="page" value="${ pi.startPage - 1 }"/>
								<c:param name="num" value="${ num }"/>
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
									<c:param name="num" value="${ num }"/>
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
								<c:param name="num" value="${ num }"/>
							</c:url> 
							<button class="border pointer" onclick="location.href='${ after }'"><i class="fas fa-chevron-right"></i></button>&nbsp;
						</c:if>
						
					</div>
			</c:if>
			
		</div>
	</div>
	
	<script>
		function petClick(petNum, fileName, petName) {
			<c:if test="${ num == null }">
				opener.document.getElementsByName('petList[0].petNum')[0].value = petNum;
				opener.document.getElementsByName('petImg')[0].src = '${ contextPath }/resources/mpetUploadFiles/' + fileName;
				opener.document.getElementById('petInfo').innerHTML = petName;
				self.close();
			</c:if>
			<c:if test="${ num != null }">
				var check = true;
				$(".petNum", opener.document).each(function(i, element) {
					if(element.value == petNum) {
						alert("이미 선택하였습니다.");
						check = false;
					}
				});

				if(check) {
					var pet = $('#pet${ num }', opener.document);
					var clone = pet.clone(true);
	
					clone.attr("id", "pet${ num + 1 }");
					clone.find("input[name='petList[${ num }].petNum']").attr("name", "petList[${ num + 1 }].petNum");
					clone.find("#petImg${ num }").attr("id", "petImg${ num + 1 }").attr("onclick", "selectMyPet();");
					clone.find("#petInfo${ num }").attr("id", "petInfo${ num + 1 }");
					clone.find(".delBtn").attr("onclick", "delPet(${ num + 1 });")
	
					clone.appendTo($('#petBlock', opener.document));
					
					var pNum = pet.find("input[name='petList[${ num }].petNum']");
					var petImg = pet.find("#petImg${ num }");
					var petInfo = pet.find("#petInfo${ num }");
					
					pNum.val(petNum);
					petImg.attr("src", '${ contextPath }/resources/mpetUploadFiles/' + fileName).attr("onclick", "");
					petInfo.text(petName);

					opener.parent.numUp();
				}

				self.close();

			</c:if>
		}
	</script>
</body>
</html>