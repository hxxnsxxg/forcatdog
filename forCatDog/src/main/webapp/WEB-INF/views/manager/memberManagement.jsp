<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<%@ include file="/resources/globalVariable.jsp" %>
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/manager/memberManagement.css?after"> 
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/Mpaging2.css">
<script src="https://kit.fontawesome.com/58029e7b69.js" crossorigin="anonymous"></script>
</head>
<body>
	<div class="wrapper">
		<nav id="sidebar" class="sidebar">
			<div class="sidebar-content">
				<a class="sidebar-brand" href="managerMain.mn">
	        		<span class="align-middle">관리자 메뉴</span>     
	        	</a>
	        	
	        	<ul class="sidebar-nav">
	        		<li class="sidebar-header">Menu</li>
	        		
	        		<li class="menu">
	        			<a class="sidebar-link1"> 
		        			<i class="fas fa-bullhorn" style="color:white; margin-right:8px;"></i>
		        			<span class="align-middle">공지 및 이용안내</span>
	        			</a>
	        			<ul class="sidebar-dropdown" style="display:none;">
	        				<li class="sidebar-item">
	        					<a class="sidebar-link" href="managerMain.mn">- 글 목록</a>
	        				</li>
	        				<li class="sidebar-item">
	        					<a class="sidebar-link" href="nWriteFrom.cs">- 공지사항 등록</a>
	        				</li>
	        				<li class="sidebar-item">
	        					<a class="sidebar-link" href="operationWriteForm.cs">- 이용안내 등록</a>
	        				</li>        		
	        			</ul>
	        		</li>
	        		<li class="menu">
	        			<a class="sidebar-link1"> 
		        			<i class="fas fa-paw" style="color:white; margin-right:10px;"></i>
		        			<span class="align-middle">캣독 정보</span>
	        			</a>
	        			<ul class="sidebar-dropdown" style="display:none;">
	        				<li class="sidebar-item">
	        					<a class="sidebar-link" href="catdogWriteForm.cc">- 캣독 등록</a>
	        				</li>
	        				<li class="sidebar-item">
	        					<a class="sidebar-link" href="manager_catdog.cc">- 캣독 목록</a>
	        				</li>
	        			</ul>
	        		</li>	
	        		<li class="sidebar-item">
	        			<a class="sidebar-link" href="managerPage.mn"> 
		        			<i class="fas fa-user-edit" style="color:white; margin-right:7px;"></i>
		        			<span class="align-middle">회원 관리</span>
	        			</a>
	        		</li>	
	        		<li class="sidebar-item">
	        			<a class="sidebar-link" href="qnaManagerPage.mn"> 
		        			<i class="fas fa-phone-square-alt" style="color:white; margin-right:12px;"></i>
		        			<span class="align-middle">문의 관리</span>
	        			</a>
	        		</li>	
	        		<li class="sidebar-item">
	        			<a class="sidebar-link" href="reportList.mn"> 
		        			<i class="fas fa-ankh" style="color:white;  margin-right:16px;"></i>
		        			<span class="align-middle">신고 관리</span>
	        			</a>
	        		</li>
	        		
	        		<li class="menu">
	        			<a class="sidebar-link1"> 
		        			<i class="fas fa-pencil-alt" style="color:white; margin-right:10px;"></i>
		        			<span class="align-middle">게시글 관리</span>
	        			</a>
	        			<ul class="sidebar-dropdown" style="display:none;">
	        				<li class="sidebar-item">
	        					<a class="sidebar-link" href="manager_boardList.mn">- 자유게시판</a>
	        				</li>
	        				<li class="sidebar-item">
	        					<a class="sidebar-link" href="manager_sellshareList.mn">- 팔아요/나눔해요</a>
	        				</li>
	        				<li class="sidebar-item">
	        					<a class="sidebar-link" href="manager_matchList.mn">- 매칭</a>
	        				</li>
	        			</ul>
	        		</li>	
	        	</ul>
	        </div> 
		</nav>
		
		<div class="main">
			<nav class="navbar navbar-expand navbar-light navbar-bg">
				<span><img id="img" src="${contextPath}/resources/images/adminlogo.png"></span>
				<span id="Nick">Admin님</span>
				<a class="fas fa-envelope-open fa-lg"onclick="window.open('${ contextPath }/messageListForm.ms', 'messageListForm', 'width=580, height=690');"> Message</a>
				<a class="fas fa-sign-out-alt fa-lg" href='${ contextPath }/logout.me'> Logout</a>		
			</nav>
			
			<div class="content">
			<br><br><br>
				<div id='btnblock'>
					<input id="btn1" type="button" value="회원관리"  onClick="location.href='${ contextPath }/managerPage.mn'">
				</div><br><br>
					<div id='searchblock'>
						<form action="searchMember.mn" method="post">
							<select id="searchOption" name="searchOption">
								<option value="member_Id">아이디</option>
								<option value="member_name">이름</option>
							</select>
							<input id="keyword" type="text" name="keyword" size="15">
							<button id='searchuserbtn' type="submit">검색</button>
						</form>
					</div>
					<div id='floatblock'>
							<input id="btn4"type="button" value="선택 탈퇴" onclick="deleteValue();">
					</div><br>
				
				<div id='userinfoblock'>
					<table id='userinfotable'>
						<thead>
							<tr>
								<th><input id="allCheck" type="checkbox" name="allCheck" onclick="allChk(this);"></th>
								<th>아이디</th>
								<th>사용자이름</th>
								<th>닉네임</th>
								<th>사용자이메일</th>
								<th>전화번호</th>
								<th>등록일</th>
								<th>가입상태</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${ requestScope.mList }" var="m">
							<tr>
								<td><input type="checkbox" name="rowCheck" value="${ m.id }"></td>
								<td>${ m.id }</td>
								<td>${ m.name }</td>
								<td>${ m.nickName }</td>
								<td>${ m.email }</td>
								<td>${ m.phone }</td>
								<td>${ m.enrollDate }</td>
								<td>${ m.status }</td>
							</tr>
						</c:forEach>
							
							
						</tbody>
					</table>
					
					<br><br>
				<c:if test="${ requestScope.mList.size() > 0 }">
					<div class="pagingArea" align="center">
						<c:if test="${ 1 >= pi.startPage }">
							<button class="border first"><i class="fas fa-chevron-left"></i></button>&nbsp;
						</c:if>
						<c:if test="${ 1 < pi.startPage }">
							<c:url var="before" value="${ loc }">
								<c:param name="page" value="${ pi.startPage - 1 }"/>
								<c:param name="cate" value="${ cate }"/>
							</c:url>
							<button class="border pointer" onclick="location.href='${ before }'"><i class="fas fa-chevron-left"></i></button>&nbsp;
						</c:if>
						
						<!-- 페이지 -->
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
								<button class="num selected">${ p }</button>
										
							</c:if>
							
							<c:if test="${ p ne pi.currentPage }">
								<c:url var="pagination" value="${ loc }">
									<c:param name="page" value="${ p }"/>
									<c:param name="cate" value="${ cate }"/>
								</c:url>
								<button class="num pointer" onclick="location.href='${ pagination }'">${ p }</button>&nbsp;
							</c:if>
						</c:forEach>
						
						<!-- [다음] -->
						<c:if test="${ pi.maxPage <= pi.endPage }">
							<button class="border last"><i class="fas fa-chevron-right"></i></button>&nbsp;
						</c:if>
						<c:if test="${ pi.maxPage > pi.endPage }">
							<c:url var="after" value="${ loc }">
								<c:param name="page" value="${ pi.endPage + 1 }"/>
								<c:param name="cate" value="${ cate }"/>
							</c:url> 
							<button class="border pointer" onclick="location.href='${ after }'"><i class="fas fa-chevron-right"></i></button>&nbsp;
						</c:if>
						
					</div>
				</c:if>
				</div>
				<br>
				
				
			<script>
			function allChk(obj){
				var chkObj = document.getElementsByName("rowCheck");
				var rowCnt = chkObj.length - 1;
				var check = obj.checked;
				if(check){
					for(var i = 0; i <= rowCnt; i++){
						if(chkObj[i].type == "checkbox")
							chkObj[i].checked = true;
					}
				} else {
					for(var i = 0; i <= rowCnt; i++){
						if(chkObj[i].type == "checkbox"){
							chkObj[i].checked = false;
						}
					}
				}
			}
			
			function deleteValue(){
				var url = "mdeleteUser.mn";
				var valueArr = new Array();
				var list = $("input[name='rowCheck']");
				for(var i = 0; i < list.length; i++){
					if(list[i].checked){
						valueArr.push(list[i].value);
					}
				}
				if(valueArr.length == 0) {
					alert("선택된 회원이 없습니다.");
				} else {
					var chk = confirm("포캣독 회원 탈퇴를 시키겠습니까?");
					if(chk){
						$.ajax({
							url : url,
							type : 'POST',
							traditional : true,
							data : {
								valueArr : valueArr
							},
							success: function(jdata){
								if(jdata = 1){
									alert("회원 탈퇴를 시켰습니다.");
									location.replace("managerPage.mn");
								}
								else {
									alert("회원 탈퇴에 실패하였습니다.");
								}
							}
						});
					}
				}
			}
			
			$(document).ready(function(){
				$(".menu>a").click(function(){
					var submenu = $(this).next("ul");
					
					if( submenu.is(":visible") ){
						submenu.slideUp();
					} else{
						submenu.slideDown();
					}
				});
			});
			</script>
			</div>
		</div>
		

	</div>

		
	<%-- <div class="main">
		<img src="${ contextPath }\resources\images\adminlogo.png">
		<br><br>
		<a href="managerPage.mn"><input type="button" class="btn" value="회원관리" id="member"></a>&nbsp;
		<a href="qnaManagerPage.mn"><input type="button" value="문의게시글"  class="btn" id="question"></a>&nbsp;
		<a href="reportList.mn"><input type="button"  class="btn" value="신고관리" id="report"></a>
	</div> --%>
</body>
</html>