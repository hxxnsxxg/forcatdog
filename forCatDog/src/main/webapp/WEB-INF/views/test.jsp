<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>codeomni.tistory.com 모달 소스 코드</title>
        <link href="<%= request.getContextPath() %>/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
        <style>
        </style>
    </head>
    <body>    
        <button data-toggle="modal" data-target="#stopMember">
            모달 실행
        </button>
        <div class="modal fade" id="stopMember" role="dialog" aria-labelledby="introHeader" aria-hidden="true" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">공지 사항</h4>
                    </div>
                    <div class="modal-body">
                        <p>안녕하세요.</p>
                        <p>codeomni 입니다. 방문해주셔서 감사합니다. 궁금하신 사항이나 문의 사항은 방명록에 공개 또는 비공개로 남겨주세요.</p>
                        <p>블로그 주소는 http://codeomni.tistory.com/입니다.</p>
                    </div>
                    <div class="modal-footer">
                    	<button type="button" class="btn btn-primary">삭제하기</button>
       					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
                    </div>
                </div>
            </div>
        </div>
        <script src="<%= request.getContextPath() %>/resources/js/jquery-3.5.1.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/bootstrap/js/bootstrap.js"></script> 
    </body>
</html>