
var idc = false;
var nickc = false;

$(function() {
	var idCheck = function(e, n) {
		idc = false;
		var regExp = /^[a-z][a-z0-9]{5,19}$/g;
		var regExp2 = /^[a-z][a-z0-9]{0,4}$/g;
		var value = e.value;

		if (regExp.test(value)) {
			return true;
		} else {
			if (n == 1) {
				if (value.length > 6) {
					e.value = value.slice(0, value.length - 1);
				} else {
					if (!regExp2.test(value)) {
						e.value = value.slice(0, value.length - 1);
					}
				}
			}
			return false;
		}
	};
	var idCheckDB = function(value) {
		$.ajax({
			type: "POST",
			url: contextPath + "/checkId.me",
			contentType: 'application/json',
			data: JSON.stringify({ id : value }),
			success: function(data) {
				console.log(data);
				if (data) {
					alert("사용 가능한 아이디입니다.");
					idc = true;
				} else {
					alert("이미 사용 중인 아이디입니다. 다른 아이디를 입력하세요.");
					idc = false;
				}

			},
			error: function() {
				alert("통신오류 다시 시도하세요");
			}
		});
	};

	var inputId = document.getElementsByName("id")[0];
	inputId.onkeyup = function() {
		idCheck(this, 1);
	};
	inputId.onkeydown = function() {
		idCheck(this, 1);
	};

	var idCheckBtn = document.getElementById("idCheckBtn");
	idCheckBtn.onclick = function() {
		if (idCheck(inputId, 2)) {
			idCheckDB(inputId.value);
		} else {
			alert("아이디를 확인하세요.");
		}
	};

	var pwCheck = function() {
		var pw1 = document.getElementsByName("pw")[0].value;
		var pw2 = document.getElementsByName("pw2")[0].value;

		if (pw1 == pw2) {
			var regExp = /^[a-zA-Z][a-zA-Z\d!*$]{5,19}$/;

			if (regExp.test(pw1)) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	};

	var checkNickname = document.getElementById("checkNickname");
	checkNickname.onclick = function() {
		nickc = false;
		var regExp = /^[a-zA-Z0-9가-힣]{3,19}$/;
		var value = document.getElementsByName("nickName")[0].value;

		if (regExp.test(value)) {
			checkNicknameDB(value);
		} else {
			alert("닉네임을 확인하세요.");
		}

	};

	var checkNicknameDB = function(name) {
		$.ajax({
			type: "POST",
			url: contextPath + "/checkNickname.me",
			contentType: 'application/json',
			data: JSON.stringify({ nickName: name }),
			success: function(data) {
				if (data) {
					alert("사용 가능한 닉네임 입니다.");
					nickc = true;
				} else {
					alert("이미 사용 중인 닉네임입니다. 다른 닉네임을 입력하세요.");
					nickc = false;
				}
			},
			error: function() {
				alert("통신오류 다시 시도하세요");
			}
		});
	};

	var phoneCheck = function() {
		var regExp = /\d{3,4}/;
		var phone = document.getElementsByName("phone")[0];
		var phone1 = document.getElementsByName("phone1")[0].value;
		var phone2 = document.getElementsByName("phone2")[0].value;
		var phone3 = document.getElementsByName("phone3")[0].value;

		if (regExp.test(phone2) && regExp.test(phone3)) {
			phone.value = phone1 + "-" + phone2 + "-" + phone3;
			return true;
		} else {
			return false;
		}
	};

	var birthSet = function() {
		var year = document.getElementsByName("year")[0].value;
		var month = document.getElementsByName("month")[0].value;
		var date = document.getElementsByName("date")[0].value;
		document.getElementsByName("birth")[0].value = year + "-" + month + "-" + date;
	};

	document.getElementById("emailSelect").onchange = function() {
		var email2 = document.getElementsByName("email2")[0];
		var value = this.value;

		if (value != "") {
			email2.setAttribute("readonly", "");
		} else {
			email2.removeAttribute("readonly");
		}

		email2.value = value;
	};

	var emailCheck = function() {
		var regExp = /^[a-zA-Z]([0-9a-zA-Z])*@[0-9a-zA-Z]+.[0-9a-zA-Z]+.[a-zA-Z]{2,3}$/i;
		var email = document.getElementsByName("email")[0];
		var value1 = document.getElementsByName("email1")[0].value;
		var value2 = document.getElementsByName("email2")[0].value;
		email.value = value1 + "@" + value2;

		if (regExp.test(email.value)) {
			return true;
		} else {
			return false;
		}
	};

	var qCheck = function() {
		var ans = document.getElementsByName("pwHintAns")[0].value;

		if (ans == "") {
			return false;
		} else {
			return true;
		}
	};

	var addrCheck = function() {
		var addr1 = document.getElementsByName("addr1")[0].value;
		var addr2 = document.getElementsByName("addr2")[0].value;
		var addr3 = document.getElementsByName("addr3")[0].value;
		
		if(addr1 == "" || addr2 == "" || addr3 == "") {
			return false;
		} else {
			return true;
		}
	}

	var joinBtn = document.getElementById("join");
	joinBtn.onclick = function() {
		if (!idc) {
			alert("아이디를 확인하세요");
		} else if (!pwCheck()) {
			alert("비밀번호를 확인하세요");
		} else if (!nickc) {
			alert("닉네임을 확인하세요");
		} else if (!phoneCheck()) {
			alert("전화번호를 확인하세요");
		} else if (!emailCheck()) {
			alert("이메일을 확인하세요");
		} else if (!qCheck()) {
			alert("비밀번호 힌트 답을 입력해 주세요.");
		} else if(!addrCheck()) {
			alert("지역을 선택해주세요");
		} else {
			birthSet();
			document.getElementById("joinForm").submit();
		}

	};

});
