<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/common/base.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/common/content.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/common/paging.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/customerService/noticeList.css">
<%@ include file="/resources/globalVariable.jsp"%>
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
						<li><a href="${ contextPath }/notice.cs">공지사항</a></li>
						<li><a href="${ contextPath }/operation.cs">이용안내</a></li>
						<li><a href="${ contextPath }/myQsend.cs">1:1 문의</a></li>
						<c:if test="${ loginUser.adminQ eq 'N' }">
						<li id="click"><a href="${ contextPath }/myQuestion.cs">내 질문 내역</a></li>
						</c:if>
						<c:if test="${ loginUser.adminQ eq 'Y' }">
						<li><a href="${ contextPath }/questionList.cs">회원 질문 내역</a></li>
						</c:if>
					</ul>
				</span>
				<span id="board" class="dspan">
					<img src="<%= request.getContextPath() %>/resources/images/homeicon.png" style="width:15px; height:15px;"> 홈 > 고객센터 > 내 질문내역<br>
					<span id="boardTitle">내 질문내역</span>
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
							<c:if test="${ list.size() <= 0 }">
								<tr>
									<td colspan="5">
										조회 결과가 없습니다.
									</td>
								<tr>
							</c:if>
							<c:if test="${ loginUser.adminQ eq 'N' }">
								<c:forEach items="${ requestScope.list }" var="q">
									<c:url var="questionDetail" value="questionDetail.cs">
										<c:param name="qNum" value="${ q.qnaNum }"/>
									</c:url>
									<c:url var="sendMessage" value="boardSendMessageForm.ms">
										<c:param name="id" value="${ q.memberId }"/>
									</c:url>
									<tr class="sub">
										<td>${ q.qnaNum }</td>
										<td style="text-align:left;">
											<div style="margin-left: ${ q.qnaIndent * 15 }px; display:inline-block;">
												<c:if test="${ q.qnaIndent != 0 }">└</c:if>
												<div style="display:inline-block;" onclick="location.href='${ questionDetail }'">
													${ q.title }
												</div>
											</div>
										</td>
										<td>
											 <a onclick="window.open('${ sendMessage }', 'messageListForm', 'width=580, height=690');">
												${ q.nickName }
											</a>
										</td>
										<td><fmt:formatDate value='${ q.date }' pattern="yyyy-MM-dd"/></td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
					
					<br><br>
					<c:if test="${ requestScope.list.size() > 0 }">
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
				</span>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
</body>
</html>