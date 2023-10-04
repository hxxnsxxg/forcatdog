<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/common/base.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/common/content.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/manager/petQuiz.css">
</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<%@ include file="/WEB-INF/views/common/nav.jsp" %>
		
		<div id='content'>
		
			<br>
			<h1>펫시터 자격시험</h1>
			<br>
			
			<hr>
			
			<br><br>		
			1 ) 다음 중 반려견의 스트레스 원인으로 가장 잘못된 것은?<br>	
				<input type="radio" ondblclick="this.checked=false"> 운동부족<br>	
				<input type="radio" ondblclick="this.checked=false"> 충분한 영양공급<br>	
				<input type="radio" ondblclick="this.checked=false"> 애정과다<br>	
				<input type="radio" ondblclick="this.checked=false"> 주인과의 관계<br>			
			
			<br><br>		
			2 ) 개의 체온에 관한 설명으로 틀린 것은?<br>				
				<input type="radio" ondblclick="this.checked=false"> 강아지의 정상 체온은 36~36.5도<br>	
				<input type="radio" ondblclick="this.checked=false"> 목욕전 체온을 재고 정상체온이 아니면 목욕을 시키지 않는다.<br>	
				<input type="radio" ondblclick="this.checked=false"> 뒷다리 가랑이에서 체온은 측정하면 정상체온보다 약 1도정도 낮다.<br>	
				<input type="radio" ondblclick="this.checked=false"> 반려견의 위험 체온은 40도 이상이다.<br>			
			
			<br><br>
			3 ) 반려견에게 약을 먹이는 방법으로 옳지 않은 것은?	<br>		
				<input type="radio" ondblclick="this.checked=false"> 가루약은 캡슐에 싸거나 소량을 음식에 섞어서 복용시킨다.<br>	
				<input type="radio" ondblclick="this.checked=false"> 알약의 경우 먼저 한 손으로 양 귀를 잡고 턱 부분을 위로 향하게 한다.<br>	
				<input type="radio" ondblclick="this.checked=false"> 물약은 목 부분부터 턱을 잡고 스포이트로 이와 이 사이에 조금씩 흘려준다.<br>	
				<input type="radio" ondblclick="this.checked=false"> 부드럽게 쓰다듬으며 자연스럽게 등 뒤쪽에 위치해 약이 보이지 않도록 한다.<br>			
			
			<br><br>
			4 ) 개의 본능이라 볼 수 없는 것은?<br>	 			
				<input type="radio" ondblclick="this.checked=false"> 경계본능<br>	
				<input type="radio" ondblclick="this.checked=false"> 자기방어본능<br>	
				<input type="radio" ondblclick="this.checked=false"> 사교본능<br>	
				<input type="radio" ondblclick="this.checked=false"> 호기심본능<br>	
			
			<br><br>
			5 ) 개의 동작 바디랭귀지(동작 의사표현)에 대한 설명으로 적절하지 않은 것은?<br>	 			
				<input type="radio" ondblclick="this.checked=false"> 키우는 개가 자세를 낮추고 다리를 구부려서 다가온다 - 공격하겠다는 신호<br>	
				<input type="radio" ondblclick="this.checked=false"> 이빨을 드러낸다 - 개가 이를 드러내는 것은 공격 전의 자세<br>	
				<input type="radio" ondblclick="this.checked=false"> 눈을 살짝 위로 떠서 사람을 바라보며 눈치를 살핀다 - 개 자신이 뭔가 좋지 않은 일을 했을 때<br>	
				<input type="radio" ondblclick="this.checked=false"> 귀를 뒤로 확 젖히고 꼬리를 빙글빙글 흔들다 - 기쁘거나 응석을 부리는 경우<br>	
		
			
			<br><br>		
			6 ) 다음 중 반려견의 스트레스 원인으로 가장 잘못된 것은?<br>	 			
				<input type="radio" ondblclick="this.checked=false"> 운동부족<br>	
				<input type="radio" ondblclick="this.checked=false"> 충분한 영양공급<br>	
				<input type="radio" ondblclick="this.checked=false"> 애정과다<br>	
				<input type="radio" ondblclick="this.checked=false"> 주인과의 관계<br>	
			
			
			<br><br>		
			7 ) 개의 체온에 관한 설명으로 틀린 것은? <br>				
				<input type="radio" ondblclick="this.checked=false"> 강아지의 정상 체온은 36~36.5도<br>	
				<input type="radio" ondblclick="this.checked=false"> 목욕전 체온을 재고 정상체온이 아니면 목욕을 시키지 않는다.<br>	
				<input type="radio" ondblclick="this.checked=false"> 뒷다리 가랑이에서 체온은 측정하면 정상체온보다 약 1도정도 낮다.<br>	
				<input type="radio" ondblclick="this.checked=false"> 반려견의 위험 체온은 40도 이상이다.<br>			
			
			<br><br>
			8 ) 반려견에게 약을 먹이는 방법으로 옳지 않은 것은?<br>	 
				<input type="radio" ondblclick="this.checked=false"> 가루약은 캡슐에 싸거나 소량을 음식에 섞어서 복용시킨다.<br>	
				<input type="radio" ondblclick="this.checked=false"> 알약의 경우 먼저 한 손으로 양 귀를 잡고 턱 부분을 위로 향하게 한다.<br>	
				<input type="radio" ondblclick="this.checked=false"> 물약은 목 부분부터 턱을 잡고 스포이트로 이와 이 사이에 조금씩 흘려준다.<br>	
				<input type="radio" ondblclick="this.checked=false"> 부드럽게 쓰다듬으며 자연스럽게 등 뒤쪽에 위치해 약이 보이지 않도록 한다.<br>	
	
			<br><br>
			9 ) 개의 본능이라 볼 수 없는 것은? <br>	
				<input type="radio" ondblclick="this.checked=false"> 경계본능<br>	
				<input type="radio" ondblclick="this.checked=false"> 자기방어본능<br>	
				<input type="radio" ondblclick="this.checked=false"> 사교본능<br>	
				<input type="radio" ondblclick="this.checked=false"> 호기심본능<br>	
			
			<br><br>
			10 ) 개의 동작 바디랭귀지(동작 의사표현)에 대한 설명으로 적절하지 않은 것은? <br>	
				<input type="radio" ondblclick="this.checked=false"> 키우는 개가 자세를 낮추고 다리를 구부려서 다가온다 - 공격하겠다는 신호<br>	
				<input type="radio" ondblclick="this.checked=false"> 이빨을 드러낸다 - 개가 이를 드러내는 것은 공격 전의 자세<br>	
				<input type="radio" ondblclick="this.checked=false"> 눈을 살짝 위로 떠서 사람을 바라보며 눈치를 살핀다 - 개 자신이 뭔가 좋지 않은 일을 했을 때<br>	
				<input type="radio" ondblclick="this.checked=false"> 귀를 뒤로 확 젖히고 꼬리를 빙글빙글 흔들다 - 기쁘거나 응석을 부리는 경우<br>	
			
			<br><br><br>
			<div class="btn">
				<button id="submitBtn">제출하기</button>
				<button id="cancelBtn">다시 풀기</button>		
			</div>			
			
		</div>
		
		<br><br>
		
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
</body>
</html>