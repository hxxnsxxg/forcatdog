<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<%@ include file="/resources/globalVariable.jsp" %>
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/manager/managerMain.css"> 
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/Mpaging3.css">
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
         
         <main>
            <br>
            <div id="notice_list">
               <h2 class="subtitle_notice">
                  <img src="${ contextPath }/resources/images/managerMain.PNG">
                  <a href="nWriteFrom.cs" class="align_right">+</a>
               </h2>
               <table class="board_list">
                  <thead>
                     <tr>
                        <th width="50px">번호</th>
                        <th width="280px">제목</th>
                        <th width="120px">등록된 날짜</th>
                     </tr>
                  </thead>
                  
                  <tbody>
                     <c:if test="${ requestScope.noticeList.size() <= 0 }">
                        <tr>
                           <th colspan="3">
                              등록된 공지사항이 없습니다.
                           <th>
                        </th>
                     </c:if>
                  
                     <c:forEach var="n" items="${ noticeList }">
                        <c:url var="noticeDetail" value="Mdetail.cs">
                           <c:param name="nNum" value="${ n.noticeNum }"/>
                        </c:url>
                        <tr class="notice">
                           <td>${ n.noticeNum }</td>
                           <td class="align_left">                              
                              <div style="display:inline-block; cursor:pointer;" onclick="location.href='${ noticeDetail }'">
                                 <div class="overflow">
                                    <span style="color:red; font-weight:bold;">[공지]</span>${ n.noticeTitle }
                                 </div>
                              </div>
                           <td><fmt:formatDate value='${ n.createDate }' pattern="yyyy-MM-dd"/></td>
                        </tr>
                     </c:forEach>
                  </tbody>
               </table>
               <div class="paging">
                  <c:if test="${ requestScope.noticeList.size() > 0 }">
                     <div class="pagingArea" align="center">
                        <c:if test="${ 1 >= pi1.startPage }">
                           <button class="border first"><i class="fas fa-chevron-left"></i></button>&nbsp;
                        </c:if>
                        <c:if test="${ 1 < pi1.startPage }">
                           <c:url var="before" value="${ loc }">
                              <c:param name="page1" value="${ pi1.startPage - 1 }"/>
                              <c:if test="${ requestScope.operationList.size() > 0 }">
                                 <c:param name="page2" value="${ pi2.currentPage }"/>
                              </c:if>
                           </c:url>
                           <button class="border pointer" onclick="location.href='${ before }'"><i class="fas fa-chevron-left"></i></button>&nbsp;
                        </c:if>
                        
                        <!-- 페이지 -->
                        <c:forEach var="p" begin="${ pi1.startPage }" end="${ pi1.endPage }">
                           <c:if test="${ p eq pi1.currentPage }">
                              <button class="num selected">${ p }</button>
                                    
                           </c:if>
                           
                           <c:if test="${ p ne pi1.currentPage }">
                              <c:url var="pagination" value="${ loc }">
                                 <c:param name="page1" value="${ p }"/>
                                 <c:if test="${ requestScope.operationList.size() > 0 }">
                                    <c:param name="page2" value="${ pi2.currentPage }"/>
                                 </c:if>
                              </c:url>
                              <button class="num pointer" onclick="location.href='${ pagination }'">${ p }</button>&nbsp;
                           </c:if>
                        </c:forEach>
                        
                        <!-- [다음] -->
                        <c:if test="${ pi1.maxPage <= pi1.endPage }">
                           <button class="border last"><i class="fas fa-chevron-right"></i></button>&nbsp;
                        </c:if>
                        <c:if test="${ pi1.maxPage > pi1.endPage }">
                           <c:url var="after" value="${ loc }">
                              <c:param name="page1" value="${ pi1.endPage + 1 }"/>
                              <c:if test="${ requestScope.operationList.size() > 0 }">
                                 <c:param name="page2" value="${ pi2.currentPage }"/>
                              </c:if>
                           </c:url> 
                           <button class="border pointer" onclick="location.href='${ after }'"><i class="fas fa-chevron-right"></i></button>&nbsp;
                        </c:if>
                        
                     </div>
                  </c:if>
               </div>
               
            </div>
            
            <div id="notice_list2">
               <h2 class="subtitle_notice">
                  <img src="${ contextPath }/resources/images/managerMain2.PNG">
                  <a href="operationWriteForm.cs" class="align_right">+</a>
               </h2>
               <table class="board_list">
                  <thead>
                     <tr>
                        <th width="50px">번호</th>
                        <th width="280px">제목</th>
                        <th width="120px">등록된 날짜</th>
                     </tr>
                  </thead>
                  
                  <tbody>
                     <c:if test="${ requestScope.operationList.size() <= 0 }">
                        <tr>
                           <th colspan="3">
                              등록된 이용안내가 없습니다.
                           </th>
                        </tr>
                     </c:if>
                     <c:forEach var="o" items="${ operationList }">   
                        <c:url var="operationDetail" value="MOdetail.cs">
                           <c:param name="opNum" value="${ o.opNum }"/>
                        </c:url>                                    
                        <tr class="notice">
                           <td>${ o.opNum }</td>
                           <td class="align_left">                              
                              <div style="display:inline-block; cursor:pointer;" onclick="location.href='${ operationDetail }'">
                                 <div class="overflow">
                                    <span style="color:red; font-weight:bold;">[안내]</span>${ o.title }
                                 </div>
                              </div>                        
                           </td>   
                           <td><fmt:formatDate value='${ o.createDate }' pattern="yyyy-MM-dd"/></td>
                        </tr>
                     </c:forEach>
                  </tbody>
               </table>
               <div class="paging">
                  <c:if test="${ requestScope.operationList.size() > 0 }">
                     <div class="pagingArea margin_left">
                        <c:if test="${ 1 >= pi2.startPage }">
                           <button class="border first"><i class="fas fa-chevron-left"></i></button>&nbsp;
                        </c:if>
                        <c:if test="${ 1 < pi2.startPage }">
                           <c:url var="before" value="${ loc }">
                              <c:if test="${ requestScope.noticeList.size() > 0 }">
                                 <c:param name="page1" value="${ pi1.currentPage }"/>
                              </c:if>
                              <c:param name="page2" value="${ pi2.startPage - 1 }"/>
                           </c:url>
                           <button class="border pointer" onclick="location.href='${ before }'"><i class="fas fa-chevron-left"></i></button>&nbsp;
                        </c:if>
                        
                        <!-- 페이지 -->
                        <c:forEach var="p" begin="${ pi2.startPage }" end="${ pi2.endPage }">
                           <c:if test="${ p eq pi1.currentPage }">
                              <button class="num selected">${ p }</button>
                                    
                           </c:if>
                           
                           <c:if test="${ p ne pi2.currentPage }">
                              <c:url var="pagination" value="${ loc }">
                                 <c:if test="${ requestScope.noticeList.size() > 0 }">
                                    <c:param name="page1" value="${ pi1.currentPage }"/>
                                 </c:if>
                                 <c:param name="page2" value="${ p }"/>
                              </c:url>
                              <button class="num pointer" onclick="location.href='${ pagination }'">${ p }</button>&nbsp;
                           </c:if>
                        </c:forEach>
                        
                        <!-- [다음] -->
                        <c:if test="${ pi2.maxPage <= pi2.endPage }">
                           <button class="border last"><i class="fas fa-chevron-right"></i></button>&nbsp;
                        </c:if>
                        <c:if test="${ pi2.maxPage > pi2.endPage }">
                           <c:url var="after" value="${ loc }">
                              <c:if test="${ requestScope.noticeList.size() > 0 }">
                                 <c:param name="page1" value="${ pi1.currentPage }"/>
                              </c:if>
                              <c:param name="page2" value="${ pi1.endPage + 1 }"/>
                           </c:url> 
                           <button class="border pointer" onclick="location.href='${ after }'"><i class="fas fa-chevron-right"></i></button>&nbsp;
                        </c:if>
                        
                     </div>
                  </c:if>
               </div>
            </div>
         </main>
      </div>
   </div>
   <script>
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

</body>
</html>