<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<%@ include file="/resources/globalVariable.jsp" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/common/base.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/common/content.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/catdog/catdog.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/board/mainBoard.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/sellshare/selllist.css">
</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<%@ include file="/WEB-INF/views/common/nav.jsp" %>
		
		<div id='content'>

			<br>	
			<div id="catdogS">
				<h1>DOG</h1>
				<c:if test="${ requestScope.ccList.size() <= 0 }">
					<div id="emptyS">
						<i id="exclamationA" class="fa fa-exclamation-triangle"></i> 결과가 없습니다.
						<br>
						<button id="gogo" onclick='location.href="dog.cc"'>
							<i id="returnA" class="fa fa-arrow-left"> DOG 전체보기</i> 
						</button>
					</div>
				</c:if>
				
				<c:if test="${ ccList != null }">
					<c:forEach items="${ requestScope.ccList }" var="cd">
						<c:url var="catdogDetail" value="catdogDetail.cc">
							<c:param name="cdNum" value="${ cd.cd_num }" />
						</c:url>
						<div class="catdogitemS" align="center" onclick="location.href='${ catdogDetail }'">
							<img src="${ contextPath }/resources/catdogUploadFiles/${ cd.fileList[0].changeFileName }">
							<p>${ cd.cd_name }</p>
						</div>
					</c:forEach>
				</c:if>
			</div>
			
			<br><hr><br>
			
			<br>
			<div id="catdogS">
				<h1>CAT</h1>
				<c:if test="${ requestScope.catList.size() <= 0 }">
					<div id="emptyS">
						<i id="exclamationA" class="fa fa-exclamation-triangle"></i> 결과가 없습니다.
						<br>
						<button id="gogo" onclick='location.href="cat.cc"'>
							<i id="returnA" class="fa fa-arrow-left"> CAT 전체보기</i> 
						</button>
					</div>
				</c:if>
				
				<c:if test="${ ccList != null }">
					<c:forEach items="${ requestScope.catList }" var="cd">
						<c:url var="catdogDetail" value="catdogDetail.cc">
							<c:param name="cdNum" value="${ cd.cd_num }" />
						</c:url>
						<div class="catdogitemS" align="center" onclick="location.href='${ catdogDetail }'">
							<img src="${ contextPath }/resources/catdogUploadFiles/${ cd.fileList[0].changeFileName }">
							<p>${ cd.cd_name }</p>
						</div>
					</c:forEach>
				</c:if>
			</div>
			
			<br><hr><br>
			
			<br>
			<h1>자유게시판</h1>
			<br>
			
			<table class="board_list">
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
						<c:forEach items="${ requestScope.bList }" var="b">
						<c:url var="boardDetail" value="boardDetail.bo">
							<c:param name="bNum" value="${ b.boardNum }"/>
						</c:url>
						<tr>
							<td>${ b.boardNum }</td>
							<td>
								<div style="margin-left: ${ b.boardLevel * 15 }px; display:inline-block;">
									<c:if test="${ b.boardLevel != 0 }">└</c:if>
									<div style="display:inline-block;" onclick="location.href='${ boardDetail }'">
										${ b.boardTitle }
									</div>
								</div>
							</td>
							<td>${ b.nickName }</td>
							<td>${ b.createDate }</td>
							<td>${ b.views }</td>
						</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			
			<br>
			
			<form action="${ contextPath }/boardSearchList.bo" method="get" class="mBoard">
				<select id="op" name="searchOption">
					<option value="BOARD_TITLE">제목</option>
					<option value="BOARD_CONTENT">내용</option>
					<option value="NICKNAME">작성자</option>
				</select>
				<input type="text" id="searchWordA" name="word" size="20" placeholder="검색어를 입력해주세요">
				<button id="searchA" type="submit">검색</button>
			</form>
			<button id="gogo" onclick="location.href='boardList.bo'" style="margin-left: 25%;">
				<i id="returnB" class="fa fa-arrow-left"> 게시판 전체보기</i> 
			</button>
			
			<br><br>
			
			<br><hr><br>
	
			<br>
			<div id="catdogS">
				<h1>팔아요</h1>
				<c:if test="${ requestScope.sellList.size() <=  0}">
					<div id="emptyS">
						<i id="exclamationA" class="fa fa-exclamation-triangle"></i> 결과가 없습니다.
						<br>
						<button id="gogo" onclick='location.href="sell.ss"'>
							<i id="returnA" style="margin-left: 20px;" class="fa fa-arrow-left"> 팔아요 전체보기</i> 
						</button>
					</div>
				</c:if>
				<c:forEach items="${ requestScope.sellList }" var="sell">
					<c:url var="sellDetail" value="sellDetail.ss">
						<c:param name="ssNum" value="${ sell.productNum }"/>
					</c:url>
					<div class="sellshareitemS" onclick="location.href='${ sellDetail }'">
						<img src="${ contextPath }/resources/sellshareUploadFiles/${ sell.fileList[0].changeFileName }">
						<p id="p">${ sell.addr1 }<br>
						${ sell.pdTitle }<br>
						<fmt:formatNumber type="number" value="${ sell.price }" pattern="#,###,###"/>원</p>
					</div>
					<span id="notice">
						<i class="fa fa-exclamation"></i>
						최대 3개의 게시물만 검색 됩니다. 더 많은 게시물은 해당 메뉴에서 검색해주세요.
					</span>
				</c:forEach>	
			</div>
			
			<br><br><hr><br>
			
			<br>
			
			<div id="catdogS">	
				<h1>나눔해요</h1>
				<c:if test="${ requestScope.shareList.size() <=  0}">
					<div id="emptyS">
						<i id="exclamationA" class="fa fa-exclamation-triangle"></i> 결과가 없습니다.
						<br>
						<button id="gogo" onclick='location.href="share.ss"'>
							<i id="returnA" style="margin-left: 20px;" class="fa fa-arrow-left"> 나눔해요 전체보기</i> 
						</button>
					</div>
				</c:if>
				<c:forEach items="${ requestScope.shareList }" var="share">
					<c:url var="sellDetail" value="sellDetail.ss">
						<c:param name="ssNum" value="${ share.productNum }"/>
					</c:url>
					<div class="sellshareitemS" onclick="location.href='${ sellDetail }'">
						<img src="${ contextPath }/resources/sellshareUploadFiles/${ share.fileList[0].changeFileName }">
						<p id="p">${ share.addr1 }<br>
						${ share.pdTitle }</p> 
					</div>
					<span id="notice">
						<i class="fa fa-exclamation"></i>
						최대 3개의 게시물만 검색 됩니다. 더 많은 게시물은 해당 메뉴에서 검색해주세요.
					</span>
				</c:forEach>	
			</div>
		</div>	
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
</body>
</html>