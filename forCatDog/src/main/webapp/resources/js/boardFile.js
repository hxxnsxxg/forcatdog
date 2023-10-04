
var fnum = 1;
function changeFile(e) {
	var input = document.createElement("input");
	input.setAttribute("name", "setFile");
	input.setAttribute("type", "file");
	input.setAttribute("class", "file");
	input.setAttribute("onchange", "changeFile(this);");

	var delBtn = document.createElement("input");
	delBtn.setAttribute("name", "fileDel");
	delBtn.setAttribute("type", "button");
	delBtn.setAttribute("class", "delFile");
	delBtn.setAttribute("value", "삭제");
	delBtn.setAttribute("style", "margin-left: 7px;");
	delBtn.setAttribute("onclick", "delFile('setFile" + fnum + "');");

	var setFile = document.createElement("div");
	setFile.setAttribute("id", "setFile" + fnum++);
	setFile.setAttribute("style", "display: block;");
	setFile.append(input);
	setFile.append(delBtn);

	document.getElementById("fileArea").append(setFile);

	e.setAttribute("onchange", null);

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

function boardInsert(form) {
	var title = document.getElementsByName("boardTitle")[0].value.replace(/ /g,"");
	var content = document.getElementsByName("boardContent")[0].value.replace(/ /g,"");
			
	if(title == "") {
		alert("제목을 입력하세요");
		return false;
	} else if(content == "") {
		alert("내용을 입력하세요");
		return false;
	}
	
	nameSet();
	
	return true;
}
