<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<link rel = "icon" href = "${ contextPath }/resources/images/favicon.ico">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/member/insertPet.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="${ contextPath }/resources/js/jquery-3.5.1.min.js"></script>

</head>
<body>
	<br>

	<label id='title'>펫 등록</label>
				
	<div id="petImgArea">
		<img id="petImg" onclick="clickImg();">
	</div>
	<form action="insertPet.me" method="post" enctype="Multipart/form-data" id="insertPet">
		<input type="hidden" name="memberId" value="${ sessionScope.loginUser.id }">
		<div style="display: none;">
			<input type="file" name="petImg" accept="image/*" onchange="loadImg(this)">
		</div>
		<table>
			<tr>
				<th>이름</th>
				<td>
					<div>
						<input type="text" class="text" name="petName">
					</div>
				</td>
			</tr>
			<tr>
				<th>종류</th>
				<td>
					<div>
						<select name="petType1" class="text">
							<option value="">1차 종류</option>
							<option value="DOG">개</option>
							<option value="CAT">고양이</option>
						</select>
						<input type="hidden" name="petType2">
						<select name="animalSelect" class="text">
							<option value="">2차 종류</option>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<div>
						<input type="radio" name="gender" id="male" value="M" checked><label for="male">남</label>
						<input type="radio" name="gender" id="female" value="F"><label for="female">여</label>
					</div>
				</td>
			</tr>
			<tr>
				<th>몸무게</th>
				<td>
					<div>
						<input type="number" class="textShort" name="weight" step="0.1" value="0.0">
					</div>
				</td>
			</tr>
			<tr>
				<th>출생년도</th>
				<td>
					<div>
						<select name="birthYear" class="text">
							<c:set var="y" value="<%= new GregorianCalendar().get(Calendar.YEAR) %>"/>
							<c:forEach begin="0" end="50" var="i">
								<option value="${ y - i }">${ y - i }</option>
							</c:forEach>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<th>성격</th>
				<td>
					<div>
						<select name="personality" class="text">
							<option value="">성격</option>
							<option>사나움</option>
							<option>순종적</option>
							<option>외향적</option>
							<option>내향적</option>
							<option>사교적</option>
							<option>예민함</option>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<th>기타 정보</th>
				<th></th>
			</tr>
			<tr>
				<td colspan="2">
					<div>
						<textarea rows="5" cols="38" name="inform" style="margin: 0px; width: 431px; height: 166px; resize: none;"></textarea>
					</div>
				</td>
			</tr>
		</table>
		<button type="button" class="btn" id='submitbtn'>
			<i class="fa fa-check fa-2x"></i> 등록
		</button>
	</form>
	
	<script>
		function clickImg() {
			document.getElementsByName('petImg')[0].click();
		}
	
		function loadImg(value) {
			if (value.files && value.files[0]) {
				var reader = new FileReader();
	
				reader.onload = function(e) {
					document.getElementById('petImg').setAttribute('src', e.target.result);
				}
	
				reader.readAsDataURL(value.files[0]);
			}
		}

		var petType1 = document.getElementsByName("petType1")[0].onchange = function() {
			$.ajax({
				url: "selectPetType.me",
				type: "post",
				contentType: 'application/json',
				data: JSON.stringify({petType: this.value}),
				success: function(data) {
					animal2_1.innerHTML = '<option value="">2차 종류</option>';
					for(var i in data) {
						var option = document.createElement("option");
						option.innerHTML = data[i];

						animal2_1.appendChild(option);
					}
					animal2_1.innerHTML += '<option value="0">기타</option>';
					animal2_1.onchange();
				}
			});
		};

		var animal2_1 = document.getElementsByName("animalSelect")[0];
	
		animal2_1.onchange = function() {
			var animal2 = document.getElementsByName("petType2")[0];
			if(this.value == "0") {
				animal2.type = "text";
				animal2.value = "";
			} else {
				animal2.type = "hidden";
				animal2.value = this.value;
			}
		};
	
		document.getElementById("submitbtn").onclick = function() {
			var petImg = document.getElementsByName("petImg")[0].value;
			var petName = document.getElementsByName("petName")[0].value;
			var animal1 = document.getElementsByName("petType1")[0].value;
			var animal2 = document.getElementsByName("petType2")[0];
			var weight = document.getElementsByName("weight")[0].value;
			var personality = document.getElementsByName("personality")[0].value;
			
			if(petImg == "") {
				alert("펫 이미지를 등록해주세요");
			} else if(petName == "") {
				alert("펫 이름을 입력하세요");
			} else if(animal1 == "" || animal2.value == "") {
				alert("펫 종류를 선택하세요");
			} else if(weight == "" || weight < 0.1) {
				alert("펫의 무게를 입력해주세요");
			} else if(personality == "") {
				alert("펫의 성격을 입력해주세요");
			} else {
				document.getElementById("insertPet").submit();
			}
			
		};
	</script>
</body>
</html>