<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포캣독목록</title>
<%@ include file="/resources/globalVariable.jsp" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/common/base.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/paging.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/sellshare/selllist.css">
</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<%@ include file="/WEB-INF/views/common/nav.jsp" %>
		
		<div id='content'>
			<h1>나눠요</h1>
			<br><br>
			<div id="option">
				<form action="shareSearch.ss" method="post" enctype="Multipart/form-data" id="form">
					<select name="addr1" id="opt">
						<option value="">시/도</option>
						<c:forEach items="${ location1 }" var="l1">
							<option>${ l1 }</option>
						</c:forEach>
					</select>
					<input type="text" id="searchWord" name="word" placeholder="물품명을 검색하세요." value="${ word != null ? word : '' }"> 
					<button type="submit" id="searchBtn">검색</button>
				</form>
				
				<c:if test="${ loginUser != null }">
					<button id="sell" onclick="location.href='${ contextPath}/shareWriteForm.ss'">나눔하기</button>
				</c:if>
				
				<br><br>
				
				<div id="selllist">
					<br>
					<c:if test="${ requestScope.ssList2.size() <=  0}">
						<div id="empty">
							<i id="exclamation" class="fa fa-exclamation-triangle fa-3x"></i>
							<br>
							결과가 없습니다.
							<br>
							<i id="return" class="fa fa-reply"> 뒤로가기</i> 
						</div>
					</c:if>
					<c:forEach items="${ requestScope.ssList2 }" var="ss">
						<c:url var="sellDetail" value="shareDetail.ss">
							<c:param name="ssNum" value="${ ss.productNum }"/>
						</c:url>
						<div class="sellshareitem" onclick="location.href='${ sellDetail }'">					
							<img src="${ contextPath }/resources/sellshareUploadFiles/${ ss.fileList[0].changeFileName }">
							<p id="p">${ ss.addr1 } ${ ss.addr2 } ${ ss.addr3 } <br>
								${ ss.pdTitle }</p> 							
						</div>
					</c:forEach>	
				</div>
			</div>

			<c:if test="${ requestScope.ssList2.size() > 0 }">
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
		$(function(){
			$('#return').mouseenter(function(){
		    	$(this).css({'font-size':'45px', 'color':'black'});
		  	});
		  	$('#return').mouseleave(function(){
		    	$(this).css({'font-size':'35px', 'color':'gray'});
		  	});
		  	$('#return').click(function(){
		    	location.href= 'share.ss';
		  	});
		});

		var option = document.getElementById('opt').children;
		for(var i in option) {
			if(option[i].value == '${ addr1 }') {
				option[i].selected = true;
				break;
			}
		}
	</script>
</body>
</html>