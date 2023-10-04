
var fnum = 1;
function changeFile(e, exFileNum) {
	
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

function catdogInsert(form) {
	var cate = document.getElementsByName("cd_cate")[0].value.replace(/ /g,"");
	var name = document.getElementsByName("cd_name")[0].value.replace(/ /g,"");
	var lifespan = document.getElementsByName("cd_lifespan")[0].value.replace(/ /g,"");
	var birth = document.getElementsByName("cd_birth")[0].value.replace(/ /g,"");
	var weight = document.getElementsByName("cd_weight")[0].value.replace(/ /g,"");
	var personal = document.getElementsByName("cd_personality")[0].value.replace(/ /g,"");
	var explain = document.getElementsByName("cd_explain")[0].value.replace(/ /g,"");
			
	if(cate == "") {
		alert("구분을 선택하세요.");
		return false;
	} else if(name == "") {
		alert("품종을 입력하세요");
		return false;
	} else if(lifespan == ""){
		alert("수명을 입력하세요.");
		return false;
	} else if(birth == ""){
		alert("출생지를 입력하세요.");
		return false;
	} else if(weight == ""){
		alert("무게를 입력하세요.");
		return false;
	} else if(personal == ""){
		alert("성격을 입력하세요.");
		return false;
	} else if(explain == ""){
		alert("설명을 입력하세요.");
		return false;
	} 
	
	nameSet();
	
	return true;
}
