function nameSet(){
	var i = 0;
	$(".file").each(function(){
		if($(this).val() == ""){
			$(this).remove();
		} else{
			$(this).attr("name", petImg);
		}
	});
}

function matchInsert(form){
	var title = document.getElementsByName("matchTitle")[0].value.replace(/ /g,"");
	var matchContent = document.getElementsByName("matchContent")[0].value.replace(/ /g,"");
	var petList = document.getElementsByName("petList[0].petNum")[0].value.replace(/ /g,"");
	if(title == ""){
		alert("제목을 입력하세요.");
		return false;
	} else if( petList == ""){
		alert("펫을 선택해주세요");
		return false;
	} else if(matchContent == ""){
		alert("기타내용을 입력하세요.");
		return false;
	}
//	nameSet();
	return true;
}

function InmatchInsert(form){
	var title = document.getElementsByName("matchTitle")[0].value.replace(/ /g,"");
	var matchContent = document.getElementsByName("matchContent")[0].value.replace(/ /g,"");
	var petList = document.getElementsByName("petList[0].petNum")[0].value.replace(/ /g,"");
	if(title == ""){
		alert("제목을 입력하세요.");
		return false;
	} else if( petList == ""){
		alert("펫을 선택해주세요");
		return false;
	} else if(matchContent == ""){
		alert("기타내용을 입력하세요.");
		return false;
	}
//	nameSet();
	insertMatch();
	return true;
}