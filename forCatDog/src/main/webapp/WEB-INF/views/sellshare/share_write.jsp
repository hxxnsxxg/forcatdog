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
			<h1>물건 등록하기</h1>
			
			<br><br><br>
			
			<form action="shareWrite.ss" method="post" enctype="Multipart/form-data" onsubmit="return sellshareInsert();">
			<input type="hidden" name="mainImg" value='false'>
			<input type="hidden" name="price" value="0">
			<label id="name">지역</label>
			<select name="addr1" id="location1" onchange="sidoChange();">
				<option value="">시/도</option>
				<c:forEach items="${ location1 }" var="l1">
					<option>${ l1 }</option>
				</c:forEach>
			</select>
			<select name="addr2" id="location2" onchange="sigunguChange();">
				<option value="">시/군/구</option>
			</select>
			<select name="addr3" id="location3">
				<option value="">동</option>
			</select>
			
			<br><br><hr id="hh"><br>
			
			<label id="name">구분</label>
			<select name="category" id="cate" disabled >
				<option>나눠요</option>
			</select>
			<input type="hidden" name="category" value="나눠요">
			
			<br><br><hr id="hh"><br>
			
			<input type="text" id="name" placeholder="제목" name="pdTitle">
            
            <br><br><hr id="hh"><br>
            
            <input type="text" id="name" placeholder="물품명" name="productName">
            
            <br><br><hr id="hh"><br>
            
            <textarea style="resize: none;" rows="10" cols="80" id="name" placeholder="내용을 작성해주세요. (가품 및 판매금지품목은 게시가 제한됩니다.)" name="pdContent"></textarea>
            
            <br><br><hr id="hh"><br>
            
            <div id="imageArea">
				<label id="name"><i class="fa fa-camera fa-2x"></i></label>				
				<br><br>
				<img style="margin-left: 5%;" id="contentImg1">
				<img id="contentImg2">
				<img id="contentImg3">
				<img id="contentImg4"> 
			</div>
			
			<div id="fileArea">
               <input type="file" id="thumbnailImg1" class="file" name="setFile" onchange="LoadImg(this,1)" accept="image/*">
               <input type="file" id="thumbnailImg2" class="file" name="setFile" onchange="LoadImg(this,2)" accept="image/*">
               <input type="file" id="thumbnailImg3" class="file" name="setFile" onchange="LoadImg(this,3)" accept="image/*">
               <input type="file" id="thumbnailImg4" class="file" name="setFile" onchange="LoadImg(this,4)" accept="image/*">
            </div>
            
			<br>
			<div id="btnarea">         
               <button type="submit" id="registerbtn">등록</button>
               <input type="button" id="cancelbtn" value="취소" onclick="location.href='share.ss'">
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
               
              
               function LoadImg(value, num){
                  if(value.files && value.files[0]){
                     var reader = new FileReader();
                     
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
		</script>
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
</body>
</html>