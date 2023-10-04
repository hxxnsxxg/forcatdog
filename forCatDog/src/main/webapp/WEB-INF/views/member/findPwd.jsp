<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/member/findPwd.css">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
   <div id='content' align="center">
      <div id="container">
         <form method="post" action="findPwd.me" onsubmit="return checkIt();">
         <table>
            <tr id="theader">
               <td align="center" colspan="2">
               <img src="<%= request.getContextPath() %>/resources/images/findpwd.png"><br><hr width="500">
               </td>
            </tr>
            <tr>
               <td>
                  아이디 :
               </td>
               <td>
                  <input type="text" id="name" class="input" name="id">
               </td>
            </tr>
            <tr>
               <td>
                  비밀번호 힌트 : 
               </td>
               <td>
                  <select class="input" name="pwHintNo">
                     <c:forEach items="${ requestScope.pwHint }" var="hint">
                        <option value="${ hint.PW_HINT_NUM }">${ hint.PW_HINT }</option>
                     </c:forEach>
                  </select>
               </td>
            </tr>
            <tr>
               <td>
                  비밀번호 힌트 답 :
               </td>
               <td>
                  <input type="text" id="hintans" class="input" name="pwHintAns">
               </td>
            </tr>
            <tr id="tfooter">
               <td align="center" colspan="2">
                  <input type="submit" value="비밀번호 찾기" id="findId" class="button"> <input type="button" value="돌아가기" class="button" id="cancel"  onclick="window.close();">
               </td>
            </tr>
         </table>
      </div>
   </div>
   
   <script>
   function checkIt(){
      var name = $('#name').val();
      var hintans = $('#hintans').val();
      
      if(name == ""){
         alert("이름을 입력해주세요.");
         $('#name').focus();
         return false;
      }
      
      if(hintans == ""){
         alert("힌트 답을 입력해주세요.");
         $('#hintans').focus();
         return false;
      }
   }
   </script>
   
</body>
</html>