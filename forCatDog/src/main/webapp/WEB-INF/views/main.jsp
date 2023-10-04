<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포캣독</title>
<%@ include file="/resources/globalVariable.jsp" %>

<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/base.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/common/content.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/main.css">

<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"> -->
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="${ contextPath }/resources/js/main.js"></script>
</head>
<body>
   <div class="wrap">
      <%@ include file="/WEB-INF/views/common/header.jsp"%>
      <%@ include file="/WEB-INF/views/common/nav.jsp"%>

      <div id="content">
      
         <div class="banner controls">
            <div class="slider">
                <img alt="캣독" src="${ contextPath }/resources/images/bannerone.png">
                <img id="width"alt="캣독" src="${ contextPath }/resources/images/bannerthree.png">
                <img alt="캣독" src="${ contextPath }/resources/images/bannertwo.png">
             </div>
         </div>
         
         
         <div class='infodiv'>
            <div class="catdog_info">
               <h2 id="subtitle_catdog"><img src="${ contextPath }/resources/images/dog_info.png"><a href="dog.cc" class="align_right">more</a></h2>               
               <div class="each_catdog">
                  <c:forEach items="${ dogList }" var="d">
                     <c:url var="catdogDetail" value="catdogDetail.cc">
                        <c:param name="cdNum" value="${ d.cd_num }"/>
                     </c:url>
                     <div style="display:inline-block; cursor:pointer;" onclick="location.href='${ catdogDetail }'">
                        <img class="catdog_info_image" src="${ contextPath }/resources/catdogUploadFiles/${ d.fileList[0].changeFileName }">
                        <p>${ d.cd_name }</p>
                     </div>
                  </c:forEach>                  
               </div>               
               <br>
               <br>               
               <h2 id="subtitle_cat"><img src="${ contextPath }/resources/images/cat_info.png"><a href="cat.cc" class="align_right">more</a></h2>
               <div class="each_catdog">
                  <c:forEach items="${ catList }" var="c">
                     <c:url var="catdogDetail" value="catdogDetail.cc">
                        <c:param name="cdNum" value="${ c.cd_num }"/>
                     </c:url>
                     <div style="display:inline-block; cursor:pointer;" onclick="location.href='${ catdogDetail }'">
                        <img class="catdog_info_image" src="${ contextPath }/resources/catdogUploadFiles/${ c.fileList[0].changeFileName }">
                        <p>${ c.cd_name }</p>
                     </div>               
                  </c:forEach>   
               </div>   
            </div>
   
            <div class="notice_info">
               <div class="padding-area">
                  <br>
                  <br>
                  <h2 class="subtitle_notice">
                     <img src="${ contextPath }/resources/images/main_notice.png">
                     <a href="notice.cs" class="align_right">more</a>
                  </h2>
                  <table class="board_list">
                  <c:forEach var="n" items="${ noticeList }">
                     <c:url var="noticeDetail" value="mndetail.cs">
                        <c:param name="nNum" value="${ n.noticeNum }"/>
                     </c:url>
                     <tr class="notice">
                        <td class="align_left">
                           <div style="display:inline-block;" onclick="location.href='${ noticeDetail }'">${ n.noticeTitle }</div>
                        </td>
                        <td class="align_right"><fmt:formatDate value='${ n.createDate }' pattern="yyyy-MM-dd"/></td>
                     </tr>
                  </c:forEach>
                  </table>
               </div>
               <div class="side_a">
                  <div class="a">
                     <table style="width:280px; border: solid 1px #ccc; margin-left:35px; text-align:center;">
                        <tr>
                           <td>
                              <span id="title1" style="cursor:pointer;" onclick="layon('1')">짝찾기</span>
                           </td>
                           <td>
                              <span id="title2" style="cursor:pointer;" onclick="layon('2')">산책메이트</span>
                           </td>
                           <td>
                              <span id="title3" style="cursor:pointer;" onclick="layon('3')">펫시터</span>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="3">
                              <div id="layer01" style="display:block;"><img src="${ contextPath }/resources/images/layer01.png"></div>
                              <div id="layer02" style="display:none;"><img src="${ contextPath }/resources/images/layer02.png"></div>
                              <div id="layer03" style="display:none;"><img src="${ contextPath }/resources/images/layer03.png"></div>
                           </td>
                        </tr>
                     </table>
                  </div>
               </div>
               <div class="side_b" style="margin-left: 15px;">
                  <a href="${ contextPath }/findHospital"><img src="${ contextPath }/resources/images/mini_bn1.png"></a><br>
                  <a href="${ contextPath }/operation.cs"><img src="${ contextPath }/resources/images/mini_bn2.png"></a><br>
                  <a href="${ contextPath }/sell.ss"><img src="${ contextPath }/resources/images/mini_bn3.png"></a>
               </div>
            </div>
            

            <div class="margin_left">
               <div class="couple">
               <c:url var="catdogCMatchList" value="findMatchList.mc">
                   <c:param name="cate" value="1"/>
                </c:url> 
                  <h2><img src="${ contextPath }/resources/images/findcp.png"><a href="${ catdogCMatchList }" class="align_right">more</a></h2>
                  <div class="sliderWrap multipleWrap">
               		   <ul class="multiple_slider">
		                   	 <c:forEach items="${ requestScope.matchCList }" var="mc">
		                   		 <c:url var="findMatchDetail" value="findMatchDetail.mc">
			                           <c:param name="mcNum" value="${ mc.matchNum }"/>
		                         </c:url>
		                         <li>
				                     <div class="border_shape" onmousedown="location.href='${ findMatchDetail }'">
				                          <span class="post_thumbnail">
				                              <a href="${ findMatchDetail }"  class="trans_image">
				                                  <img src="${ contextPath }/resources/mpetUploadFiles/${ mc.petList[0].changeFileName }" alt="" onclick="location.href='${ findMatchDetail }'">
				                              </a>
				                          </span>
				                          <div class="post_title">
				                              <a href="${ findMatchDetail }">${ mc.matchTitle }</a>
				                          </div>
				                     </div>
			                     </li>
	                         </c:forEach>
		                </ul>        
                  </div>
                </div>
             </div>
             
             
            <div class="margin_left">
               <div class="couple">
               <c:url var="catdogWMatchList" value="findMatchList.mc">
                  <c:param name="cate" value="2"/>
               </c:url> 
                  <h2><img src="${ contextPath }/resources/images/findwk.png"><a href="${ catdogWMatchList }" class="align_right">more</a></h2>
                  <div class="sliderWrap multipleWrap">
             		   <ul class="multiple_slider">
		                  <c:forEach items="${ requestScope.matchWList }" var="mc">
<!-- 		                  <li> -->
		                     <div class="border_shape">
		                        <c:url var="findMatchDetail" value="findMatchDetail.mc">
		                           <c:param name="mcNum" value="${ mc.matchNum }"/>
		                        </c:url>
		                          <span class="post_thumbnail">
		                              <a href="${ findMatchDetail }" class="trans_image">
		                                  <img src="${ contextPath }/resources/mpetUploadFiles/${ mc.petList[0].changeFileName }" alt="" onclick="location.href='${ findMatchDetail }'">
		                              </a>
		                          </span>
		                          <div class="post_title">
		                              <a href="${ findMatchDetail }">${ mc.matchTitle }</a>
		                          </div>
		                      </div>
		                      </li>
		                   </c:forEach>
                  	 </ul>        
                  </div>
                </div>
             </div>
         </div>
      </div>

      <%@ include file="/WEB-INF/views/common/footer.jsp"%>
   </div>
   

   
</body>
</html>