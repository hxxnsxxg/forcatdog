<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<%@ include file="/resources/globalVariable.jsp" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/common/base.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/common/content.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/member/testApply.css">

</head>
<body>
   <div class="wrap">
      <%@ include file="/WEB-INF/views/common/header.jsp" %>
      <%@ include file="/WEB-INF/views/common/nav.jsp" %>
      
      <div id='content'>
         <div class='paddingdiv'>
            <h1>펫시터 자격 응시</h1>
            
            <div class='paddingdiv'>
               <div class='block'>
                  <h2>응시정보</h2>
                  
                  <hr>
                  
                  <div class="notice">- 총 9문제 (상, 중, 하 3문제씩) 입니다.</div>
                  <div class="notice">- 제한시간은 총 10분입니다.</div>
                  <div class="notice">- 응시료는 5000원 입니다.</div>
                  <div class="notice">- 응시료 결제 후 바로 시험이 시작됩니다.</div>
                  <div class="notice">- 제출 후, 결과를 바로 확인하실 수 있습니다.</div>
               </div>
               
               <div class='block'>
                  <h2>문제구성</h2>
                  
                  <hr>
                  
                  <div class="notice">- 개 / 고양이로 분류 구분</div>
                  <div class="notice">- 펫시터의 기본적인 자질을 평가</div>
                  <div class="notice">- 펫시터의 기본적인 상식 평가</div>
               </div>
               
               <div class='block'>
                  <h2>주요내용</h2>
                  
                  <hr>
                  
                  <div class="notice">- 펫시터에 대한 기초적인 내용</div>
                  <div class="notice">- 펫시터의 개념 및 활동시 주의할점</div>
                  <div class="notice">- 펫시터 활동 위한 애견 행동의 이해</div>
               </div>
               
               <div class='block'>
                  <form name="newWin">
                           <span style="color: orange;">
                              <i class="fa fa-credit-card fa-2x"></i>
                           </span>
                           <input type="button" id="obj" value="응시료 결제" onclick="goTest();">
                     </form>
               </div>
            </div>
            
         </div>
      </div>
      
      <script>      
         function goTest() { 
            window.open('', 'goingTestForm', 'width=650, height=450');
            var frm = document.newWin;
            frm.action = 'testConfirm.me';
            frm.target = "goingTestForm";
            frm.method = "post";
            
            frm.submit();
         }
         
         $(function(){
            $('#obj').mouseenter(function(){
                $(this).css('color','black');
              });
              $('#obj').mouseleave(function(){
                $(this).css('color','gray');
              });
         });
      </script>
      
      <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   </div>
</body>
</html>