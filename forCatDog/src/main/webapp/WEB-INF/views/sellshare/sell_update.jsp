<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포캣독</title>
<%@ include file="/resources/globalVariable.jsp" %>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/common/base.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/sellshare/sellinsert.css">
<script src="${ contextPath }/resources/js/sellshare.js"></script>
<script src="${ contextPath }/resources/js/memberLocation.js"></script>
</head>
<body>
   <div class="wrap">
      <%@ include file="/WEB-INF/views/common/header.jsp" %>
      <%@ include file="/WEB-INF/views/common/nav.jsp" %>
      
      <div id='content'>
         <h1>물건 수정하기</h1>
         
         <br><br><br>
         <form action="sellshareUpdate.ss" method="post" enctype="Multipart/form-data" onsubmit="return sellshareInsert();">
            <c:if test="${ requestScope.ss.category eq '나눠요' }">
               <input type="hidden" name="price" value="0">
            </c:if>
            <input type="hidden" name="mainImg" value='false'>
            <input type="hidden" name="productNum" value="${ requestScope.ss.productNum }">
            <select name="addr1" id="location1" onchange="sidoChange();" style="margin-left: 5%;">
               <option>${ requestScope.ss.addr1 }</option>
               <c:forEach items="${ location1 }" var="l1">
                  <option>${ l1 }</option>
               </c:forEach>
            </select>
            <select name="addr2" id="location2" onchange="sigunguChange();">
               <option>${ requestScope.ss.addr2 }</option>
               <c:forEach items="${ location2 }" var="l2">
                  <option>${ l2 }</option>
               </c:forEach>
            </select>
            <select name="addr3" id="location3">
               <option>${ requestScope.ss.addr3 }</option>
               <c:forEach items="${ location3 }" var="l3">
                  <option>${ l3 }</option>
               </c:forEach>
            </select>
            
            <br><br><hr id="hh"><br>
         
            <label id="name">구분</label>
            <c:if test="${ requestScope.ss.category eq '팔아요' }">
               <select name="category" id="cate" disabled>
                  <option value="팔아요">팔아요</option>
               </select>
               <input type="hidden" name="category" value="팔아요">
            </c:if>
            <c:if test="${ requestScope.ss.category eq '나눠요' }">
               <select name="category" id="cate" disabled>
                  <option value="나눠요">나눠요</option>
               </select>
               <input type="hidden" name="category" value="나눠요">
            </c:if>
                  
         
            <br><br><hr id="hh"><br>      
                  
            <input type="text" id="name" placeholder="제목" name="pdTitle" value="${ requestScope.ss.pdTitle }">
            
               <br><br><hr id="hh"><br>
               
               <input type="text" id="name" placeholder="물품명" name="productName" value="${ requestScope.ss.productName }">
            
                 <br><br><hr id="hh"><br>
                 
                 <c:if test="${ requestScope.ss.category eq '팔아요' }">
                   <input type="text" id="name" placeholder="가격(&#8361)" name="price" value="${ requestScope.ss.price }">
               
                  <br><br><hr id="hh"><br>
               </c:if>
               
                <textarea style="resize: none;" rows="10" cols="80" id="name" placeholder="내용을 작성해주세요. (가품 및 판매금지품목은 게시가 제한됩니다.)" name="pdContent">${ requestScope.ss.pdContent }</textarea>
                
                <br><br><hr id="hh"><br>
         
            <div id="imageArea">
               <label id="name"><i class="fa fa-camera fa-2x"></i></label>
               <br><br>
               <img style="margin-left: 5%;" onchange="changeFile(this,${ requestScope.ss.fileList[0].fileId });" 
                            id="contentImg1" src="${ contextPath }/resources/sellshareUploadFiles/${ requestScope.ss.fileList[0].changeFileName }"
                               onerror="this.src='${ contextPath }/resources/images/white.JPG'">
               <img onchange="changeFile(this,${ requestScope.ss.fileList[1].fileId });" 
                            id="contentImg2" src="${ contextPath }/resources/sellshareUploadFiles/${ requestScope.ss.fileList[1].changeFileName }"
                               onerror="this.src='${ contextPath }/resources/images/white.JPG'">
               <img onchange="changeFile(this,${ requestScope.ss.fileList[2].fileId });" 
                            id="contentImg3" src="${ contextPath }/resources/sellshareUploadFiles/${ requestScope.ss.fileList[2].changeFileName }"
                               onerror="this.src='${ contextPath }/resources/images/white.JPG'">
               <img onchange="changeFile(this,${ requestScope.ss.fileList[3].fileId });" 
                            id="contentImg4" src="${ contextPath }/resources/sellshareUploadFiles/${ requestScope.ss.fileList[3].changeFileName }"
                               onerror="this.src='${ contextPath }/resources/images/white.JPG'"> 
            </div>
            
                
            <div id="fileArea">
                    <c:forEach items="${ requestScope.ss.fileList }" var="cfn" varStatus="vs">
                       <input type="file" id="thumbnailImg${ vs.index + 1 }" class="file" name="setFile" onchange="LoadImg(this,${ vs.index + 1 }, ${ cfn.fileId }, '${ cfn.changeFileName }')" accept="image/*">
                       <input type="hidden" name="exFile" value="${ cfn.fileId }">   
                    </c:forEach>
                 
                    <c:forEach begin="${ requestScope.ss.fileList.size() }" end="3" var="i">
                       <input type="file" id="thumbnailImg${ i + 1 }" class="file" name="setFile" onchange="LoadImg(this,${ i + 1 })" accept="image/*">
                    </c:forEach>
               </div>
            
            <br>
            <div id="btnarea">         
                  <button type="submit" id="registerbtn">수정</button>
                  <c:if test="${ requestScope.ss.category eq '팔아요' }">
                        <input type="button" id="cancelbtn" value="취소" onclick="location.href='sell.ss'">
                  </c:if>
                  <c:if test="${ requestScope.ss.category eq '나눠요' }">
                     <input type="button" id="cancelbtn" value="취소" onclick="location.href='share.ss'">
                  </c:if>
               </div>
            </form>
      </div>
      
      <script>
       $(function(){
                  $("#fileArea").hide();
                  
                  $("#contentImg1").click(function(){
                     $("#thumbnailImg1").click();
                  });
                  $("#contentImg2").click(function(){
                     $("#thumbnailImg2").click();
                  });
                  $("#contentImg3").click(function(){
                     $("#thumbnailImg3").click();
                  });
                  $("#contentImg4").click(function(){
                     $("#thumbnailImg4").click();
                  });
               });
               
              
               function LoadImg(value, num, exNum, delName){
                  if(value.files && value.files[0]){
                     var reader = new FileReader();
                     
                changeFile(null, exNum);
                     
                     del_File(delName);
                     
                     reader.onload = function(e){                        
                        switch(num){
                        case 1: 
                           $("#contentImg1").attr("src", e.target.result);
                           document.getElementsByName('mainImg')[0].value = true;
                           break;
                        case 2:
                           $("#contentImg2").attr("src", e.target.result);
                           break;
                        case 3: 
                           $("#contentImg3").attr("src", e.target.result);
                           break;
                        case 4:
                           $("#contentImg4").attr("src", e.target.result);
                           break;
                        }
                     }
                     
                     reader.readAsDataURL(value.files[0]);
                  }
               }
               
               function del_File(name) {
                   
                   var input = document.createElement("input");
                   input.name = "delFile";
                   input.type = "hidden";
                   input.value = name;

                   document.getElementById("fileArea").appendChild(input);
                   
                };
                
                jQuery('#cate').change(function(){
                   var state = jQuery('#cate option:selected').val();
                   if(state == '팔아요'){
                      jQuery('#layer').show();
                   } else if(state == '나눠요'){
                      jQuery('#layer').hide();
                   }
                });
                
      </script>
      <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   </div>
</body>
</html>