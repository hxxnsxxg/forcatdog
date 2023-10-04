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
						<li><a href="${ contextPath }/notice.cs">공지사항</a></li>
						<li><a href="${ contextPath }/operation.cs">이용안내</a></li>
						<li><a href="${ contextPath }/myQsend.cs">1:1 문의</a></li>
						<c:if test="${ loginUser.adminQ eq 'N' }">
						<li id="click"><a href="${ contextPath }/myQuestion.cs">내 질문 내역</a></li>
						</c:if>
						<c:if test="${ loginUser.adminQ eq 'Y' }">
						<li id="click"><a href="${ contextPath }/questionList.cs">회원 질문 내역</a></li>
						</c:if>
					</ul>
				</span>
				<span id="board" class="menu">
					<img src="<%= request.getContextPath() %>/resources/images/homeicon.png" style="width:15px; height:15px;"> 홈 > 고객센터 > 내 질문 내역<br>
					<table id="boardTable">
						<tr>
							<td id="title">${ qna.title }</td>
						</tr>
						<tr>
							<td id="head1">작성자 : <a onclick="window.open('${ sendMessage }', 'messageListForm', 'width=580, height=690');">${ qna.nickName }</a> | 작성날짜 : <fmt:formatDate value='${ qna.date }' pattern="yyyy-MM-dd HH:mm"/> </td>
						</tr>
						<tr>
							<td id="body1">
								<div id="boardContent">
									<%
										pageContext.setAttribute("newLineChar", "\r\n");
									%>
									${ fn:replace(qna.content, newLineChar, "<br>") }
								</div>
							</td>
						</tr>
						<c:url var="sendMessage" value="boardSendMessageForm.ms">
							<c:param name="id" value="${ q.memberId }"/>
						</c:url>
						<c:url var="qlist" value="myQuestion.cs">
						</c:url>
						<c:url var="alist" value="myQuestionAnswer2.cs">
						</c:url>
						<c:url var="qupdate" value="myQuestionUpdateForm.cs">
							<c:param name="qNum" value="${ qna.qnaNum }"/>
						</c:url>
						<c:if test="${ loginUser.adminQ eq 'N' }">
							<c:url var="qdelete" value="myQuestionDelete.cs">
								<c:param name="qNum" value="${ qna.qnaNum }"/>
							</c:url>
						</c:if>
						<c:if test="${ loginUser.adminQ eq 'Y' }">
							<c:url var="qdelete" value="AQuestionDelete.cs">
								<c:param name="qNum" value="${ qna.qnaNum }"/>
							</c:url>
						</c:if>
						<c:url var="answer" value="myQuestionAnswerForm.cs">
							<c:param name="qnaNum" value="${ qna.qnaNum }"/>
							<c:param name="qnaOrder" value="${ qna.qnaOrder }"/>
							<c:param name="qnaIndent" value="${ qna.qnaIndent }"/>
							<c:param name="memberId" value="${ loginUser.id }"/>
						</c:url>
						<tr>
							<td id="footer1">
							<c:if test="${ loginUser.id eq qna.memberId }">
							<input type="button" value="수정" class="button" onclick="location.href='${ qupdate }'">
							<input type="button" value="삭제" class="button" id="delete">
							</c:if>
							<c:if test="${ loginUser.adminQ eq 'Y' }">
							<input type="button" value="답변" class="button" onclick="location.href='${ answer }'">
							<input type="button" value="목록" class="button" onclick="location.href='${ qlist }'">
							</c:if>
							<c:if test="${ loginUser.adminQ eq 'N' }">
							<input type="button" value="목록" class="button" onclick="location.href='${ qlist }'">
							</c:if>
							</td>
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
			return location.href='${ qdelete }';
		} else {
			return false;
		}
	});
	</script>
</body>
</html>