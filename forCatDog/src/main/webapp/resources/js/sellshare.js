
var fnum = 1;
function changeFile(e, exFileNum) {
	console.log(exFileNum);
	var exFile = document.getElementsByName("exFile");
	for(var i = 0; i < exFile.length; i++) {
		if(exFile[i].value == exFileNum) {
			document.getElementById("fileArea").removeChild(exFile[i]);
		}
	}

};

function delFile(id) {
	if(id != 'setFile0') {
		var setFile = document.getElementById(id);
		$(setFile).remove();
	
		var fileArea = document.getElementById("fileArea");
		if (fileArea.lastChild.firstChild == null) {
			$('.file').attr("onchange", "changeFile(this);");
		} else {
			fileArea.lastChild.firstChild.setAttribute("onchange", "changeFile(this);");
		}
	} else {
		$('.file:eq(0)').val("");
	}
};


function nameSet() {
	var i = 0;
	$(".file").each(function() {
		if($(this).val() == "") {
			$(this).remove();
		} else {
			$(this).attr("name", "setFile");
		}
	});
}

function sellshareInsert() {
	
	var regexp = /^[0-9]*$/
	
	var title = document.getElementsByName("pdTitle")[0].value.replace(/ /g,"");
	var area = document.getElementById("location1").value;
	var name = document.getElementsByName("productName")[0].value.replace(/ /g,"");
	var price = document.getElementsByName("price")[0].value.replace(/ /g,"");
	var content = document.getElementsByName("pdContent")[0].value.replace(/ /g,"");
	var image = document.getElementById("contentImg1").src;
	
	if(regexp.test(price)) {
		
	}
	
	if(title == "") {
		alert("제목을 입력하세요.");
		return false;
	} else if(name == "") {
		alert("물품 명을 입력하세요");
		return false;
	} else if(price == ""){
		alert("가격을 입력하세요.");
		return false;
	} else if(!regexp.test(price)) {
		alert("가격은 숫자만 입력하세요.");
		return false;
	} else if(content ==""){
		alert("내용을 입력하세요.");
		return false;
	} else if(!area) {
		alert("지역을 선택해 주세요.");
		return false;
	} else if(image == ""){
		alert("메인 사진을 첨부해 주세요.");
		return false;
	}
	
	nameSet();
	
	return true;
}


