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
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/customerService/qnaWrite.css">
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
						<li id="click"><a href="${ contextPath }/myQsend.cs">1:1 문의</a></li>
						<c:if test="${ loginUser.adminQ eq 'N' }">
						<li><a href="${ contextPath }/myQuestion.cs">내 질문 내역</a></li>
						</c:if>
						<c:if test="${ loginUser.adminQ eq 'Y' }">
						<li><a href="${ contextPath }/questionList.cs">회원 질문 내역</a></li>
						</c:if>
					</ul>
				</span>
					<span class="menu">
						<img src="<%= request.getContextPath() %>/resources/images/homeicon.png" style="width:15px; height:15px;"> 홈 > 고객센터 > 1:1 문의<br>
						<span id="boardTitle">1:1 문의 남기기</span>
						<form action="qWrite.cs" method="post" onsubmit="return checkIt();">
						<input type="hidden" value="${ loginUser.id }" name="originMemberId">
							<table>
								<tr>
									<td>제목 : </td>
									<td><input type="text" class="input" name="title" id="ntitle"></th>
								</tr>
								<tr>
									<td>내용 : </td>
									<td>
										<textarea class="input" name="content" id="questionContent"></textarea>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="text-align:right;"><input type="submit" class="button" value="작성하기" style="background-color:#f2ebeb;"><input type="button" class="button" onclick="location.href='javascript:history.go(-1)'"  value="취소하기"></td>
								</tr>
							</table>
						</form>
					</span>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
	
	<script>
		function checkIt(){
			if($("#questionTitle").val() == ''){
				alert('제목을 입력해주세요.');
				$("#questionTitle").focus();
				return false;
			}
			
			if($('#questionContent').val() == ''){
				alert('내용을 입력해주세요.');
				$('#questionContent').focus();
				return false;
			}
			
			return true;
		}
	</script>
</body>
</html>