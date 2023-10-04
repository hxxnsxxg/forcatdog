<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<%@ include file="/resources/globalVariable.jsp" %>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/manager/reportDetailManagement.css?after">
</head>
<body>
	<div class="container">
		<h2><img src="${ contextPath }/resources/images/reportlogo.png"></h2>
		
		<table align="center">
			<tr>
				<td class="title">신고일</td>
				<td>${ report.date }</td>
			</tr>
			<tr>
				<td class="title">신고자</td>
				<td id="memberId">${ report.memberId }</td>
			</tr>
			<tr>
				<td class="title">신고 종류</td>
				<td>${ report.reportCate }</td>
			</tr>
			<tr>
				<td class="title">신고 아이디</td>
				<td id="suspect">${ report.suspect }</td>
			</tr>
			<tr>
				<td class="title">이름</td>
				<td>${ report.name }</td>
			</tr>
			<tr>
				<td class="title">연락처</td>
				<td>${ report.phone }</td>
			</tr>
			<tr>
				<td class="title">이메일</td>
				<td>${ report.email }</td>
			</tr>
			<tr>
				<td class="title">가입일</td>
				<td>${ report.enrollDate }</td>
			</tr>
			<tr>
				<td class="title">신고 내용</td>
				<td>${ report.content }</td>
			</tr>
			<tr>
				<td class="title">신고 경로</td>
				<td><a onclick="window.open('${ report.path }')" id="reportclick">[ 해당 게시물 바로가기 ]</a></td>
			</tr>
			<tr>
				<td class="title">회원 상태</td>
				<td>
					<c:if test="${ report.mStatus eq 'Y' }">
						활동중회원
					</c:if>
					<c:if test="${ report.mStatus eq 'P'}">
						활동중지회원
					</c:if>
					<c:if test="${ report.mStatus eq 'N'}">
						탈퇴한회원
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" class="btn" value="닫기" onclick="window.close();">
				</td>
			</tr>
		</table>
</div>
</body>
</html>