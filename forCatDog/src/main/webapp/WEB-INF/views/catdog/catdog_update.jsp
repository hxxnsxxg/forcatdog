<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<%@ include file="/resources/globalVariable.jsp" %>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/catdog/catdog_write.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/manager/managerMain.css?after"> 
<script src="${ contextPath }/resources/js/catdogFile.js"></script>
<script src="https://kit.fontawesome.com/58029e7b69.js" crossorigin="anonymous"></script>
</head>
<body>
	<div class="wrapper">
		<nav id="sidebar" class="sidebar">
			<div class="sidebar-content">
				<a class="sidebar-brand" href="managerMain.mn">
	        		<span class="align-middle">관리자 메뉴</span>     
	        	</a>
	        	
	        	<ul class="sidebar-nav">
	        		<li class="sidebar-header">Menu</li>
	        		
	        		<li class="menu">
	        			<a class="sidebar-link1"> 
		        			<i class="fas fa-bullhorn" style="color:white; margin-right:8px;"></i>
		        			<span class="align-middle">공지 및 이용안내</span>
	        			</a>
	        			<ul class="sidebar-dropdown" style="display:none;">
	        				<li class="sidebar-item">
	        					<a class="sidebar-link" href="managerMain.mn">- 글 목록</a>
	        				</li>
	        				<li class="sidebar-item">
	        					<a class="sidebar-link" href="nWriteFrom.cs">- 공지사항 등록</a>
	        				</li>
	        				<li class="sidebar-item">
	        					<a class="sidebar-link" href="operationWriteForm.cs">- 이용안내 등록</a>
	        				</li>        		
	        			</ul>
	        		</li>
	        		<li class="menu">
	        			<a class="sidebar-link1"> 
		        			<i class="fas fa-paw" style="color:white; margin-right:10px;"></i>
		        			<span class="align-middle">캣독 정보</span>
	        			</a>
	        			<ul class="sidebar-dropdown" style="display:none;">
	        				<li class="sidebar-item">
	        					<a class="sidebar-link" href="catdogWriteForm.cc">- 캣독 등록</a>
	        				</li>
	        				<li class="sidebar-item">
	        					<a class="sidebar-link" href="manager_catdog.cc">- 캣독 목록</a>
	        				</li>
	        			</ul>
	        		</li>	
	        		<li class="sidebar-item">
	        			<a class="sidebar-link" href="managerPage.mn"> 
		        			<i class="fas fa-user-edit" style="color:white; margin-right:7px;"></i>
		        			<span class="align-middle">회원 관리</span>
	        			</a>
	        		</li>	
	        		<li class="sidebar-item">
	        			<a class="sidebar-link" href="qnaManagerPage.mn"> 
		        			<i class="fas fa-phone-square-alt" style="color:white; margin-right:12px;"></i>
		        			<span class="align-middle">문의 관리</span>
	        			</a>
	        		</li>	
	        		<li class="sidebar-item">
	        			<a class="sidebar-link" href="reportList.mn"> 
		        			<i class="fas fa-ankh" style="color:white;  margin-right:16px;"></i>
		        			<span class="align-middle">신고 관리</span>
	        			</a>
	        		</li>	
	        		
	        		<li class="menu">
	        			<a class="sidebar-link1"> 
		        			<i class="fas fa-pencil-alt" style="color:white; margin-right:10px;"></i>
		        			<span class="align-middle">게시글 관리</span>
	        			</a>
	        			<ul class="sidebar-dropdown" style="display:none;">
	        				<li class="sidebar-item">
	        					<a class="sidebar-link" href="manager_boardList.mn">- 자유게시판</a>
	        				</li>
	        				<li class="sidebar-item">
	        					<a class="sidebar-link" href="manager_sellshareList.mn">- 팔아요/나눔해요</a>
	        				</li>
	        				<li class="sidebar-item">
	        					<a class="sidebar-link" href="manager_matchList.mn">- 매칭</a>
	        				</li>
	        			</ul>
	        		</li>
	        	</ul>
	        </div> 
		</nav>
		
		<div class="main">
			<nav class="navbar navbar-expand navbar-light navbar-bg">
				<span><img id="img" src="${contextPath}/resources/images/adminlogo.png"></span>
				<span id="Nick">Admin님</span>
				<a class="fas fa-envelope-open fa-lg"onclick="window.open('${ contextPath }/messageListForm.ms', 'messageListForm', 'width=580, height=690');"> Message</a>
				<a class="fas fa-sign-out-alt fa-lg" href='${ contextPath }/logout.me'> Logout</a>		
			</nav>
			<main class="content">
				 <form action="catdogUpdate.cc" method="post" enctype="Multipart/form-data" onsubmit="return catdogInsert();">
            		<input type="hidden" name="cd_num" value="${ requestScope.cd.cd_num }">

            		<div id="detail">
               			<div id="content1">
                	 		   캣독 : <select id="catdogType" name="cd_cate">
                     			  		<option value="DOG">강아지</option>
                     					<option value="CAT">고양이</option>
                     			  </select><br> <br> 
					                  품종 &nbsp;&nbsp;&nbsp;<input id="text" type="text" name="cd_name" value="${ requestScope.cd.cd_name }"> <br> 
					                  수명 &nbsp;&nbsp;&nbsp;<input id="text" type="text" name="cd_lifespan" value="${ requestScope.cd.cd_lifespan }"> <br> 
					                  출생지&nbsp;<input id="text" type="text" name="cd_birth" value="${ requestScope.cd.cd_birth }"> <br> 
					                  무게 &nbsp;&nbsp;&nbsp;<input id="text" type="text" name="cd_weight" value="${ requestScope.cd.cd_weight }"> <br>
				               </div>
		                <br>
		                <div id="content2">
                  			<h2>성격</h2>
                  			<br>
                 			<textArea id="personality" name="cd_personality" placeholder="성격을 입력해주세요.">${ requestScope.cd.cd_personality }</textArea>
               			</div>
               			<br>
		                <div id="content3">
		                    <h2>설명</h2>
		                    <br>
		                    <textArea id="explain" name="cd_explain" placeholder="설명을 입력해주세요.">${ requestScope.cd.cd_explain }</textArea>
		                </div>
               
               		    <br><br>
               			<div id="content4">
                  			<h2>사진</h2><br>
		                     <%-- <c:forEach items="${ cd.fileList }" var="cfn" varStatus="vs">
		                        <img id="contentImg${ vs.index + 1 }" src="${ contextPath }/resources/catdogUploadFiles/${ cfn.changeFileName }">
		                     </c:forEach> --%>
                     
		                     <c:forEach items="${ requestScope.cd.fileList }" var="cfn" varStatus="vs">
		                        <img onchange="changeFile(this, ${ cfn.fileId });" id="contentImg${ vs.index + 1 }" src="${ contextPath }/resources/catdogUploadFiles/${ cfn.changeFileName }">
		                     </c:forEach>
		                     
		                     <c:forEach begin="${ requestScope.cd.fileList.size() }" end="1" var="i">
		                        <img onchange="changeFile(this);" id="contentImg${ i + 1 }">
		                     </c:forEach>

                    	</div>
               
		                <div id="fileArea">
		                  	 <c:forEach items="${ requestScope.cd.fileList }" var="cfn" varStatus="vs">
		                        <input type="file" id="thumbnailImg${ vs.index + 1 }" class="file" name="setFile" onchange="LoadImg(this,${ vs.index + 1 }, ${ cfn.fileId }, '${ cfn.changeFileName }')" accept="image/*">
		                        <input type="hidden" name="exFile" value="${ cfn.fileId }">   
		                     </c:forEach>
		                     <c:forEach begin="${ requestScope.cd.fileList.size() }" end="1" var="i">
		                        <input type="file" id="thumbnailImg${ i + 1 }" class="file" name="setFile" onchange="LoadImg(this,${ i + 1 })" accept="image/*">
		                     </c:forEach> 
		                </div>   

			            <br>
			            <br>


		                <button type="button" id="list" onclick="location.href='manager_catdog.cc'">목록으로</button>
		                <button id="write" type="submit">수정하기</button>
           			</div>
         		 </form>
		         <script>
		         
			      $(function (){
			         $("#fileArea").hide();
			                  
			         $("#contentImg1").click(function(){
			               $("#thumbnailImg1").click();
			            });
			            $("#contentImg2").click(function(){
			               $("#thumbnailImg2").click();
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
			                       $("#contentImg1").attr("src", e.target.result); break;
			                    case 2: 
			                          $("#contentImg2").attr("src", e.target.result); break;           
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
		           
			          
			          $(document).ready(function(){
			  			$(".menu>a").click(function(){
			  				var submenu = $(this).next("ul");
			  				
			  				if( submenu.is(":visible") ){
			  					submenu.slideUp();
			  				} else{
			  					submenu.slideDown();
			  				}
			  			 });
			  		   });
		      </script>
			</main>
		</div>		
	</div>	

</body>
</html>