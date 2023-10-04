<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<%@ include file="/resources/globalVariable.jsp" %>
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/member/selectMyPet.css">
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
			<!-- [이전] -->
			<c:if test="${ 1 >= pi.startPage }">
				[이전] &nbsp;
			</c:if>
			<c:if test="${ pi.currentPage > 1 }">
				<c:url var="before" value="${ loc }">
					<c:param name="page" value="${ pi.startPage - 1 }"/>
				</c:url>
				<a href="${ before }">[이전]</a> &nbsp;
			</c:if>
			
			<!-- 페이지 -->
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:if test="${ p eq pi.currentPage }">
					<font color="red" size="4"><b>[${ p }]</b></font> &nbsp;
				</c:if>
				
				<c:if test="${ p ne pi.currentPage }">
					<c:url var="pagination" value="${ loc }">
						<c:param name="page" value="${ p }"/>
					</c:url>
					<a href="${ pagination }">${ p }</a> &nbsp;
				</c:if>
			</c:forEach>
			
			<!-- [다음] -->
			<c:if test="${ pi.maxPage >= pi.endPage }">
				[다음]
			</c:if>
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="after" value="${ loc }">
					<c:param name="page" value="${ pi.endPage + 1 }"/>
				</c:url> 
				<a href="${ after }">[다음]</a>
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