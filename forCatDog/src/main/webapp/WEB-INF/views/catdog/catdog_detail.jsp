<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<%@ include file="/resources/globalVariable.jsp" %>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/common/base.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/catdog/catdogdetail.css">
</head>
<body>
   <div class="wrap">
      <%@ include file="/WEB-INF/views/common/header.jsp" %>
      <%@ include file="/WEB-INF/views/common/nav.jsp" %>
      
      <div id='content'>
         <div id="detail">
            <div id="name">
               ${ cd.cd_name }
            </div> 
            
            <br><hr id="line"><br> 
            
            <div id="content4">
               <c:forEach items="${ cd.fileList }" var="cfn">
                  <img id="picture" src="${ contextPath }/resources/catdogUploadFiles/${ cfn.changeFileName }">
               </c:forEach>
            </div>
            
            <br><br>
            
            <div id="content1">
               <span id="title">수명</span> &nbsp;${ cd.cd_lifespan }<br><br>
               <span id="title">출생</span> &nbsp;${ cd.cd_birth }<br><br>
               <span id="title">체중</span> &nbsp;${ cd.cd_weight }<br><br>   
               <span id="title">성격</span> &nbsp;${ cd.cd_personality }<br><br>
               <span id="title">특징</span><br><br>
               <%
					pageContext.setAttribute("newLineChar", "\r\n");
				%>
				${ fn:replace(cd.cd_explain, newLineChar, "<br>") }<br><br>
            </div>   
		</div>
   
		<c:if test="${ loginUser != null && loginUser.adminQ eq 'Y'}">
        	<form action="catdogUpdateForm.cc" id="cdForm" method="post">
            	<input type="hidden" id="cd_num" name="cdNum" value="${ cd.cd_num }">
                <button id="Mbtn" type="submit">수정</button>
                <button id="Dbtn" type="button" onclick="deleteCatdog();">삭제</button>  
            </form>
       	</c:if>
            
        <c:if test="${ cd.cd_cate eq 'DOG'}">
           	<button id="toList" onclick="location.href='dog.cc'">
            	<i class="fa fa-reply"> 뒤로가기</i> 
			</button>
        </c:if>
        <c:if test="${ cd.cd_cate eq 'CAT'}">
        	<button id="toList" onclick="location.href='cat.cc'">
            	<i class="fa fa-reply"> 뒤로가기</i> 
			</button>
      	</c:if>     
      </div>
      <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   </div>
   <script>
	   function deleteCatdog() { 
			if(confirm("정말 삭제하시겠습니까?")) {
				var form = document.getElementById("cdForm");
				var cdNum = document.getElementById("cd_num").value;
				form.setAttribute("cdNum", cdNum);
				form.setAttribute("action", "catdogDelete.cc");
				form.submit();
			}
		}
	   
	   $(function(){
			$('#toList').mouseenter(function(){
		    	$(this).css({'font-size':'27px', 'color':'black'});
		  	});
		  	$('#toList').mouseleave(function(){
		    	$(this).css({'font-size':'25px', 'color':'gray'});
		  	});
		});
   </script>
</body>
</html>