<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<%@ include file="/resources/globalVariable.jsp" %>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/common/base.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/common/content.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/customerService/noticeDetail.css">
</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<%@ include file="/WEB-INF/views/common/nav.jsp" %>
		
		<div id='content'>
			<div id="container">
				<span id="menu" class="menu">
					<b style="margin-left:29px;">고객센터</b>
					<ul>
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
				<span id="board" class="menu">
					<img src="<%= request.getContextPath() %>/resources/images/homeicon.png" style="width:15px; height:15px;"> 홈 > 고객센터 > 공지사항<br>
					<table id="boardTable">
						<tr>
							<td id="title">${ notice.noticeTitle }</th>
						</tr>
						<tr>
							<td id="head1">작성자 : ${ notice.nickName } | 작성날짜 : <fmt:formatDate value='${ notice.createDate }' pattern="yyyy-MM-dd HH:mm"/> | 조회수 ${ notice.noticeCount }</td>
						</tr>
						<tr>
							<td id="body1">
								<div id="boardContent">
									<%
										pageContext.setAttribute("newLineChar", "\r\n");
									%>
									${ fn:replace(notice.noticeContent, newLineChar, "<br>") }
								</div>
							</td>
						</tr>
						<c:url var="nlist" value="notice.cs">
							<c:param name="page" value="${ page }"/>
						</c:url>
						<c:url var="nupdate" value="nupdateForm.cs">
							<c:param name="nNum" value="${ notice.noticeNum }"/>
							<c:param name="page" value="${ page }"/>
						</c:url>
						<c:url var="ndelete" value="ndelete.cs">
							<c:param name="nNum" value="${ notice.noticeNum }"/>
						</c:url>
						<tr>
							<td id="footer1">
							<c:if test="${ loginUser.id eq notice.memberId }">
							<input type="button" value="수정" class="button" onclick="location.href='${ nupdate }'">
							<input type="button" value="삭제" class="button" id="delete">
							</c:if>
							<input type="button" value="목록" class="button" onclick="location.href='${ nlist }'"></td>
						</tr>
					</table>
				</span>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
	
	<script>
	$('#delete').on('click', function(){
		msg = "정말 삭제하시겠습니까?";
		if(confirm(msg) != 0) {
			return location.href='${ ndelete }';
		} else {
			return false;
		}
	});
	</script>
</body>
</html>