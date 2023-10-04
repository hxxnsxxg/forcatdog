<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<%@ include file="/resources/globalVariable.jsp" %>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/common/base.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/common/content.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/common/paging.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/customerService/noticeList.css">
</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<%@ include file="/WEB-INF/views/common/nav.jsp" %>
		
		<div id='content'>
			<div id="container">
				<span id="menu" class="dspan">
					<b style="margin-left:29px;">고객센터</b>
					<ul id="leftu">
					<br>
						<li id="click"><a href="${ contextPath }/notice.cs">공지사항</a></li>
						<li><a href="${ contextPath }/operation.cs">이용안내</a></li>
						<c:if test="${ !empty loginUser }">
						<li><a href="${ contextPath }/myQsend.cs">1:1 문의</a></li>
						<c:if test="${ loginUser.adminQ eq 'N' }">
						<li><a href="${ contextPath }/myQuestion.cs">내 질문 내역</a></li>
						</c:if>
						<c:if test="${ loginUser.adminQ eq 'Y' }">
						<li><a href="${ contextPath }/questionList.cs">회원 질문 내역</a></li>
						</c:if>
						
						</c:if>
					</ul>
				</span>
				<span id="board" class="dspan">
					<img src="<%= request.getContextPath() %>/resources/images/homeicon.png" style="width:15px; height:15px;"> 홈 > 고객센터 > 공지사항<br>
					<span id="boardTitle">공지사항</span>
					<table id="boardTable">
						<thead>
							<tr>
								<th id="number">번호</th>
								<th id="title">제목</th>
								<th id="writer">작성자</th>
								<th id="date">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="n" items="${ list }">
								<tr class="sub">
									<td>${ n.noticeNum }</td>
									<td id="ntitle">${ n.noticeTitle }</td>
									<td>${ n.nickName }</td>
									<td><fmt:formatDate value='${ n.createDate }' pattern="yyyy-MM-dd"/></td>
								</tr>
							</c:forEach>
						</tbody>
							<tr id="tafooter">
								<c:if test="${ loginUser.adminQ eq 'Y' }">
								<td colspan="5"><input type="button" value="작성하기" class="button" onclick="location.href='nWriteFrom.cs'"></td>
								</c:if>
							</tr>
					</table>
					
					<c:if test="${ requestScope.list.size() > 0 }">
					<div class="pagingArea" id='paging' align="center">
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
				</span>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
	
	<script>
		$(function(){
			$('.sub').on('click', function(){
				var nNum = $(this).children('td').eq(0).text();
				location.href='ndetail.cs?nNum=' + nNum + '&page=' + ${ pi.currentPage };
			});
		});
	</script>
</body>
</html>