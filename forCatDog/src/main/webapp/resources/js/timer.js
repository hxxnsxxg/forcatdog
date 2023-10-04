var time = 600;
var min = ""; //분
var sec = ""; //초
			
//setInterval(함수, 시간)
var x = setInterval(function(){
	//parseInt() : 정수를 반환
	min = parseInt(time/60); //몫을 계산
	sec = time%60;  //나머지를 계산
				
	document.getElementById('timer').innerHTML = min + "분 " + sec + "초";
	time--;
				
	//타임아웃 시
	if(time < 0) {
		clearInterval(x);  //setInterval() 실행을 끝냄
		document.getElementById("timer").innerHTML = "시간초과";
		alert('시간이 초과하여 탈락하셨습니다. 마이페이지로 돌아갑니다.');
		location.href='myPage.me';
	}
				
}, 1000);