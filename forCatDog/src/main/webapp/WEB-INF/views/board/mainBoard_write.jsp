<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<%@ include file="/resources/globalVariable.jsp" %>

<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/base.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/content.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/board/mainBoard_write.css">

<script src="${ contextPath }/resources/js/boardFile.js"></script>

</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<%@ include file="/WEB-INF/views/common/nav.jsp" %>
		
		<div id='content'>
		
			<br>
			<h1>게시글 작성</h1>
			
			<br><br>
			
			<form action="boardWrite.bo" method="post" enctype="Multipart/form-data" onsubmit="return boardInsert();">
				<input type="hidden" name="parentNum" value="${ b.parentNum }">
				<input type="hidden" name="boardLevel" value="${ b.boardLevel }">
			
				<input type="text" id="title" name="boardTitle" placeholder="제목을 입력해 주세요.">
				
				<br><br>
				<div id="filetext">첨부파일</div>
				<div id="fileArea">
					<div id="setFile0">
						<input type="file" class="file" name="setFile" onchange="changeFile(this);">
						<input name="fileDel" class="delFile" type="button" value="삭제" onclick="delFile('setFile0');">
					</div>
				</div>
				
				<br>
				
				<textarea id="bContent" name="boardContent" placeholder="내용을 입력하세요."></textarea>
			
				<br><br>
				
				<div class="btnArea">			
					<input type="button" id="list" value ="목록으로" onclick="location.href='boardList.bo'">
					<button id="write" type="submit">
						글 등록
					</button>
				</div>
				
				<br><br>
			</form>
		</div>
		
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
</body>
</html>