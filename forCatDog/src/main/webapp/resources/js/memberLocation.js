

function sidoChange() {
	var location1 = document.getElementsByName('addr1')[0].value;
	var location2 = document.getElementsByName('addr2')[0];
	var location3 = document.getElementsByName('addr3')[0];
	location2.innerHTML = "";
	location3.innerHTML = "";
	var data = { sido: location1, sigungu: null };
	if (location1 != '') {
		$.ajax({
			url: 'location.me',
			type: 'post',
			contentType: "application/json",
			data: JSON.stringify(data),
			success: function(data) {
				for (var i in data) {
					var option = document.createElement('option');
					option.innerHTML = data[i];
					location2.appendChild(option);

				}
				sigunguChange();
				location2.removeAttribute('disabled');
			}
		});
	} else {
		location2.setAttribute('disabled', "disabled");
		location3.setAttribute('disabled', "disabled");
		location2.innerHTML = "<option value='0'>시/군/구</option>";
		location3.innerHTML = "<option value='0'>동</option>";
	}
}

function sigunguChange() {
	var location1 = document.getElementsByName('addr1')[0].value;
	var location2 = document.getElementsByName('addr2')[0];
	var location3 = document.getElementsByName('addr3')[0];
	location3.innerHTML = "";
	var data = { sido: location1, sigungu: location2.value };
	if (location2 != '') {
		$.ajax({
			url: 'location.me',
			type: 'post',
			contentType: "application/json",
			data: JSON.stringify(data),
			success: function(data) {
				for (var i in data) {
					var option = document.createElement('option');
					option.innerHTML = data[i];
					location3.appendChild(option);
				}
				location3.removeAttribute('disabled');
			}
		});
	} else {
		location3.setAttribute('disabled', "disabled");
		location3.innerHTML = "<option value='0'>동</option>";

	}
}