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
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/member/requestManagement.css">
</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<%@ include file="/WEB-INF/views/common/nav.jsp" %>
		
		<div id='content'>
			<div class='paddingdiv'>
				<h1>의뢰 관리</h1>
				
				<hr>
				
				<table id='matchbtntable'>
					<tr>
						<th ${ option == 'P' ? "style='background: #F2EBEB;'" : "onclick=matchList('P')" }>
							<div>
								<i class="fa fa-tasks"></i> 미승인
							</div>
						</th>
						<th ${ option == 'Y' ? "style='background: #F2EBEB;'" : "onclick=matchList('Y')" }>
							<div>
								<i class="fa fa-user-check"></i> 수락
							</div>
						</th>
						<th ${ option == 'N' ? "style='background: #F2EBEB;'" : "onclick=matchList('N')" }>
							<div>
								<i class="fas fa-user-times"></i> 거절
							</div>
						</th>
					</tr>
				</table>
				
				<table class='matchinfotable' id="cateTable1">
					<colgroup>
				        <col class="col1"><col class="col2"><col class="col3"><col class="col4">
				    </colgroup>
					<c:if test="${requestScope.list.size() <= 0 }">
					 	<div class="notice">
					 		<i id="face" class="far fa-meh-rolling-eyes fa-3x"></i>
					 		&nbsp;&nbsp;
					 		<span>아직 아무것도 없어요!</span>
					 	</div>	 					 	
					</c:if>
					<c:if test="${requestScope.list.size() > 0 }">
						<tr>
							<th>구분</th>
							<th>제목</th>
							<th>게시자</th>
							<th>게시일/신청일</th>
						</tr>
						<c:forEach items="${ requestScope.list }" var="mc">
							<tr style="background: #F2EBEB;">
								<td>
									<c:choose>
										<c:when test="${ mc.matchCate == 1 }">짝 찾기</c:when>
										<c:when test="${ mc.matchCate == 2 }">산책</c:when>
										<c:when test="${ mc.matchCate == 3 }">펫시터</c:when>
									</c:choose>
								</td>
								<td class="req">
									<a class="originLink" href="${ contextPath }/findMatchDetail.mc?mcNum=${ mc.matchNum }"><span>${ mc.matchTitle }</span></a>
									<c:if test="${ option == 'Y' }">
										<div class="chatBtnBlock">
											<button type="button" class="chat" onclick="reqInfo(${ mc.matchNum }, '${ mc.memberId }', '${ mc.nickName }', '${ option }');">
												<i class="fa fa-comment-dots"></i>
											</button>
										</div>
									</c:if>
								</td>
								<td>
									${ mc.nickName }
								</td>
								<td>
									${ mc.matchDate }
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>		
			</div>
		</div>
		
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
	
	<script>
		$(function() {
			$(".chatBtnBlock").siblings("a").addClass("reqLink");
		});

		function matchList(option) {
			location.href = '${ contextPath }/reqMatchList.me?option=' + option;
		}

		function reqInfo(matchNum, memberId, nickName, option) {
			window.open("", "reqInfo",'status=no, height=770, width=720');

			var form = document.createElement("form");
			if(option == 'Y') {
				form.action = "${ contextPath }/matchChat.me";
			} else {
				form.action = "${ contextPath }/reqInfo.me";
			}
			
			form.target = "reqInfo";
			form.method = "post";

			var input1 = document.createElement("input");
			input1.type = "hidden";
			input1.name = "matchNum";
			input1.value = matchNum;

			var input2 = document.createElement("input");
			input2.type = "hidden";
			input2.name = "memberId";
			input2.value = memberId;

			var input3 = document.createElement("input");
			input3.type = "hidden";
			input3.name = "nickName";
			input3.value = nickName;
			
			var input4 = document.createElement("input");
			input4.type = "hidden";
			input4.name = "option";
			input4.value = option;

			var input5 = document.createElement("input");
			input5.type = "hidden";
			input5.name = "option2";
			input5.value = "N";

			form.appendChild(input1);
			form.appendChild(input2);
			form.appendChild(input3);
			form.appendChild(input4);
			form.appendChild(input5);
			
			document.body.appendChild(form);

			form.submit();

			document.body.removeChild(form);
		}
		
	</script>
</body>
</html>