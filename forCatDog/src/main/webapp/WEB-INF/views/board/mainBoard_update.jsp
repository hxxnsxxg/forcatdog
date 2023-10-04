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
			<h1>게시글 수정</h1>
			
			<br><br>
			
			<form action="boardUpdate.bo" name="boardForm" method="post" enctype="Multipart/form-data" onsubmit="return boardUpdate();">
				<input type="hidden" name="boardNum" value="${ requestScope.b.boardNum }">
				<input type="text" id="title" name="boardTitle" placeholder="제목을 입력해 주세요." value="${ requestScope.b.boardTitle }">
				
				<br><br>
				<div id="filetext">첨부파일</div>
				<div id="fileArea">
					<div id="setFile0">
						<input type="file" class="file" name="setFile" onchange="changeFile(this);">
						<input name="fileDel" class="delFile" type="button" value="삭제" onclick="delFile('setFile0');">
					</div>
					<c:forEach items="${ requestScope.b.fileList }" var="f" varStatus="vs">
						<div id="setFile-${ vs.index }">
							<input type="hidden" value="${ f.changeFileName }">
							<input class="exfile" name="exFile" type="hidden" value="${ f.fileId }">
							<a href="${ contextPath }/resources/boardUploadFiles/${ f.changeFileName }" download="${ f.originalFileName }" style="display: inline-block;">
								<input type="text" readonly value="${ f.originalFileName }">
							</a>
							<input type="button" class="delFile" style="margin-left: 75px;" value="삭제" onclick="del_File('setFile-${ vs.index }');">
						</div>
					</c:forEach>
				</div>
				
				<br>
				
				<textarea id="bContent" name="boardContent" placeholder="내용을 입력하세요.">${ requestScope.b.boardContent }</textarea>
			
				<br><br>
				
				<div class="btnArea">			
					<input type="button" id="list" value ="목록으로" onclick="location.href='boardList.bo'">
					<button id="write" type="submit">글 수정</button>
				</div>
				
				<br><br>
			</form>
		</div>
		
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
	
	<script>
		var arr = new Array();
		var size = 0;
		function del_File(id) {
			var setFile = document.getElementById(id);
			var reFile = setFile.children[0].value;

			var input = document.createElement("input");
			input.name = "delFile";
			input.type = "hidden";
			input.value = reFile;

			arr[size++] = input;
			
			$(setFile).remove();
			
		};

		function boardUpdate() {
			var title = document.getElementsByName("boardTitle")[0].value.replace(/ /g,"");
			var content = document.getElementsByName("boardContent")[0].value.replace(/ /g,"");
					
			if(title == "") {
				alert("제목을 입력하세요");
				return false;
			} else if(content == "") {
				alert("내용을 입력하세요");
				return false;
			}

			for(var i in arr) {
				document.boardForm.appendChild(arr[i]);
			}
			
			nameSet();
			
			return true;
		}
	</script>
</body>
</html>