<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<%@ include file="/resources/globalVariable.jsp" %>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/message/searchUser.css?after">
</head>
<body>
	<h1><img src="${ contextPath }/resources/images/searchIcon.png"></h1>
		<input type='text' id="nickName" placeholder='닉네임을 입력하세요.'>
		<input type="hidden" id="searchNickName">
		<input type ="button" id="searchUser" value="찾기">
		<br>
		<hr>
		
		<table id="userList">
			<thead>
				<tr>
					<th>프로필</th>
					<th>닉네임(아이디)</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
		<div class="pagingArea" align="center"></div>
		
		<script>
			function searchAllUser(nickName, page) {
				$.ajax({
					url: "searchAllUser.ms",
					type: "post",
					data: {keyword: nickName, page: page},
					success: function(data) {
						$userList = $("#userList tbody");
						$userList.html("");
						var list = data.list;
						var pi = data.pi;

						if(list.length > 0) {
							for(var i in list) {
								var $tr = $("<tr>").on("click", function() {
									var userInfo = $(this).children(".userName").text().split("(");
									userInfo[1] = userInfo[1].replace(")", "");
									
									trClick(userInfo[1], userInfo[0]);
								});
								
								var $td1 = $("<td>");
								var $div = $("<div>").addClass("profile");
								if(list[i].changeFileName){
									var $img = $("<img>").attr("src", "resources/mprofileUploadFiles/" + list[i].changeFileName);
								} else {
									var $img = $("<img>").attr("src", "resources/images/user.png");
								}
								var $td2 = $("<td>").addClass("userName").html(list[i].nickName  + "(" + list[i].id + ")");

								$div.append($img);
								$td1.append($div);
								$tr.append($td1).append($td2);

								$userList.append($tr);
							}
							
							var $pagingArea = $(".pagingArea");
							$pagingArea.html('');
							var $before = $("<font>").html("[이전]");
							var $after = $("<font>").html("[다음]");;
							
							if(1 < pi.startPage) {
								$before.on("click", function() {
									searchAllUser($('#searchNickName').val(), pi.startPage - 1);
								}).addClass("pageBtn");
							}

							$pagingArea.append($before);
							
							for(var i = pi.startPage; i <= pi.endPage; i++) {
								var $p = $("<font>").html("[" + i + "]");
								if(i == pi.currentPage) {
									$p.css({"font-weight" : "bold", "color" : "red", "size" : "4"});
								} else {
									var $input = $("<input>").attr("type", "hidden").val(i);
									$p.on("click", function() {
										searchAllUser($('#searchNickName').val(), $input.val());
									}).addClass("pageBtn");
								}
								$pagingArea.append($p);
							}

							if(pi.maxPage > pi.endPage) {
								$after.on("click", function() {
									searchAllUser($('#searchNickName').val(), pi.endPage + 1);
								}).addClass("pageBtn");
							}
							
							$pagingArea.append($after);	
							$("body").append($pagingArea);
						} else {
							$(".pagingArea").html('');
						}
					}
				});
			}
			
			$("#searchUser").on("click", function() {
				var nickName = $("#nickName").val();
				if(nickName != "") {
					$("#searchNickName").val(nickName);
					searchAllUser(nickName, 1);
				}
			});

			function trClick(id, nickName) {
				opener.document.getElementById('memberId').value = id;
				var idSearch = opener.document.getElementById('idSearch');
				idSearch.value = nickName + "(" + id + ")";
				idSearch.readonly = "true";
				opener.document.getElementById('resultDiv').style.display = "none";
				
				self.close();
			}
		</script>
</body>
</html>