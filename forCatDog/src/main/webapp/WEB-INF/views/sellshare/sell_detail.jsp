<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포캣독</title>
<%@ include file="/resources/globalVariable.jsp" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/common/base.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/sellshare/selldetail.css?after">


</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<%@ include file="/WEB-INF/views/common/nav.jsp" %>
		
		<div id='content'>
			<div class="s_detail">
				<div id="detail_area">
					<div id="title_area">
						[${ ss.category }] ${ ss.pdTitle }
	           		</div>
	           		
	           		<br>
	           		
	           		<div id="infoBar">
	           			<c:if test="${ !empty ss.memberProfile }">
							<div id="profile">
								<img src="${ contextPath }/resources/mprofileUploadFiles/${ ss.memberProfile }">
							</div>
						</c:if>
						<c:if test="${ empty ss.memberProfile }">
							<div id="profile">
								<img src="${ contextPath }/resources/images/user.png">
							</div>
						</c:if>
	           			<div id="profile_area">
		           			<div id="nickName">${ ss.nickName }</div>
		           			<form action="sendMessageForm.ms" name="sendmsg" target="messageForm" method="post">
			                	<input type="hidden" name="userId" value="${ ss.memberId }">
			                	<input type="hidden" name="nickName" value="${ ss.nickName }">
		                   	</form>
		                   	<c:if test="${ sessionScope.loginUser != null }">
		                    <button id="sendmsg" type="button" onclick="sendMessage();">
								<i class="fa fa-paper-plane fa-2x"></i>
							</button>
							</c:if>
							<br>
		           			<div id="date">
		           				등록된 날짜: <fmt:formatDate value="${ ss.createDate }" pattern="yyyy-MM-dd HH:mm"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 조회수 : ${ ss.views }
		           			</div>
	           			</div>
	           		</div>
	           		
	           		<br><hr><br>    
	           		     
	           		<div id="image_area">
		           		<c:forEach items="${ ss.fileList }" var="sfn" begin="0" end="0">
							<img id="mainImage" src="${ contextPath }/resources/sellshareUploadFiles/${ sfn.changeFileName }">
						</c:forEach>
	           			<div id="explain_area">
	           				<br>
		           			<label>지역</label>&nbsp;&nbsp;${ ss.addr1 } ${ ss.addr2 } ${ ss.addr3 } <br>	
		           			<label>품명</label>&nbsp;&nbsp;${ ss.productName }<br>
		           			<label>가격</label>&nbsp;&nbsp;<fmt:formatNumber type="number" value="${ ss.price }" pattern="#,###,###"/>원<br>
	           			</div>
	           		</div>
	           		
	           		<br><br>
	           		
	           		<h2 id="h2">추가 사진</h2>	
		           	<div id="image_1">
		           		<br><br>	       
		           		<c:forEach items="${ ss.fileList }" var="sfn">
							<img id="picture" src="${ contextPath }/resources/sellshareUploadFiles/${ sfn.changeFileName }">
						</c:forEach>
		           	</div>	
				</div>
				
				<div id="explain_area1">
		           	<label>상세 내용</label>
		           	<br><br>
		           	<div id="explain_detail">
		           		<%
							pageContext.setAttribute("newLineChar", "\r\n");
						%>
						${ fn:replace(ss.pdContent, newLineChar, "<br>") }
		           	</div>
		           	<div class="button_area">
		           		<c:url var="reportSendForm" value="sendReportForm.mn">
							<c:param name="memberId" value="${ loginUser.id }"/>
							<c:param name="suspect" value="${ ss.memberId }"/>
							<c:param name="reportCate" value="팔아요<게시글>"/>
							<c:param name="path" value="sellDetail.ss?ssNum=${ ss.productNum }"/>
							<c:param name="memberNick" value="${ loginUser.nickName }"/>
							<c:param name="suspectNick" value="${ ss.nickName }"/>
						</c:url>
						<c:if test="${ loginUser != null}">
							<c:if test="${ loginUser.getId() != ss.memberId }">
								<a onclick="window.open('${ reportSendForm }', 'reportSendForm', 'width=450, height=450');" class="reportBtn">신고</a>
		        			</c:if>	
		        		</c:if>	
		        	</div>
		        </div>
		       
		     	<br><hr><br>
	     	
		        <c:if test="${ cList.size() > 0 }">
			        <h3>댓글</h3>
					<br> 
					<c:forEach items="${ cList }" var="cm">		
					<!-- 프로필 사진 불러오는 영역 -->
					<div class="comment_area" name="mainCommentDiv">
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
				               <c:if test="${ cm.createDate != cm.modifyDate }">
				               		<span id="updated">수정됨</span>
				                </c:if>
			                </div>
			                <div class="comment_text" id="contents">${ cm.c_content }</div>
			                <div class="comment_date">
			                           <fmt:formatDate value="${ cm.modifyDate }" pattern="yyyy-MM-dd HH:mm"/> &nbsp;
			                           <c:if test="${ sessionScope.loginUser != null }">
			                              <label id="reComment" class="rere">RE:</label>
			                           </c:if>
			                           &nbsp;&nbsp;
			                           <c:if test="${ loginUser.getId() != cm.member_id && loginUser != null}">
							                <c:url var="reportSendForm" value="sendReportForm.mn">
												<c:param name="memberId" value="${ loginUser.id }"/>
												<c:param name="suspect" value="${ cm.member_id }"/>
												<c:param name="reportCate" value="팔아요<댓글>"/>
												<c:param name="path" value="sellDetail.ss?ssNum=${ ss.productNum }"/>
												<c:param name="memberNick" value="${ loginUser.nickName }"/>
												<c:param name="suspectNick" value="${ cm.nickName }"/>
											</c:url>
										<a onclick="window.open('${ reportSendForm }', 'reportSendForm', 'width=450, height=450');" id="report_comment">신고</a>
			                           </c:if>
			                        </div>
			                     </div>
										
						<c:if test="${ loginUser.getId() == cm.member_id}">
							<form action="commentDelete.ss" method="post" style="float: right;" onsubmit="return commentDelete();">
								<input type="hidden" name="cate" value="se">
								<input type="hidden" name="sNum" value="${ ss.productNum }">
								<input type="hidden" name="cNum" value="${ cm.c_num }">
								<input type="submit" id="commentD" value="삭제">
							</form>
							<form action="commentUpdate.ss" method="post" style="float: right;">
								<input type="hidden" name="sNum" value="${ ss.productNum }">
								<input type="hidden" name="cNum" value="${ cm.c_num }">										
								<input type="button" class="commentU" id="updateBtn" value="수정">
							</form>
											
							<!-- 수정을 위한 div -->
							<div class="commentWrite" id="replyDiv" style="display : none;">
								<div id="commentInfo">
									<div id="coco">${ sessionScope.loginUser.nickName }</div>
								</div>
								<form action="sCommentUpdate.ss" method="post">
									<input type="hidden" name="cate" value="se">
									<input type="hidden" name="sNum" value="${ ss.productNum }">
									<input type="hidden" name="cNum" value="${ cm.c_num }">											
									<textarea name="c_content"></textarea>
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
							<form action="sCommentPluse.ss" method="post">
								<input type="hidden" name="cate" value="se">
								<input type="hidden" name="sNum" value="${ ss.productNum }">
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
						<form action="CommentWrite.ss" method="post">
							<input type="hidden" name="cate" value="se">
							<input type="hidden" name="sNum" value="${ ss.productNum }">
							<input type="hidden" name="member_id" value="${ loginUser.id }">
							<textarea id="commentWrite" name="c_content"></textarea>
							<input id="cSubmit" type="submit" value="등록">
						</form>
					</div>
				</c:if>

				<br>
     		
	     		 <c:if test="${ sessionScope.loginUser != null && sessionScope.loginUser.id == requestScope.ss.memberId }">
					<form action="sellshareUpdateForm.ss" id="udForm" method="post">
						<input type="hidden" id="ss_num" name="ssNum" value="${ ss.productNum }">
						<button id="Mbtn" type="submit">
							<i class="fa fa-edit"></i>수정
						</button>
						<button id="Dbtn" type="button" id="Dbtn" onclick="deleteProduct();">
							<i class="fa fa-times"></i>삭제
						</button>
					</form>
				</c:if>	 	
		        <button id="toList">
					<i class="fa fa-reply"> 뒤로가기</i> 
				</button>
			</div>
		</div>
	   <%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>	
	
	<script>
		function deleteProduct() { 
			if(confirm("정말 삭제하시겠습니까?")) {
				var form = document.getElementById("udForm");
				var ssNum = document.getElementById("ss_num").value;
				form.setAttribute("ssNum", ssNum);
				form.setAttribute("action", "sellDelete.ss");
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
	// 		console.log($(this).parent().parent().next());  -->이건 타인이 쓴거	
		});
			
		// 대댓글 들여쓰기
		$(function(){
			var count = $('.inline').show().length;
			var rereply = $('.inline').show().next();
			
			for(var i = 0; i < count; i++) {
				rereply.css("margin-left", "3%");
			}				
		});
		
		$(function(){
			$('#toList').mouseenter(function(){
		    	$(this).css({'font-size':'27px', 'color':'black'});
		  	});
		  	$('#toList').mouseleave(function(){
		    	$(this).css({'font-size':'25px', 'color':'gray'});
		  	});
		  	$('#toList').click(function(){
		    	location.href= 'sell.ss';
		  	});
		});

		function sendMessage() {
			window.open('', 'messageForm', 'width=580, height=690');
			document.sendmsg.submit();
		}
	</script>	
</body>
</html>