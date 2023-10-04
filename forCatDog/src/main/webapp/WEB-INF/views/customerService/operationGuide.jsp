<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<%@ include file="/resources/globalVariable.jsp" %>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/common/base.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/common/content.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/customerService/operationGuide.css">
</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<%@ include file="/WEB-INF/views/common/nav.jsp" %>
		
		<div id='content'>
			<div id="container">
				<span id="menu" class="sp">
					<b style="margin-left:29px;">고객센터</b>
					<ul>
					<br>
						<li><a href="${ contextPath }/notice.cs">공지사항</a></li>
						<li id="click"><a href="${ contextPath }/operation.cs">이용안내</a></li>
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
				<span id="board" class="sp">
					<img src="<%= request.getContextPath() %>/resources/images/homeicon.png" style="width:15px; height:15px;"> 홈 > 고객센터 > 이용안내<br>
					<div class="accordion">
						<c:forEach var="o" items="${ list }">
							<input type="checkbox" id="answer${ o.opNum }">
							<label for="answer${ o.opNum }">${ o.title }<em></em></label>
							<div><p>${ o.content }
							<c:if test="${ loginUser.adminQ eq 'Y' }">
								<input type="button" class="button" value="수정하기" onclick="location.href='oupdateForm.cs?opNum=' + ${ o.opNum }">
								<input type="button" class="button" value="삭제하기" onclick="location.href='operationDelete.cs?opNum=' + ${ o.opNum }">
							</c:if>
							</p>
							</div>
						</c:forEach>
						</div>
						<c:if test="${ loginUser.adminQ eq 'Y' }">
							<div id="btn"><input type="button" id="button" value="작성하기" onclick="location.href='operationWriteForm.cs'"></div>
						</c:if>
					</div>
				</span>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
</body>
</html>