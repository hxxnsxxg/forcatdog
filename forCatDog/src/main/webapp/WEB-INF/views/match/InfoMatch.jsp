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
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/match/FindMatch.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/paging.css">

</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<%@ include file="/WEB-INF/views/common/nav.jsp" %>
		
		<div id='content'>
			<div class="match_title"><h1>나의 매칭</h1></div>
			<button type="button" class="match_type_btn" ${ cate == 1 ? "id='btn_on'" : "" } onClick="location.href='${ contextPath }/infoMatch.mc?cate=1'">
				<i class="fa fa-heart"></i> 짝
			</button>
			<button type="button" class="match_type_margin_btn0" ${ cate == 2 ? "id='btn_on'" : "" } onClick="location.href='${ contextPath }/infoMatch.mc?cate=2'">
				<i class="fa fa-walking"></i> 산책메이트
			</button>
			<button type="button" class="match_type_margin_btn1" ${ cate == 3 ? "id='btn_on'" : "" } onClick="location.href='${ contextPath }/infoMatch.mc?cate=3'">
				<i class="fa fa-baby-carriage"></i> 펫 시터
			</button>
<%-- 			<c:if test="${ loginUser != null }"> --%>
<%-- 				<button type="button" class="match_type_right" onClick="location.href='${ contextPath }/insertMatchForm.mc?cate=${ cate }'"> --%>
<!-- 					<i class="fa fa-pencil-alt"></i> 등록 -->
<!-- 				</button> -->
<%-- 			</c:if> --%>
			
			<br><br>
			
			<div class="match_content">
				<br>
<!-- 				<div class="inline"> -->

					
					<c:forEach items="${ requestScope.mList }" var="mc">
						<c:url var="findMatchDetail" value="findMatchDetail.mc">
							<c:param name="mcNum" value="${ mc.matchNum }"/>
						</c:url>
						<div class="border_shape mshape" onclick="location.href='${ findMatchDetail }'">
					        <span class="post_thumbnail">
			                	<img src="${ contextPath }/resources/mpetUploadFiles/${ mc.petList[0].changeFileName }">
					            <c:if test="${ mc.matchStatus == 'Y' }">
					            	<span class="matching">매칭중</span>
					            </c:if>
					        </span>
					        <div class="post_title">
					            <a>${ mc.matchTitle }</a>
					            <a>지역 : ${ mc.addr1 }&nbsp;${ mc.addr1 == mc.addr2 ? '' : mc.addr2 }&nbsp;${ mc.addr3 }</a>
					            <a>펫 타입 : ${ mc.petList[0].petType2 }</a>
					            <a>성격 : ${ mc.petList[0].personality }</a>
					        </div>
				       
		    			</div>
	    			</c:forEach>
	    			
				<br><br>
				<c:if test="${ requestScope.mList.size() > 0 }">
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
		<br>
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
</body>
</html>