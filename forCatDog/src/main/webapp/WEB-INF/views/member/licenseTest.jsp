<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<%@ include file="/resources/globalVariable.jsp" %>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/common/base.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/common/content.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/member/licenseTest.css">
<script src="${ contextPath }/resources/js/timer.js"></script>
</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<%@ include file="/WEB-INF/views/common/nav.jsp" %>
		
		<div id='content'>
			<div class="paddingdiv">
				<div id='title'>
					<h1><i class="fa fa-file-alt"></i> 펫시터 자격 시험</h1>
				</div>
				
				<div id='top'>
					<span id="leftTime"><i class="fa fa-hourglass-half"></i>남은 시간</span>
					<div id="timer"></div>
				</div>
				
				<hr>
				
				<form action="<%= request.getContextPath() %>/checkTest.me" method="post" id="goGrading" name="goGradingForm" onsubmit="return endTest();">
					<c:forEach items="${ requestScope.qList }" var="q" varStatus="vs">
					<input type="hidden" name="cList[${ vs.index }].quiz_num" value="${ q.quiz_num }">
					<span style="font-weight: bold; font-size: 20px;">${ vs.index + 1 }번 ) 
						  ${ q.quiz_content }&nbsp;&nbsp;
						  <label id="dif">
						  	<c:if test="${q.quiz_difficulty == 1}">
						  		난이도 <i class="fa fa-pencil-alt"></i><br><br>
						  	</c:if>		
						 	<c:if test="${q.quiz_difficulty == 2}">
						  		난이도 <i class="fa fa-pencil-alt"></i><i class="fa fa-pencil-alt"></i><br><br>
						  	</c:if>
						  	<c:if test="${q.quiz_difficulty == 3}">
						  		난이도 <i class="fa fa-pencil-alt"></i><i class="fa fa-pencil-alt"></i><i class="fa fa-pencil-alt"></i><br><br>
						  	</c:if>
						  </label>
					</span>
						<span id="choice">
							<c:forEach items="${ q.cList }" var="c">
								<input type="radio" class="radio" name="cList[${ vs.index }].quiz_choice" value="${ c.quiz_choice }">&nbsp;${ c.quiz_choice }<br>	
							</c:forEach>
						</span>
						<br><br><br><br>			
					</c:forEach>
					
					<div class='submitblock'>
						<button type="submit" id="okayBtn">제출</button>
					</div>
				</form>
			</div>
		</div>
		
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
	
	<script>
		function endTest(){
			if(confirm("정말 제출 하시겠습니까?")) {
				if(!checkAns()) {
					return false;			
				} else {
					return true;
				}
			} else {
				return false;
			}
		}
		
		function checkAns(){		
			//누락된 문제 체크
			var num = 0;
			for(var i = 0; i < goGradingForm.elements.length; i++) {
				var check = goGradingForm.elements[i];
				if(check.checked == true) {
					num++;
				}
			}			
			
			if(num < 9) {
				alert("선택되지 않은 문제가 있습니다.");
				return false;
			} else {
				return true;
			}
		}
	</script>
</body>
</html>