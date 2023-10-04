<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<%@ include file="/resources/globalVariable.jsp" %>

<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/base.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/content.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/paging.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/board/mainBoard.css">
</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<%@ include file="/WEB-INF/views/common/nav.jsp" %>
		
		<div id='content'>
		
			<br>
			<h1>자유게시판</h1>
			<br>
			<c:if test="${ loginUser != null }">
				<button id="goWrite" onclick="location.href = '${ contextPath }/boardWriteForm.bo'">글 쓰기</button>
			</c:if>
			<br><br>
			
			<table class="board_list">
				<colgroup>
			        <col class="col1"><col class="col2"><col class="col3"><col class="col4"><col class="col5">
			    </colgroup>
				<thead>
					<tr>
						<th width="50px">번호</th>
						<th width="200px">제목</th>
						<th width="50px">작성자</th>
						<th width="100px">작성일</th>
						<th width="50px">조회수</th>
					</tr>
				</thead>
				<tbody>	
					<c:if test="${ requestScope.bList.size() <= 0 }">
						<tr>
							<td colspan="5">
								조회 결과가 없습니다.
							</td>
						</tr>
					</c:if>
					
					<c:if test="${ requestScope.bList.size() > 0 }">
						<c:forEach items="${ requestScope.bList }" var="b" varStatus="vs">
						<c:url var="boardDetail" value="boardDetail.bo">
							<c:param name="bNum" value="${ b.boardNum }"/>
							<c:param name="views" value="${ b.views }"/>
						</c:url>
						<tr>
							<td>${ b.boardNum }</td>
							<td>
								<div style="margin-top: 3.5px; margin-left: ${ b.boardLevel * 15 }px; display: inline-block; text-align: left; text-overflow: ellipsis; overflow: hidden; white-space: nowrap; max-width: ${ 535 - (b.boardLevel * 15) }px;">
									<c:if test="${ b.boardLevel != 0 }">└</c:if>
									<div style="display:inline;" class="boardTitle" onclick="location.href='${ boardDetail }'">
										${ b.boardTitle }
									</div>
								</div>
								<div class="boardOptionBlock">
									<c:if test="${ b.commentNum > 0 }">
										<div style="display:inline;" class="boardOption">[${ b.commentNum }]</div>
									</c:if>
									<c:if test="${ b.fileNum > 0 }">
										<i class="fas fa-paperclip boardOption"></i>
									</c:if>
								</div>
							</td>
							<td>
								<div class="userBoard check"
									<c:if test="${ loginUser == null }">
										style="cursor: default;"
									</c:if>
								>
									<span
										<c:if test="${ loginUser != null }">
											onclick="clickUser(this);" 
										</c:if>
									class="check">${ b.nickName }</span>
									<div class="userBoardLayer check">
										<a href="${ contextPath }/infoBoard.bo?infoId=${ b.memberId }" class="check">
											<span style="color: black;" class="check">게시글보기</span>
										</a>
									</div>
								</div>
							</td>
							<td>${ fn:split(b.createDate, " ")[0] }</td>
							<td>${ b.views }</td>
						</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>

			<br><br>
			
			<form action="${ contextPath }/boardSearchList.bo" method="get" class="mBoard">
				<select id="op" name="searchOption">
					<option value="BOARD_TITLE">제목</option>
					<option value="BOARD_CONTENT">내용</option>
					<option value="NICKNAME">작성자</option>
				</select>
				<input type="text" id="searchWord" name="word" size="20" placeholder="검색어를 입력해주세요" value="${ word != null ? word : '' }">
				<button id="search" type="submit">검색</button>
			</form>
			
			<c:if test="${ requestScope.bList.size() > 0 }">
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
		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
	
	<script>
		var option = document.getElementById("op").children;
		for(var i in option) {
			if(option[i].value == '${ option }') {
				option[i].selected = true;
				break;
			}
		}

		
		function clickUser(span) {
			$('.userBoardLayer').css("display", "none");
			$(span).parent().children('.userBoardLayer').css("display", "block");
		}

		$('html').click(function(e) { 
			if(!($(e.target).hasClass("check"))) {
				$('.userBoardLayer').each(function(i, element) {
					if($(this).css("display") == "block") {
						$('.userBoardLayer').css("display", "none");
					}
				});
			}
		});
	</script>
</body>
</html>