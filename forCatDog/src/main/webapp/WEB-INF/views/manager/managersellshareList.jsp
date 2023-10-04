<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/manager/managerMain.css?after"> 
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/board/managerboardList.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/Mpaging.css">
<title>forCatDog</title>
<%@ include file="/resources/globalVariable.jsp" %>
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
	
			<main id="content">
				<h2 style="margin-left:20px;">팔아요/나눔해요</h2>
					<div>
						<table class="board_list">
							<thead>
								<tr>
									<th width="50px">번호</th>
									<th width="25px">카테고리</th>
									<th width="50px">제목</th>
									<th width="50px">작성자</th>
									<th width="30px"></th>
								</tr>
							</thead>
							<tbody>	
							<c:if test="${ requestScope.ssList.size() <= 0 }">
								<tr>
									<td colspan="5">
										조회 결과가 없습니다.
									</td>
								</tr>
							</c:if>
							
							<c:if test="${ requestScope.ssList.size() > 0 }">
								<c:forEach items="${ requestScope.ssList }" var="ss">
								<tr>
									<td>${ss.productNum }</td>
									<td style="text-align:center;">${ ss.category }</td>
									<td>${ ss.pdTitle }</td>
									<td>${ ss.memberId }</td>
									<td>												
										<c:url var="sellshareDelete" value="sellDelete.mn">
											<c:param name="ssNum" value="${ ss.productNum }"/>
										</c:url>
										<a class="fas fa-times" href="${ sellshareDelete }"></a>	
	
									</td>
								</tr>
								</c:forEach>
							</c:if>
							</tbody>
						</table>
						<div id="paging">
							<c:if test="${ requestScope.ssList.size() > 0 }">
								<div class="pagingArea" align="center">
									<c:if test="${ 1 >= pi.startPage }">
										<button class="border first"><i class="fas fa-chevron-left"></i></button>&nbsp;
									</c:if>
									<c:if test="${ 1 < pi.startPage }">
										<c:url var="before" value="${ loc }">
											<c:param name="page" value="${ pi.startPage - 1 }"/>
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
										</c:url> 
										<button class="border pointer" onclick="location.href='${ after }'"><i class="fas fa-chevron-right"></i></button>&nbsp;
									</c:if>
									
								</div>
							</c:if>
						</div>
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
	</script>
</body>
</html>