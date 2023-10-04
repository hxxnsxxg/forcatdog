<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<%@ include file="/resources/globalVariable.jsp"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/base.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/paging.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/catdog/catdog.css">


</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<%@ include file="/WEB-INF/views/common/nav.jsp"%>

		<div id='content'>
			<div>
				<h1 style="float: left;">CAT</h1>
			</div>
			
			<form action="${ contextPath }/catSearch.cc" method="get" class="cdForm" name="search">
				<div id="searchDiv">
					<input type="text" id="searchWord" name="word" size="20" autocomplete="off" placeholder="품종을 입력해주세요" value="${ word != null ? word : '' }">
					<div id="resultDiv">
						<div id="resultBlock">
						</div>
					</div>
				</div>
				<button id="search" type="submit">검색</button>
			</form>
			
			<c:if test="${ loginUser != null && loginUser.adminQ eq 'Y'}">
					<button id="btn" onclick="location.href = '${ contextPath }/catdogWriteForm.cc'">캣독등록</button>
			</c:if>
			<br>

			<div id="catdog">
				<c:if test="${ requestScope.ccList.size() <= 0 }">
					<div id="empty">
						<i id="exclamation" class="fa fa-exclamation-triangle fa-3x"></i>
						<br>
						결과가 없습니다.
						<br>
						<i id="return" class="fa fa-reply"> 뒤로가기</i> 
					</div>
				</c:if>
				
				<c:if test="${ ccList != null }">
					<c:forEach items="${ requestScope.ccList }" var="cd">
						<c:url var="catdogDetail" value="catdogDetail.cc">
							<c:param name="cdNum" value="${ cd.cd_num }" />
						</c:url>
						<div class="catdogitem" align="center" onclick="location.href='${ catdogDetail }'">
							<div class="petImgArea">
								<img class="petImg" src="${ contextPath }/resources/catdogUploadFiles/${ cd.fileList[0].changeFileName }">
							</div>
							<p>${ cd.cd_name }</p>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<br>
			<div id="paging">
			<c:if test="${ requestScope.ccList.size() > 0 }">
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
		</div>

		

		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
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
		    	location.href= 'cat.cc';
		  	});
		});


		$("#searchWord").on("keyup click", function() {
			var keyword = $(this).val();
			
			if(keyword != "") {
				$.ajax({
					url: 'searchCatDog.cc',
					type: 'post',
					contentType: "application/json",
					data: JSON.stringify({cate : 'CAT', keyword: keyword}),
					success: function(data) {
						var $resultBlock = $("#resultBlock");
						$resultBlock.html('');

						if(data.length > 0) {
							for(var i in data) {
								var $div = $('<div>').addClass("result").html(data[i]).on("click", function(event) {
									$("#searchWord").val($(this).html());
									document.search.submit();
								});
								
								$resultBlock.append($div);
							}
							$("#resultDiv").css("display", "block");
						}
					}
				});
			} else {
				$("#resultDiv").css("display", "none");
			}
		}).focusout(function() {
			setTimeout(function() {
				$("#resultDiv").css("display", "none");
			}, 100);
		});
	</script>
</body>
</html>