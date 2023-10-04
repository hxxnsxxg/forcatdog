<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<%@ include file="/resources/globalVariable.jsp"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/base.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/content.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/board/mainBoard_detail.css?after">
</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<%@ include file="/WEB-INF/views/common/nav.jsp"%>

		<div id='content'>

			<br>
			<h1>자유게시판</h1>
			<br>

			<div class="b_detail">
				<div id="boardTitle">${ b.boardTitle }</div>

				<br>

				<div id="infoBar">
					<c:if test="${ !empty b.memberProfile }">
						<div id="profile">
							<img src="resources/mprofileUploadFiles/${ b.memberProfile }">
						</div>
					</c:if>
					<c:if test="${ empty b.memberProfile }">
						<div id="profile">
							<img src="${ contextPath }/resources/images/user.png">
						</div>
					</c:if>
					<div id="profile_area">
						<div id="nickName">${ b.nickName }</div>
						<form action="sendMessageForm.ms" name="sendmsg" target="messageForm" method="post">
		                	<input type="hidden" name="userId" value="${ b.memberId }">
		                	<input type="hidden" name="nickName" value="${ b.nickName }">
	                   	</form>
	                   	<c:if test="${ sessionScope.loginUser != null }">
	                    <button id="sendmsg" type="button" onclick="sendMessage();">
							<i class="fa fa-paper-plane fa-2x"></i>
						</button>
	           			</c:if>
						<br>
						<fmt:parseDate var="date" value='${ fn:split(b.createDate, ".")[0] }' pattern="yyyy-MM-dd HH:mm"/>
						<div id="createDate"><fmt:formatDate value='${ date }' pattern="yyyy-MM-dd HH:mm"/></div>
						&nbsp;&nbsp;&nbsp;
						<div id="boardCount">조회수 : ${ b.views }</div>
					</div>
				</div>

				<br>
				<hr>

				<div id="boardContent">
					<%
						pageContext.setAttribute("newLineChar", "\r\n");
					%>
					${ fn:replace(b.boardContent, newLineChar, "<br>") }
				</div>
				<div class="btnArea">
					<c:url var="reportSendForm" value="sendReportForm.mn">
						<c:param name="memberId" value="${ loginUser.id }"/>
						<c:param name="suspect" value="${ b.memberId }"/>
						<c:param name="reportCate" value="자유게시판<게시글>"/>
						<c:param name="path" value="boardDetail.bo?bNum=${ b.boardNum }"/>
						<c:param name="memberNick" value="${ loginUser.nickName }"/>
						<c:param name="suspectNick" value="${ b.nickName }"/>
					</c:url>
					<c:if test="${ loginUser != null}">
						<c:if test="${ loginUser.getId() != b.memberId }">
							<a onclick="window.open('${ reportSendForm }', 'reportSendForm', 'width=450, height=450');" class="reportBtn">신고</a>
						</c:if>
					</c:if>
				</div>
				<br> <br> <br> <br>

				<c:forEach items="${ b.fileList }" var="f">
					<a href="javascript:void(0);"
					onclick="fileDown(this, ${ f.fileId }, '${ f.originalFileName }', '${ contextPath }/resources/boardUploadFiles/${ f.changeFileName }');">${ f.originalFileName }</a>
				</c:forEach>
				<br> <br>

				<c:if test="${ cList.size() > 0 }">
					<h3>댓글</h3>
					<c:forEach items="${ cList }" var="cm">		
						<!-- 프로필 사진 불러오는 영역 -->
						<div class="comment_area" name="mainCommentDiv" style="position: relative;">
							<c:if test="${ cm.c_level != 0 }">
								<div style="top: -40px; right: 10px; position: relative;">
									<span class="inline" style="margin-left: ${ cm.c_level * 60 }px; display:inline-block;">└</span>
								</div>
							</c:if>	
							<c:if test="${ !empty cm.memberProfile }">
							<div id="profile">
								<img src="resources/mprofileUploadFiles/${ cm.memberProfile }">
							</div>
							</c:if>
							<c:if test="${ empty cm.memberProfile }">
							<div id="profile">
								<img src="${ contextPath }/resources/images/user.png">
							</div>
							</c:if>
							<div class="comment_box">
		                        <div class="comment_nickName">
		                           ${ cm.nickName }
		                           <c:if test="${ cm.createDate != cm.modifyDate}">
		                              <span id="updated">수정됨</span>
		                           </c:if>
		                        </div>
		                        <div class="comment_text" id="contents">${ cm.c_content }</div>
		                        <div class="comment_date">
		                           ${ fn:split(cm.modifyDate, '.')[0] } &nbsp;
		                           <c:if test="${ sessionScope.loginUser != null }">
		                              <label id="reComment" class="rere">RE:</label>
		                           </c:if>
		                           &nbsp;&nbsp;
		                           <c:if test="${ loginUser.getId() != cm.member_id && loginUser != null}">
						                <c:url var="reportSendForm" value="sendReportForm.mn">
											<c:param name="memberId" value="${ loginUser.id }"/>
											<c:param name="suspect" value="${ cm.member_id }"/>
											<c:param name="reportCate" value="자유게시판<댓글>"/>
											<c:param name="path" value="boardDetail.bo?bNum=${ b.boardNum }"/>
											<c:param name="memberNick" value="${ loginUser.nickName }"/>
											<c:param name="suspectNick" value="${ cm.nickName }"/>
										</c:url>
									<a onclick="window.open('${ reportSendForm }', 'reportSendForm', 'width=450, height=450');" id="report_comment">신고</a>
		                           </c:if>
		                        </div>
		                     </div>
								
							<c:if test="${ loginUser.getId() == cm.member_id }">
								<form action="commentDelete.bo" method="post" style="float: right;" onsubmit="return commentDelete();">
									<input type="hidden" name="bNum" value="${ b.boardNum }">
									<input type="hidden" name="cNum" value="${ cm.c_num }">
									<input type="submit" id="commentD" value="삭제">
								</form>
								<form action="commentUpdate.bo" method="post" style="float: right;">
									<input type="hidden" name="bNum" value="${ b.boardNum }">
									<input type="hidden" name="cNum" value="${ cm.c_num }">										<input type="button" class="commentU" id="updateBtn" value="수정">
								</form>
									
								<!-- 수정을 위한 div -->
								<div class="commentWrite" id="replyDiv" style="display : none;">
									<div id="commentInfo">
										<div id="coco">${ sessionScope.loginUser.nickName }</div>
									</div>
									<form action="commentUpdate.bo" method="post">
										<input type="hidden" name="bNum" value="${ b.boardNum }">
										<input type="hidden" name="cNum" value="${ cm.c_num }">											<textarea name="c_content"></textarea>
										<input id="cSubmit" type="submit" value="수정">
										<input class="cCancel" id="updateCancel" type="button" value="취소">
									</form>
								</div>
							</c:if>
								
							<!-- 댓글 작정자가 아닌 사용자가 대댓을 달 경우 div 계산을 위해 만듬 -->
							<c:if test="${ loginUser.getId() != cm.member_id && loginUser != null}">
								<div style="display : none;"></div>
								<div style="display : none;"></div>
								<div style="display : none;"></div>
							</c:if>
							
							<!-- 대댓글을 위한 div -->
							<div class="commentWrite" id="rereplyDiv" style="display : none;">
								<div id="commentInfo">
									<div id="coco">${ sessionScope.loginUser.nickName }</div>
								</div>
								<form action="commentPluse.bo" method="post">
									<input type="hidden" name="bNum" value="${ b.boardNum }">
									<input type="hidden" name="cNum" value="${ cm.c_num }">
									<input type="hidden" name="c_level" value="${ cm.c_level + 1 }">
									<input type="hidden" name="member_id" value="${ loginUser.getId() }">
									<textarea name="c_content"></textarea>
									<input id="cSubmit" type="submit" value="등록">
									<input class="cCancel" id="updateCancel" type="button" value="취소">
								</form>
							</div>						
						</div>
					</c:forEach>
				</c:if>
				
				<c:if test="${ sessionScope.loginUser != null }">
					<!-- 일반 댓글 작성 div -->
					<div class="commentWrite" id="writeDiv">
						<div id="commentInfo">
							<div id="coco">${ sessionScope.loginUser.nickName }</div>
						</div>
						<form action="commentWrite.bo" method="post">
							<input type="hidden" name="b_num" value="${ b.boardNum }">
							<input type="hidden" name="member_id" value="${ loginUser.id }">
							<textarea id="commentWrite" name="c_content"></textarea>
							<input id="cSubmit" type="submit" value="등록">
						</form>
					</div>
				</c:if>	

				<br>

				<div style="padding-top: 20px;">
					<!-- 답글 작성 전송 폼 -->
					<c:if test="${ sessionScope.loginUser != null}">
						<form action="boardWriteForm.bo" method="post" name="bwrite" style="display: inline-block;">
							<input type="hidden" name="parentNum" value="${ b.boardNum }">
							<input type="hidden" name="boardLevel" value="${ b.boardLevel + 1 }">
							<button class="button1" type="button" id="Mbtn" onclick="submit();">답글</button>
						</form>
					</c:if>

					<c:if test="${ sessionScope.loginUser != null && sessionScope.loginUser.id == requestScope.b.memberId }">
						<form action="boardUpdateForm.bo" method="post" id="writerForm"  style="display: inline-block;">
							<input type="hidden" name="bNum" id="bnum" value="${ b.boardNum }">
							<button class="button1" type="submit" id="Mbtn">수정</button>
							<button class="button1" type="button" id="Dbtn" onclick="deleteBoard();">삭제</button>
						</form>
					</c:if>
					<br>
					
				</div>
				<button id="toList" onclick="location.href='boardList.bo'">
					<i class="fa fa-reply"> 뒤로가기</i> 
				</button>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>

	<script>
		function fileDown(a, num, name, path) {
			$.ajax({
				url: "boardFileDown.bo",
				type: "POST",
				data: {fileId:num},
				success: function(data) {
					if(data) {
						a.href = path;
						a.download = name;
						a.onclick = null;
						a.click();
						a.href = "javascript:void(0);";
						a.removeAttribute("download");
						a.onclick = function() {
							fileDown(a, num, name, path);
						};
					} else {
						alert("파일 다운 실패");
					}
				},
				error: function(data) {
					alert("error");
				}
			});
			return false;
		}
		
		function commentDelete() {
			if(confirm("정말 삭제하시겠습니까?")) {
				return true;
			} else {
				return false;
			}
		}
		
		function deleteBoard() { 
			if(confirm("정말 삭제하시겠습니까?")) {
				var form = document.getElementById("writerForm");
				var bnum = document.getElementById("bnum").value;
				form.setAttribute("bnum", bnum);
				form.setAttribute("action", "deleteBoard.do");
				form.submit();
			}
		}
		
		// 댓글 수정 div 생성
		$('.commentU').click(function(){
			$(this).parent().next().css("display","block");
		});		
		$('.cCancel').click(function(){
			$(this).parent().parent().css("display","none");
		});
		
		
		// 대댓글 div 생성
		$('.rere').click(function(){
			$(this).parent().parent().next().next().next().next().css("display","block"); //-->이건 자신이 쓴 댓글
// 			console.log($(this).parent().parent().next());  -->이건 타인이 쓴거	
		});
		
		$(function(){
			$('#toList').mouseenter(function(){
		    	$(this).css({'font-size':'27px', 'color':'black'});
		  	});
		  	$('#toList').mouseleave(function(){
		    	$(this).css({'font-size':'25px', 'color':'gray'});
		  	});
		  	$('#toList').click(function(){
		    	location.href= 'boardList.bo';
		  	});
		});

		function sendMessage() {
			window.open('', 'messageForm', 'width=580, height=690');
			document.sendmsg.submit();
		}
		
	</script>
</body>
</html>