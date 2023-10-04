<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<%@ include file="/resources/globalVariable.jsp" %>
<link rel = "icon" href = "${ contextPath }/resources/images/favicon.ico">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/base.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/content.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/match/PetSitterUpdate.css">
</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<%@ include file="/WEB-INF/views/common/nav.jsp" %>
		
		<div id='content'>
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
			
			<br><br>
			
			<div class="match_content">
			<form action="updateMatch.mc" method="post" role="form" id="formArea" onsubmit="return updatetMatch();">
				<span class="detail_title">제목</span>
				<input type="text" class="input_title" name="matchTitle" value="${ mc.matchTitle }">
				<div class="detail_image_area" id="petBlock">		
					<c:forEach items="${ requestScope.mc.petList }" var="p" varStatus="vs">
						<div id="pet${ vs.index }" class="petBlock">
							<div class="petArea">
								<div class="pet">
									<img id="petImg${ vs.index }" onclick="selectMyPet();" src="${ contextPath }/resources/mpetUploadFiles/${ p.changeFileName }">
									<input type="hidden" name="petList[${ vs.index }].petNum" class="petNum" value="${ p.petNum }">
								</div>
								
								<div class="petName" id="petInfo${ vs.index }">${ p.petName }</div>
							</div>
							<button type="button" class="delBtn" onclick="delPet(${ vs.index });">x</button>
						</div>
					</c:forEach>
								
					<div id="pet${ requestScope.mc.petList.size() }" class="petBlock">
						<div class="petArea">
							<div class="pet">
								<img id="petImg${ requestScope.mc.petList.size() }" onclick="selectMyPet();">
								<input type="hidden" name="petList[${ requestScope.mc.petList.size() }].petNum" class="petNum">
							</div>
							
							<div id="petInfo${ requestScope.mc.petList.size() }"></div>
						</div>
						<button type="button" class="delBtn" onclick="delPet(${ requestScope.mc.petList.size() });">x</button>
					</div>
				</div>
				<br>
				<br>
				<br>
				<p class="font_deco1">기타내용</p>
				<br>
				<textarea id="matchContent" name="matchContent" class="backColor" placeholder="희망사항을 적어주세요!">${ mc.matchContent }</textarea>			 
				<br>
														 
				<br>
					
				<input type="hidden" name="matchNum" value="${ mc.matchNum }">
				<input type="hidden" name="matchCate" value="${ mc.matchCate }">
				<button class="returnListBtn" onclick="location.href='findMatchList.mc?cate=3'">
					<i class="fa fa-undo"></i> 목록으로
				</button>					
				<button type="submit" class="applyBtn">
					<i class="fa fa-check"></i> 수정
				</button>	
				</form>
			</div>
		</div>
		
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
	
	<script>
		var pNum = ${ requestScope.mc.petList.size() };

		function numUp() {
			pNum++;
		}
		
		function selectMyPet() {
			var popupX = (window.screen.width / 2) - (853 / 2);
			var popupY = (window.screen.height / 2) - (632 / 2);
			window.open("", "selectMyPet", 'status=no, height=632, width=853, left='+ popupX + ', top='+ popupY);

			var form = document.createElement("form");
	    	  var input = document.createElement('input');
	    	  input.setAttribute('type', 'hidden');
	    	  input.setAttribute('name', 'num');
	    	  input.setAttribute('value', pNum);
	    	  form.appendChild(input);
	    	  
	    	  form.action = '${ contextPath }/matchPetSelect.mc';
	    	  form.method = "post";
	    	  form.target = "selectMyPet";

	    	  document.body.appendChild(form);
	    	  
	    	  form.submit();

	    	  document.body.removeChild(form);
		}

		function delPet(e) {
			var petBlock = document.getElementById("petBlock");
			var pet = document.getElementById("pet" + e);

			if(document.getElementsByName("petList[" + e + "].petNum")[0].value != "") {
				petBlock.removeChild(pet);
			}
			
		}

		function updatetMatch() {
			var petNum = $(".petNum");

			petNum.each(function(i, element) {
				if(element.value == "") {
					element.parentElement.removeChild(element);
				}
			});
			
			petNum.each(function(i, element) {
				element.name = "petList[" + i + "].petNum";
			});

			return true;
		}
	</script>
</body>
</html>