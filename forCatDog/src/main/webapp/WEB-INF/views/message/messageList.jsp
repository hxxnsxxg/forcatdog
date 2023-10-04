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

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/message/messageList.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/common/paging.css">
<link rel = "icon" href = "${ contextPath }/resources/images/favicon.ico">
</head>
<body>
	<h2><img src="${ contextPath }/resources/images/messagelogo.png"></h2>
	
	<div class="btnArea">
		<button id="sendBtn" onclick="location.href='<%= request.getContextPath() %>/sendMessageForm.ms'">쪽지 보내기</button>
		<button onclick="delMsg();" id="delBtn">삭제</button>
	</div>
	<br><br>
	<form action="deleteMessage.ms" method="post" id="delMsg">
		<table id="messageTable">
			<tr>
				<th>선택</th>
				<th>보낸이</th>
				<th>내용</th>
				<th>보낸날짜</th>
				<th>읽음여부</th>
			</tr>
			<c:forEach items="${ requestScope.list }" var="msg">
				<tr>
					<td><input type="checkbox" name="mNumCBox" value="${ msg.mNum }"></td>
					<td>${ msg.sendNickName }</td>
					<td onclick="messageDetail(${ msg.mNum });"><div>${ msg.mContent }</div></td>
					<td><fmt:formatDate value='${ msg.sendDate }' pattern="yyyy-MM-dd HH:mm"/></td>
					<td>${ msg.status }</td>
				</tr>
			</c:forEach>
		</table>
	</form>
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
	
	<script>
		function messageDetail(mNum) {
			window.open('', 'messageDetail', 'width=580, height=690');
			var form = document.createElement("form");
            form.method = 'post';
            form.target = 'messageDetail';
            form.action = 'messageDetail.ms';

            var input = document.createElement("input");
            input.type = "hidden";
            input.name = "mNum";
            input.value = mNum;

            form.appendChild(input);

            var body =  document.body;
            body.appendChild(form);
            
            form.submit();

            body.removeChild(form);
		}

		function delMsg() {
			var check = false;
			var mNumCBox = document.getElementsByName("mNumCBox");
			for(var i in mNumCBox) {
				if(mNumCBox[i].checked) {
					check = true;
				}
			}
			if(check) {
				if(confirm("정말 삭제하시겠습니까?")) {
					document.getElementById("delMsg").submit();
				}
			} else {
				alert("삭제할 쪽지를 선택해주세요");
			}
		}
		
	</script>
</body>
</html>