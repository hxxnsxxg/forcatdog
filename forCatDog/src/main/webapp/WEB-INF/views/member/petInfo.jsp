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
   
   <label id='title'>펫 정보</label>
            
   <div id="petImgArea">
      <img id="petImg" src="${ contextPath }/resources/mpetUploadFiles/${ requestScope.mp.changeFileName }" onclick="clickImg();">
   </div>
   <form action="updatePet.me" method="post" enctype="Multipart/form-data" id="updatePet">
      <input type="hidden" name="petNum" value="${ requestScope.mp.petNum }">
      <input type="hidden" name="memberId" value="${ sessionScope.loginUser.id }">
      <div style="display: none;">
         <input type="file" name="petImg" accept="image/*" onchange="loadImg(this)">
      </div>
      <table>
         <tr>
            <th>이름</th>
            <td>
               <div>
                  <input type="text" class="text" name="petName" value="${ requestScope.mp.petName }">
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
                  <input type="hidden" class="text" name="petType2">
                  <select name="animalSelect" class="text">
                     <option value="">2차 종류</option>
                     <c:forEach items="${ petType }" var="p">
                     	<option>${ p }</option>
                     </c:forEach>
                     <option value="0">기타</option>
                  </select>
               </div>
            </td>
         </tr>
         <tr>
            <th>성별</th>
            <td>
               <div>
                  <input type="radio" name="gender" id="male" value="M" ${ requestScope.mp.gender == "M" ? "checked" : "" }><label for="male">남</label>
                  <input type="radio" name="gender" id="female" value="F" ${ requestScope.mp.gender == "F" ? "checked" : "" }><label for="female">여</label>
               </div>
            </td>
         </tr>
         <tr>
            <th>몸무게</th>
            <td>
               <div>
                  <input type="number" class="textShort" name="weight" step="0.1" value="${ requestScope.mp.weight }">
               </div>
            </td>
         </tr>
         <tr>
            <th style="width: 100px;">출생년도</th>
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
                     <option value="사나움">사나움</option>
                     <option value="순종적">순종적</option>
                     <option value="외향적">외향적</option>
                     <option value="내향적">내향적</option>
                     <option value="사교적">사교적</option>
                     <option value="예민함">예민함</option>
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
                  <textarea rows="5" cols="38" name="inform" id="etc">${ requestScope.mp.inform }</textarea>
               </div>
            </td>
         </tr>
      </table>
      <button type="button" class="btn" id='submitbtn'>
         <i class="fa fa-check fa-2x"></i> 수정
      </button>
      &nbsp;&nbsp;&nbsp;
      <button type="button" class="btn" id="deleteBtn">
         <i class="fa fa-trash fa-2x"></i> 삭제
      </button>
   </form>
   
   <script>
      $(function() {
         var petType1Option = document.getElementsByName("petType1")[0].children;
         for(var i = 0; i < petType1Option.length; i++) {
            if(petType1Option[i].value == '${ requestScope.mp.petType1 }') {
               petType1Option[i].selected = true;
               break;
            }
         }
         var petType2Option = document.getElementsByName("animalSelect")[0];
         for(var i = 0; i < petType2Option.children.length; i++) {
            if(petType2Option.children[i].value == '${ requestScope.mp.petType2 }') {
               petType2Option.children[i].selected = true;
               break;
            }
         }
         
         var personality = document.getElementsByName("personality")[0].children;
         for(var i = 0; i < personality.length; i++) {
			if(personality[i].value == '${ requestScope.mp.personality }') {
				personality[i].selected = true;
				break;
		    }
         }

         if(petType2Option.value == "") {
            petType2Option[petType2Option.length - 1].selected = true;
            var animal2 = document.getElementsByName("petType2")[0];
            animal2.type = "text";
            animal2.value = '${ requestScope.mp.petType2 }';
         }

         var birthYear = document.getElementsByName("birthYear")[0].children;
         for(var i = 0; i < birthYear.length; i++) {
            if(birthYear[i].value == '${ requestScope.mp.birthYear }') {
               birthYear[i].selected = true;
               break;
            }
         }

         var personality = document.getElementsByName("personality")[0].children;
         for(var i = 0; i < personality.length; i++) {
            if(personality[i].value == "${ requestScope.mp.personality }") {
               personality[i].selected = true;
               break;
            }
         }
      });

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

         if(animal2_1.value != "0") {
            animal2.value = animal2_1.value;
         }
         
         if(petName == "") {
            alert("펫 이름을 입력하세요");
         } else if(animal1 == "" || animal2.value == "") {
            alert("펫 종류를 선택하세요");
         } else if(weight == "" || weight < 0.1) {
            alert("펫의 무게를 입력해주세요");
         } else if(personality == "") {
            alert("펫의 성격을 입력해주세요");
         } else {
            document.getElementById("updatePet").submit();
         }
      };

      document.getElementById("deleteBtn").onclick = function() {
         if(confirm("정말로 삭제하시겠습니까?")) {
            var form = document.createElement("form");
            form.method = 'post';
               form.action = 'petDelete.me';
               var input = document.createElement("input");
               input.type = "hidden";
               input.name = "petNum";
            input.value = ${ requestScope.mp.petNum };
            
            form.appendChild(input);
            document.body.appendChild(form);
            
            form.submit();
                     
            document.body.removeChild(form);
         }
      };
   </script>
</body>
</html>