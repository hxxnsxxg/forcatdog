<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<%@ include file="/resources/globalVariable.jsp" %>

<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/base.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/content.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/paging.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/member/myPetList.css">
</head>
<body>
   <c:set var="info" value="${ requestScope.memberInfo }"/>

   <div class="wrap">
      <%@ include file="/WEB-INF/views/common/header.jsp" %>
      <%@ include file="/WEB-INF/views/common/nav.jsp" %>
      
      <div id='content'>
         <div class='paddingdiv'>
            <div class='block'>
               <h1>마이펫 목록</h1>
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
            
            <c:if test="${ requestScope.mpList.size() > 0 }">
               <div class="pagingArea" align="center">
                  <c:if test="${ 1 >= pi.startPage }">
                     <button class="border first"><i class="fas fa-chevron-left"></i></button>&nbsp;
                  </c:if>
                  <c:if test="${ 1 < pi.startPage }">
                     <c:url var="before" value="${ loc }">
                        <c:param name="page" value="${ pi.startPage - 1 }"/>
                        <c:param name="cate" value="${ cate }"/>
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
                           <c:param name="cate" value="${ cate }"/>
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
                        <c:param name="cate" value="${ cate }"/>
                     </c:url> 
                     <button class="border pointer" onclick="location.href='${ after }'"><i class="fas fa-chevron-right"></i></button>&nbsp;
                  </c:if>
                  
               </div>
            </c:if>
         </div>
      </div>
      <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   </div>
   
   <script>
      $(function() {
         document.getElementById("insertPetBtn").onclick = function() {
            window.open('insertPetForm.me', 'insertPetForm', 'width=540, height=690');
         };
         
      });
      
      function petInfo(petNum) {
         window.open("", 'petInfoForm', 'width=590, height=690');
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
   </script>
</body>
</html>