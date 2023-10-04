<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/manager/sendReportForm.css?after">
<%@ include file="/resources/globalVariable.jsp"%>
</head>
<body>
	<div class="container">
		<h2><img src="${ contextPath }/resources/images/reportIcon.png"></h2>
		<input type="hidden" id="reportCate" value="${ report.reportCate }">
		<input type="hidden" id="memberId" value="${ report.memberId }">
		<input type="hidden" id="suspect" value="${ report.suspect }">
		<input type="hidden" id="path" value="${ report.path }">
			<table>
				<tr>
					<td class="title">신고 게시판</td>
					<td class="body">${ report.reportCate }</td>
				</tr>
				<tr>
					<td class="title">신고자</td>
					<td class="body">${ report.memberNick }</td>
				</tr>
				<tr>
					<td class="title">신고회원</td>
					<td class="body">${ report.suspectNick }</td>
				</tr>
				<tr>
					<td class="title">신고내용</td>
					<td class="body"><textarea rows="6" cols="41" id="content"></textarea></td>
				</tr>
			</table>
			
			<br>
			
			<input type="button" class="btn" onclick="check();" value="보내기"> <input type="button" class="btnc" onclick="window.close()" value="취소">
	</div>
	<script>
		function check(){
			var url = "sendReport.mn";
			var reportCate = $('#reportCate').val();
			var memberId = $('#memberId').val();
			var suspect = $('#suspect').val();
			var path = $('#path').val();
			var content = $('#content').val();
			
			if($('#content') == '') {
				alert("내용을 입력해주세요.");
				('#content').focus();
			} else {
				$.ajax({
					url : url,
					type : 'POST',
					traditional : true,
					data : {
						reportCate : reportCate,
						memberId : memberId,
						suspect : suspect,
						path : path,
						content : content
					},
					success: function(suc){
						if(suc = 1) {
							alert('신고가 완료 되었습니다.');
							window.close();
						} else {
							alert('신고에 실패하였습니다.');
							window.close();
						}
					}
				});
			}
		}
	</script>
</body>
</html>