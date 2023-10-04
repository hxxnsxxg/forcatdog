<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/common/base.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/common/content.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/member/testConfirm.css">

</head>
<body>
	<div class='paddingdiv'>
		
		<form action="<%= request.getContextPath() %>/selectTest.me" method="post" id="goingTest" name="goingTestForm">						
			<br><br>
			
			<span id="select"><i class="fa fa-paw fa-1.5x"></i> 시험 종류 선택</span>
			
			<br><br>	
			
			<div id="choose" class="catdog">
				CAT <input type="radio" class="radio" name="cate" value="CAT" checked>
				&nbsp;&nbsp;&nbsp;
				DOG <input type="radio" class="radio" name="cate" value="DOG">	
			</div>
			
			<br><br>
			
			<input type="checkbox" id="allow">&nbsp;
			<span id="announce"> 응시료와 주의사항을 모두 확인했으며, <br> 
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								시험에 응시하겠습니다.</span>   
			
			<br><br>
			
			<div class="btns">
				<input id="okayBtn" type="button" onclick="checkfield();" value="결제 및 응시">
				<input type="button" id="cancelBtn" onclick="self.close();" value="취소하기">
			</div>
		</form>
	</div>

	<script>
		function checkfield() {
			if (document.getElementById("allow").checked == false) {
				alert('확인사항에 체크해 주세요.');
				return;
			}

			var amount = "200";
			var name = "(주)포켓독";
			var buyer_name = "loginUser";
			var buyer_phone = "010-1234-5678";
			var buyer_email = "aaa@naver.com";
			var buyer_addr = "서울시 강남구 역삼동";
			var merchant_uid = 'merchant_' + new Date().getTime();

			payment(amount, name, buyer_name, buyer_email, buyer_phone,
					buyer_addr, merchant_uid);

		}

		function payment(amount, name, buyer_name, buyer_email, buyer_phone,
				buyer_addr, merchant_uid) {
			window.resizeTo(915, 680);

			var IMP = window.IMP;
			IMP.init("imp25493295"); // 가맹점 식별코드 (고유코드)

			IMP.request_pay({ // param
				pg : "html5_inicis", // 이니시스 결제방식
				pay_method : "card", // 무통장 입금

				merchant_uid : merchant_uid, // 결제 고유 식별번호
				amount : amount, // 결제 금액
				name : name, // 주문 대상
				buyer_name : buyer_name, // 주문자이름
				buyer_email : buyer_email, // 주문자 이메일
				buyer_tel : buyer_phone, // 주문자 연락처
				buyer_addr : buyer_addr

			}, function(rsp) { // callback
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					alert(msg);

					var f = document.goingTestForm;
					opener.name = "testApply";
					f.target = opener.name;
					f.submit();
					self.close();

				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				window.resizeTo(800, 500);
			});
		}
	</script>

	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
</body>
</html>