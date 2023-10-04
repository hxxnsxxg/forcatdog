<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<%@ include file="/resources/globalVariable.jsp" %>
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/base.css?a">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/content.css?a">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/match/InsertPetsitter.css?a">
<script type="text/javascript" src="${ contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<script src="${ contextPath }/resources/js/matchFile.js"></script>
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
         
         <br>
         <br>
         <div class="match_content">
            <form action="insertMatch.mc" method="post" enctype="multipart/form-data" role="form" onsubmit="return InmatchInsert();">
               <input type="hidden" name="matchCate" value="3">
            
               <span class="detail_title">제목</span>
               <input type="text" class="input_title" name="matchTitle">
               <div class="petImg"><i class="fas fa-dog"></i><span class="font_size">펫을 등록해주세요!</span></div>
               <div class="detail_image_area" id="petBlock">
                  
                  <div id="pet0" class="petBlock">
                     <div class="petArea">
                        <div class="pet">
                           <img id="petImg0" onclick="selectMyPet();">
                           <input type="hidden" name="petList[0].petNum" class="petNum">
                        </div>
                        
                        <div id="petInfo0" class="m_left"></div>
                     </div>
                     <button type="button" class="delBtn" onclick="delPet(0);">x</button>
                  </div>
   
               </div>
            
            
               <p class="font_deco1">기타내용</p><br>
                <textarea id="matchContent" name="matchContent" class="backColor" placeholder="희망사항을 적어주세요!"></textarea>
               <br>                
                <br>
               
               <button type="button" class="returnListBtn" onClick="location.href='${ contextPath }/findMatchList.mc?cate=3'">
                  <i class="fa fa-undo"></i> 목록으로
               </button>
               <button type="submit" class="applyBtn">
                  <i class="fa fa-check"></i> 등록
               </button>
            </form>
         </div>
      </div>
      <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   </div>
   <script>
      function goBack(){
         window.history.back();
      }
   </script>
            
   <script>
      var pNum = 0;

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

      function insertMatch() {
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