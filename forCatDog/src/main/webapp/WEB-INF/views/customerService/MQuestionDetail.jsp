<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<%@ include file="/resources/globalVariable.jsp" %>
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/manager/managerMain.css?after"> 
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/customerService/noticeWrite.css">
<script src="https://kit.fontawesome.com/58029e7b69.js" crossorigin="anonymous"></script>
</head>
<body>
	<%
		pageContext.setAttribute("newLineChar", "\r\n");
	%>
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
			<main>
				<div id="container">
					<span class="menu1">
						<table>
							<tr>
								<td><h1>${ qna.title }</h1></td>					
							</tr>	
							<tr>
								
								<td>작성자 : <a onclick="window.open('${ sendMessage }', 'messageListForm', 'width=580, height=690');">${ qna.nickName }</a>
								  | 작성날짜 :  <fmt:formatDate value='${ qna.date }' pattern="yyyy-MM-dd HH:mm"/> 						
							</tr>
							<tr>
								<td><textarea id="detailtext" readonly>${ qna.content }</textarea></td>
							</tr>
							<c:url var="answer" value="myQuestionAnswerForm.cs">
								<c:param name="qnaNum" value="${ qna.qnaNum }"/>
								<c:param name="qnaOrder" value="${ qna.qnaOrder }"/>
								<c:param name="qnaIndent" value="${ qna.qnaIndent }"/>
								<c:param name="memberId" value="${ loginUser.id }"/>
							</c:url>
							<c:url var="Mlist" value="qnaManagerPage.mn">
							</c:url>
							<tr>
								<td>
									<c:if test="${ ans == null || ans.size() <= 0 }">
										<input type="button" value="답변" id="Mbtn" onclick="location.href='${ answer }'">
									</c:if>
									<input type="button" value="목록" id="Dbtn" id="delete" onclick="location.href='${ Mlist }'">
								</td>
							</tr>
						</table>
					</span>
					<c:forEach items="${ ans }" var="a">
						<span class="menu1">
							<table>
								<tr>
									<td><h1>${ a.title }</h1></td>					
								</tr>	
								<tr>
									
									<td>작성자 : ${ a.nickName }
									  | 작성날짜 :  <fmt:formatDate value='${ a.date }' pattern="yyyy-MM-dd HH:mm"/>					
								</tr>
								<tr>
									
									<td><div id="detailtext" readonly>${ fn:replace(a.content, newLineChar, "<br>") }</div></td>
								</tr>
							</table>
						</span>
					</c:forEach>
					
					
				</div>
			</main>
		</div>
	</div>
	<script>
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
		
		function checkIt(){
			var title = $('#noticeTitle').val();
			var content = $('#noticeContent').val();
			
			if(title == ""){
				alert("제목을 입력해주세요.");
				$('#noticeTitle').focus();
				return false;
			}
			
			if(content == ""){
				alert("내용을 입력해주세요.");
				$('#noticeContent').focus();
				return false;
			}
		}
	</script>

</body>
</html>