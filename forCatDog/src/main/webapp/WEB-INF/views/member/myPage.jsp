<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<%@ include file="/resources/globalVariable.jsp" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/base.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/content.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/member/myPage.css">
</head>
<body>
   <c:set var="info" value="${ requestScope.memberInfo }"/>

   <div class="wrap">
      <%@ include file="/WEB-INF/views/common/header.jsp" %>
      <%@ include file="/WEB-INF/views/common/nav.jsp" %>
      
      <div id='content'>
         <div class='paddingdiv'>
            <div class='block'>
               <h1>마이페이지</h1>
               <button id='updateMyInfoBtn' onclick="location.href='${ contextPath }/mUpdateForm.me'">정보 수정</button>
            </div>
            
            <hr id="line">
            
            <div class='block'>
               <form id="fileForm" method="post" enctype="multipart/form-data">
                  <div style="display: none;">
                     <input type="file" name="profileImg" accept="image/*" onchange="loadImg(this)">
                  </div>
               </form>
               <c:if test="${ !empty info.changeFileName }">
                  <div id="profileArea">
                     <img id="profileImg" src="resources/mprofileUploadFiles/${ info.changeFileName }">
                  </div>
               </c:if>
               <c:if test="${ empty info.changeFileName }">
                  <div id="profileArea">
                     <img id="profileImg" src="${ contextPath }/resources/images/user.png">
                  </div>
               </c:if>
               <div id='profileInfo'>
                  <h1>${ info.nickName }</h1>
               </div>
            </div>
            
            <div class='block'>
               <h2>마이펫</h2>
               <button id='viewPetBtn'>더보기</button>
               <button id='insertPetBtn'><i class="fa fa-plus"></i></button>         
            </div>
            
            <hr id="line">
            
            <div class='block'>
               <c:if test="${ requestScope.mpList.size() <= 0 }">
                  등록된 펫이 없습니다.
               </c:if>
               <c:forEach items="${ requestScope.mpList }" var="mp">
                  <div class='pet' onclick="petInfo('${ mp.petNum }');">
                     <div class="petImgArea">
                        <img class="petImg" src='${ contextPath }/resources/mpetUploadFiles/${ mp.changeFileName }'>
                     </div>
                     <span>${ mp.petName }</span>
                     <p>${ mp.petType2 } / ${ mp.gender == "M" ? "남" : "여" }  /  ${ mp.birthYear }</p>
                  </div>
               </c:forEach>
            </div>
            
            <div class='block'>
               <h2>나의 활동</h2> 
            </div>
            
            <hr id="line">
            <div id="myInfoMatch">
               <div id='bottom-block' class="b-block">
                  <span id="icon" class="icon_margin"><i class="fa fa-paw fa-4x"></i></span>
                  <button id='viewReqMBtn'>매칭</button>
               </div>
            </div>
            
            <div id="myInfoBoard">
               <div id='bottom-block' class="b-block">
                  <span id="icon"><i class="fas fa-pencil-alt fa-4x"></i></span>
                  <button id='viewReqBtn'>자유게시판</button>
               </div>
            </div>
            
            <div id="myInfoSS">
               <div id='bottom-block' class="b-block">
                  <span id="icon"><i class="fas fa-store fa-4x"></i></span>
                  <button id='viewReqBtn'>판매/나눔</button>
               </div>
            </div>
            
            <br><br>
            
            <div id="viewMatch">
               <div id='bottom-block' class="b-block">
                  <span id="icon"><i class="fa fa-handshake fa-4x"></i></span>
                  <button id='viewMatchBtn' >매칭 관리</button>
               </div>
         </div>
            
            <div id="viewReq">
               <div id='bottom-block' class="b-block">
                  <span id="icon"><i class="fa fa-list-ul fa-4x"></i></span>
                  <button id='viewReqBtn'>의뢰 관리</button>
               </div>
            </div>
            
            <c:if test="${ info.petQ == 'N'}">
               <div onclick="location.href = '${ contextPath }/Applytest.me';">
                  <div id='bottom-block' class="b-block">
                     <span id="icon"><i class="fa fa-meh fa-4x"></i></span>
                     <button id='viewPetsitterBtn'>펫시터 자격</button>
                  </div>
               </div>
            </c:if>
            
            <c:if test="${ info.petQ == 'Y'}">
               <div onclick="alert('이미 시험에 합격하셨습니다. 펫시터에 지원해 보세요!');">
                  <div id='bottom-block' class="b-block">
                     <span id="icon"><i class="fa fa-grin-wink fa-4x"></i></span>
                     <button id='viewPetsitterBtn2'>펫시터 자격</button>
                  </div>
               </div>
            </c:if>         
         </div>
      </div>
      <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   </div>   
   <script>
      $(function() {
         document.getElementById("insertPetBtn").onclick = function() {
            window.open('insertPetForm.me', 'insertPetForm', 'width=540, height=840');
         };

         document.getElementById("viewPetBtn").onclick = function() {
            location.href = "${ contextPath }/petList.me";
         };

         document.getElementById("profileArea").onclick = function() {
            document.getElementsByName('profileImg')[0].click();
         };
         
         document.getElementById("viewMatch").onclick = function() {
            location.href = "${ contextPath }/matchList.me";
         };

         document.getElementById("viewReq").onclick = function() {
            location.href = "${ contextPath }/reqMatchList.me";
         };

         document.getElementById("myInfoMatch").onclick = function() {
         location.href = "${ contextPath }/infoMatch.mc";
         };
         
         document.getElementById("myInfoBoard").onclick = function() {
          location.href = "${ contextPath }/infoBoard.bo";
         };

         document.getElementById("myInfoSS").onclick = function() {
          location.href = "${ contextPath }/infoSS.ss";
         };
           
         
      });

      function loadImg(value) {
         if (value.files && value.files[0]) {
            var reader = new FileReader();
   
            reader.onload = function(e) {
               var formData = new FormData(document.getElementById("fileForm"));
               $.ajax({ 
                  type: "post", 
                  enctype: 'multipart/form-data',
                  url: '${ contextPath }/mProfileImg.me', 
                  data: formData,
                  processData: false,
                  contentType: false,
                  cache: false, 
                  success: function (result) { 
                     if(result) {
                        document.getElementById('profileImg').setAttribute('src', e.target.result);
                     } else {
                        alert("프로필 사진 업로드 실패");
                     }
                  }, 
                  error: function (e) { 
                     alert("프로필 사진 업로드 중 에러 발생");
                  } 
               });
            }
            
            reader.readAsDataURL(value.files[0]);
         }
      }
      
      function petInfo(petNum) {
         window.open("", 'petInfoForm', 'width=590, height=840');
         var form = document.createElement("form");
         form.method = 'post';
            form.target = 'petInfoForm';
            form.action = 'petInfo.me';
            var input = document.createElement("input");
            input.type = "hidden";
            input.name = "petNum";
         input.value = petNum;
         
         form.appendChild(input);
         document.body.appendChild(form);
         
         form.submit();
                  
         document.body.removeChild(form);
      }
      
      $(function(){
         $('.b-block').mouseenter(function(){
             $(this).css('background','#F2EBEB');
           });
           $('.b-block').mouseleave(function(){
             $(this).css('background','none');
           });
      });
      
   </script>
</body>
</html>