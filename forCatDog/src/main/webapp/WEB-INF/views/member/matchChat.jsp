<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forCatDog</title>
<%@ include file="/resources/globalVariable.jsp"%>
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/member/matchChat.css">

<link href="${ contextPath }/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<script src="${ contextPath }/resources/bootstrap/js/bootstrap.js"></script> 


<script src="${ contextPath }/resources/js/jquery.visible.js"></script>
</head>
<body>
    <div class="modal fade" id="successMatch" role="dialog" aria-labelledby="introHeader" aria-hidden="true" tabindex="-1">
       <div class="modal-dialog">
           <div class="modal-content">
               <div class="modal-header">
                   <h4 class="modal-title">매칭 완료</h4>
               </div>
               <div class="modal-body">
                   <p>매칭이 완료되었습니다.</p>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-primary" onclick="matchEnd();">확인</button>
               </div>
           </div>
       </div>
    </div>
    
   <div class="title">
      ${ member.nickName }
      
         <div class="buttonPanel">
            <c:if test="${ option == 'Y' }">
               <button type="button" id="endMatching" onclick="matchSuccess();">
                  <i class="far fa-calendar-times"></i> 매칭 종료
               </button>
            </c:if>
            <input type="button" id="closeBtn" value="닫기" onclick="self.close();">
         </div>
   </div>
   
   <div>
      <input type="hidden" id="sender" value="${ sessionScope.loginUser.id }"> 
      <input type="hidden" id="receiver" value="${ member.id }">
   </div>
   
   <div id="messagesBlock">
      <div id="messages">
         <c:forEach items="${ requestScope.chatList }" var="chat" varStatus="vs">
            <c:if test="${ vs.first }">
               <div class="date"><fmt:formatDate value="${ chat.chatDate }" pattern="yyyy년 MM월 dd일" /></div>
            </c:if>
            <c:if test="${ vs.index > 0 }">
               <fmt:parseDate var="tDate" value="${ chat.chatDate }" pattern="yyyy-MM-dd" />
               <c:if test="${ tDate != date }">
                  <div class="date">
                     <fmt:formatDate value="${ chat.chatDate }" pattern="yyyy년 MM월 dd일" />
                  </div>
               </c:if>
            </c:if>
            <fmt:parseDate var="date" value="${ chat.chatDate }" pattern="yyyy-MM-dd" />
            
            <fmt:parseDate var="pHHmm" value="${ fn:split(chatList[vs.index - 1].chatDate, '.')[0] }" pattern="yyyy-MM-dd HH:mm" />
            <fmt:parseDate var="tHHmm" value="${ fn:split(chat.chatDate, '.')[0] }" pattern="yyyy-MM-dd HH:mm" />
            <fmt:parseDate var="nHHmm" value="${ fn:split(chatList[vs.index + 1].chatDate, '.')[0] }" pattern="yyyy-MM-dd HH:mm" />
            
            <c:choose>
               <c:when test="${ chat.sendId != sessionScope.loginUser.id }">
                  <div class="msg">
                     <input type="hidden" name="chatNum" value="${ chat.chatNum }">
                     
                     
                     <c:if test="${ pHHmm != tHHmm || privMsg != chat.sendId }">
                        <c:if test="${ !empty member.changeFileName }">
                           <div class="profileArea">
                              <img class="profileImg" src="${ contextPath }/resources/mprofileUploadFiles/${ member.changeFileName }">
                           </div>
                        </c:if>
                        <c:if test="${ empty member.changeFileName }">
                           <div class="profileArea">
                              <img class="profileImg" src="${ contextPath }/resources/images/user.png">
                           </div>
                        </c:if>
                     </c:if>
                     <div class="msgBlock">
                        <c:choose>
                           <c:when test="${ pHHmm != tHHmm || privMsg != chat.sendId }">
                              <div class="userName">${ chat.sendNickName }</div>
                              <div class="message m1">${ fn:replace(chat.chatContent, ' ', "&nbsp;") }</div>
                           </c:when>
                           <c:otherwise>
                              <div class="message m1" style="margin-left: 55px;">${ fn:replace(chat.chatContent, ' ', "&nbsp;") }</div>
                           </c:otherwise>
                        </c:choose>
                        <div class="msgInfo">
                           <c:forEach items="${ chat.unReadId }" var="ch">
                              <input type="hidden" name="unReadId" value='${ ch }'>
                           </c:forEach>
                           <div class="readNum">${ chat.unReadId.size() > 0 ? chat.unReadId.size() : "" }</div>
                           <div class="msgTime"><fmt:formatDate value="${ chat.chatDate }" pattern="HH:mm" /></div>
                        </div>
                     </div>
                  </div>
               </c:when>
               <c:otherwise>
                  <div class="myMsg">
                     <input type="hidden" name="chatNum" value="${ chat.chatNum }">
                     
                     <div class="msgInfo">
                        <div class="readNum">${ chat.unReadId.size() > 0 ? chat.unReadId.size() : "" }</div>
                        <div class="msgTime"><fmt:formatDate value="${ chat.chatDate }" pattern="HH:mm" /></div>
                     </div>
                     <div class="message m2">${ fn:replace(chat.chatContent, ' ', "&nbsp;") }</div>
                  </div>
               </c:otherwise>
            </c:choose>
            
            <c:set var="privMsg" value="${ chat.sendId }"/>
         </c:forEach>
      </div>
   </div>
   

   <div id="inputBlock">
      <div id="alertBlock" onclick="scrollBottom();"><div id="alertMsg"></div></div>
      <input type="text" id="messageinput" maxlength="90">
      <button type="button" id="sendBtn" disabled onclick="send();">Send</button>
   </div>

   <script>
       window.resizeTo(490, 635);
       $(window).resize(function() {
          window.resizeTo(490, 635);
        });
       
       $(function() {
          openSocket();
          setTime();
          
          setTimeout(function() {
             readCheck();
          }, 100);
        });

        
        var ws;
        var messages = document.getElementById("messagesBlock");
        var message = document.getElementById("messages");
        var chatDate = '${ requestScope.chatList.size() > 0 ? requestScope.chatList.get(chatList.size() - 1).chatDate : '' }'.split(' ')[0];
      	var appendOption = '';
      
        var check = true;
        $('.msg').each(function(i, element) {
            var info = $(this).find('.msgInfo');
           if(info.children('.readNum').html() > 0) {
              info.children('input[name=unReadId]').each(function(i, element) {
                 if($(this).val() == '${ sessionScope.loginUser.id }') {
                     info.parents('.msg').before($('<div>').addClass('alt').html('여기까지 읽으셨습니다'));
                    var offset = info.offset();
                      $('#messagesBlock').animate({scrollTop : offset.top - 410}, 400);
                      check = false;
                  return false;
                  }
              });
              return check;
            }
        });
        if(check) {
           messages.scrollTop = messages.scrollHeight;
        }
        
        var sendBtn = document.getElementById("sendBtn");
        var messageInput = document.getElementById("messageinput");
        messageInput.onkeypress = function(e) {
         if(desableSend(e.srcElement.value)) {
            if(e.code == "Enter") {
               send();
            }
         }
        };

        messageInput.onkeydown = function(e) {
           desableSend(e.srcElement.value);
        };
        messageInput.onkeyup = function(e) {
           desableSend(e.srcElement.value);
        };

        function desableSend(value) {
           if(value.trim() != '') {
            sendBtn.disabled = false;
            return true;
         } else {
            sendBtn.disabled = true;
            return false;
         }
        }
        
        function openSocket(){
            if(ws !== undefined && ws.readyState !== WebSocket.CLOSED){
                return;
            }
            
            ws = new WebSocket("ws://" + window.location.host + "${ contextPath }/matchChat.do/${ matchNum }/${ sessionScope.loginUser.id }");
            
            ws.onopen = function(event){
                if(event.data === undefined) {
                    return;
                }
                
                writeResponse(event.data);
            };
            ws.onmessage = function(event){
                if(event.data == -1) {
                   opener.location.href = opener.location.href;
                    $('#successMatch').modal();
               return;
                }
                writeResponse(event.data);
            };
            ws.onclose = function(event){
                writeResponse(JSON.stringify({chatContent : "연결 종료"}));
                alert("연결이 끊어졌습니다.");
            }
        }
        

        function send(){
            var message = document.getElementById("messageinput");
            var sender = document.getElementById("sender").value;
            var receiver = document.getElementById("receiver").value;
            var data = JSON.stringify({matchNum: ${ matchNum }, chatContent : message.value, sendId : sender, receiveId : receiver});
            ws.send(data);
            message.value = "";
        }
        
        function closeSocket(){
            ws.close();
        }

        function writeResponse(msg){
           var data = JSON.parse(msg);
           
           if(Object.prototype.toString.call(data) == '[object Object]') {
              appendMessage(data);
              setTime();
           } else {
               if(data[0].sendId == null) {
                  for(var i in data) {
                  $("input[name=chatNum]").each(function() {
                     if($(this).val() == data[i].chatNum) {
                        $(this).parent().find('.msgInfo').children('.readNum').html(data[i].unReadId.length <= 0 ? '' : data[i].unReadId.length);
                        return false;
                     }
                  });
                  }
               } else {
                  for(var i in data) {
                       var n = parseInt(i) + 1;
                       var p = parseInt(i) - 1;
                  appendMessage(data[i], appendOption, data[n], data[p]);
                  }

                  var temp;
                  $('.date').each(function(i, element) {
                        if($(this).html() == temp) {
                           $(this).remove();
                           temp = $(this).html();
                       }
                        temp = $(this).html();
                  });
                  setTime();
               }
           }
        }

        var alertTimeout;
        var nextDate = '${ requestScope.chatList.size() > 0 ? requestScope.chatList.get(0).chatDate : '' }'.split(' ')[0];;
        var prevMsg;
        var nexthhmm;
        function appendMessage(data, option, prevData, nextData) {
               if(data.chatContent != undefined) {
                     data.chatContent = data.chatContent.replace(/ /gi, "&nbsp;");
               }
              var date = data.chatDate.split(' ')[0];
              var splitDate = date.split("-");

              if(option == undefined) {
               if(chatDate != date) {
                     var day = $('<div>').addClass('date').html(splitDate[0] + '년 ' + splitDate[1] + '월 ' + splitDate[2] + '일');
                     day.appendTo(message);
                  
                  chatDate = date;
               }
              }
            
              var time = data.chatDate.split(' ')[1].split(':');
              var hhmm = time[0] + ':' + time[1];
              var $msg = $('<div>');
              var $chatNum = $('<input>').attr({'type' : 'hidden', 'name' : 'chatNum'}).val(data.chatNum);
             $msg.append($chatNum);

             var $msgInfo = $('<div>').addClass('msgInfo');
             var $readCount = $('<div>').addClass('readNum').html(data.unReadId.length <= 0 ? '' : data.unReadId.length);
              var $time = $('<div>').addClass("msgTime").html(hhmm);
              var $message = $('<div>').html(data.chatContent);
              
             if(data.sendId == document.getElementById("sender").value) {
                $msg.addClass("myMsg");
                $msgInfo.addClass("appendM2");
                $message.addClass("message m2");
                $msgInfo.append($readCount);
                $msgInfo.append($time);
                
//                 if((chatDate == date && hhmm != nexthhmm || chatDate != date && hhmm == nexthhmm) || prevMsg != data.sendId) {
//                    $($('.msgInfo').get().reverse()).each(function(i, element) {
//                          if($(this).siblings('.m1').length > 0) {
//                         return false;
//                          }
//                          $(this).find('.msgTime').html('');
//                    });
//                 }
                $msg.append($msgInfo);
                $msg.append($message);
             } else {
                $msg.addClass("msg");
                $message.addClass("message m1");
                $msgInfo.addClass("appendM1");
                $msgInfo.append($readCount).append($time);

                if(option == undefined) {
                   if((chatDate == date && hhmm != nexthhmm || chatDate != date && hhmm == nexthhmm || chatDate != date && hhmm != nexthhmm) || prevMsg != data.sendId) {
                      var $profileArea = $('<div>').addClass('profileArea');
                     <c:if test="${ !empty member.changeFileName }">
                      var $profileImg = $('<img>').attr({"src" : "${ contextPath }/resources/mprofileUploadFiles/${ member.changeFileName }"});
                     </c:if>
                     <c:if test="${ empty member.changeFileName }">
                      var $profileImg = $('<img>').attr({"src" : "${ contextPath }/resources/images/user.png"});
                     </c:if>
                      $profileArea.append($profileImg);
                      $msg.append($profileArea);
                      var $msgBlock = $('<div>').addClass('msgBlock appendM1');
                      var $userName = $('<div>').addClass('userName').html(data.sendNickName);
                  
                      $msgBlock.append($userName);
                      $msgBlock.append($message);
                      $msgBlock.append($msgInfo);
                      
                      $msg.append($msgBlock);
                   } else {
//                       $($('.msg').get().reverse()).each(function(i, element) {
//                             $(this).find('.msgTime').html('');
//                             if($(this).find('.userName').length > 0) {
//                            return false;
//                             }
//                       });
                      $message.css("margin-left", "55px");
                       $msg.append($message);
                       $msg.append($msgInfo);
                   }

                    nexthhmm = hhmm;
                } else {
                  if(nextData == undefined) {
                      var nDate = $('.date').first().html().split(' ');
                      var nextTime = $(".msg").has('.msgTime').first().find('.msgTime').html().split(':');
                      
                      for(var i in nDate) {
                         nDate[i] = parseInt(nDate[i]);
                      }
                      for(var i in nextTime) {
                         nextTime[i] = parseInt(nextTime[i]);
                      }
                      var dateCheck = nDate[0] == splitDate[0] && nDate[1] == splitDate[1] && nDate[2] == splitDate[2];
                      var timeCheck = nextTime[0] == time[0] && nextTime[1] == time[1];
                      
                      if(!((dateCheck && !timeCheck || !dateCheck && timeCheck || !dateCheck && !timeCheck)) && $('#messages').children().not('.date').first().hasClass('msg')) {
                         $('.msg').first().children(".profileArea").remove();
                         $('.msg').first().children('.msgBlock').css("margin-left", "55px");
                         $('.msg').first().find(".userName").remove();
                      }
                   }

                   if(prevData != undefined) {
                      prevDate = prevData.chatDate.split(' ')[0];
                      time = prevData.chatDate.split(' ')[1].split(':');
                       nexthhmm = time[0] + ':' + time[1];
                      
                      if(((prevDate == date && hhmm != nexthhmm || prevDate != date && hhmm == nexthhmm || prevDate != date && hhmm != nexthhmm) || prevData.sendId != data.sendId)) {
                         var $profileArea = $('<div>').addClass('profileArea');
                        <c:if test="${ !empty member.changeFileName }">
                         var $profileImg = $('<img>').attr({"src" : "${ contextPath }/resources/mprofileUploadFiles/${ member.changeFileName }"});
                        </c:if>
                        <c:if test="${ empty member.changeFileName }">
                         var $profileImg = $('<img>').attr({"src" : "${ contextPath }/resources/images/user.png"});
                        </c:if>
                         $profileArea.append($profileImg);
                         $msg.append($profileArea);
                         var $msgBlock = $('<div>').addClass('msgBlock appendM1');
                         var $userName = $('<div>').addClass('userName').html(data.sendNickName);
                     
                         $msgBlock.append($userName);
                         $msgBlock.append($message);
                         $msgBlock.append($msgInfo);
                         
                         $msg.append($msgBlock);
                      } else {
                          $message.css("margin-left", "55px");
                          $msg.append($message);
                          $msg.append($msgInfo);
                      }
                   } else {
                      var $profileArea = $('<div>').addClass('profileArea');
                      <c:if test="${ !empty member.changeFileName }">
                      var $profileImg = $('<img>').attr({"src" : "${ contextPath }/resources/mprofileUploadFiles/${ member.changeFileName }"});
                      </c:if>
                      <c:if test="${ empty member.changeFileName }">
                      var $profileImg = $('<img>').attr({"src" : "${ contextPath }/resources/images/user.png"});
                      </c:if>
                      $profileArea.append($profileImg);
                      $msg.append($profileArea);
                      var $msgBlock = $('<div>').addClass('msgBlock appendM1');
                      var $userName = $('<div>').addClass('userName').html(data.sendNickName);
                  
                      $msgBlock.append($userName);
                      $msgBlock.append($message);
                      $msgBlock.append($msgInfo);
                      
                      $msg.append($msgBlock);
                   }

                    nexthhmm = hhmm;
                }

             }
             prevMsg = data.sendId;
            if(option == undefined) {
               
                  var scrollTop = $('#messagesBlock').scrollTop();
                 var innerHeight = $('#messagesBlock').innerHeight();
                 var scrollHeight = $('#messagesBlock').prop('scrollHeight');

                 if (scrollTop + innerHeight >= scrollHeight) {
                  $msg.appendTo(message);
                     messages.scrollTop = messages.scrollHeight;
                     
                     var sendId = document.getElementById("sender").value;
                        var receiver = document.getElementById("receiver").value;
                        ws.send(JSON.stringify({ matchNum: ${ matchNum }, sendId : sendId, receiveId : receiver, chatNum : data.chatNum }));
                 } else {
                    if(data.sendId == '${ sessionScope.loginUser.id }'){
                     $msg.appendTo(message);
                       messages.scrollTop = messages.scrollHeight;
                    } else {
                       $('#alertMsg').html(data.chatContent).parent().css("display", "block");
                       
                     clearTimeout(alertTimeout);
                     alertTimeout = setTimeout(function() {
                        $('#alertBlock').css("display", "none");
                     }, 3000);
                     $msg.appendTo(message);
                    }
                }

            } else if(option == 'f') {
               
               if(nextDate != date) {
                  var nextDateSplit = nextDate.split('-');
                  var day = $('<div>').addClass('date').html(nextDateSplit[0] + '년 ' + nextDateSplit[1] + '월 ' + nextDateSplit[2] + '일');
                  day.prependTo(message);
                  
                  $msg.prependTo(message);
               } else if(prevData == undefined) {
                  var nextDateSplit = nextDate.split('-');
                  var day = $('<div>').addClass('date').html(nextDateSplit[0] + '년 ' + nextDateSplit[1] + '월 ' + nextDateSplit[2] + '일');
                  
                  $msg.prependTo(message);
                  day.prependTo(message);
               } else {
                  $msg.prependTo(message);
               }

               nextDate = date;

            }
        }
       
        $(function() {
            $(window).on("beforeunload",function(){
                closeSocket();
                 return;
             });
                 
           $('#messagesBlock').on('mousewheel scroll', function() {
              var scrollTop = $(this).scrollTop();
//                var innerHeight = $(this).innerHeight();
//                var scrollHeight = $(this).prop('scrollHeight');
               
               if(scrollTop <= 0) {
                  $(this).scrollTop(2);
                  var chatNum = $('input[name=chatNum]').first().val();
                     var sendId = document.getElementById("sender").value;
                     var receiver = document.getElementById("receiver").value;
                    appendOption = 'f';
                    ws.send(JSON.stringify({ matchNum: ${ matchNum }, sendId : sendId, receiveId : receiver, chatNum : chatNum, append : appendOption }));
              }

//                if (scrollTop + innerHeight >= scrollHeight) {
//                   var chatNum = $('input[name=chatNum]').last().val();
//                      var sendId = document.getElementById("sender").value;
//                      var receiver = document.getElementById("receiver").value;
//                      appendOption = 'l';
//                     ws.send(JSON.stringify({ matchNum: ${ matchNum }, sendId : sendId, receiveId : receiver, chatNum : chatNum, append : appendOption }));
//                 }
              
              readCheck();
              
           });
        });

        function readCheck() {
           $('.msg').each(function(i, element) {
              if($(this).visible(false, false, 'vertical', $('#messagesBlock'))) {
                     var chatNum = $(this).children("input[name=chatNum]").val();
                     var sendId = document.getElementById("sender").value;
                     var receiver = document.getElementById("receiver").value;
                     if($(this).find('.msgInfo').children('.readNum').html() != '') {
                        ws.send(JSON.stringify({ matchNum: ${ matchNum }, sendId : sendId, receiveId : receiver, chatNum : chatNum }));
                     }
                  }
           });
        }

        function scrollBottom() {
           $('#alertBlock').css("display", "none");
           $('#messagesBlock').animate({scrollTop : messages.scrollHeight}, 400);
        }
        
        function setTime() {
           $('.msg').each(function(i, element) {
            if($(this).next().hasClass('msg') && $(this).find('.msgTime').html() == $(this).nextAll().has('.msgTime').first().find('.msgTime').html()){
               $(this).find('.msgTime').remove();
         }
          });
          $('.myMsg').each(function(i, element) {
            if($(this).next().hasClass('myMsg') && $(this).find('.msgTime').html() == $(this).nextAll().has('.msgTime').first().find('.msgTime').html()){
               $(this).find('.msgTime').remove();
            }
          });
        }

        function matchSuccess() {
            if(confirm("매칭을 종료하시겠습니까?")) {
            $.ajax({
               url: "matchSuccess.me",
               type: "post",
               contentType: "application/json",
               data: JSON.stringify({ matchNum : ${ matchNum }, memberId : '${ member.id }' }),
               success: function(data) {
                  if(data) {
                     ws.send(JSON.stringify({ append : 's' }));
                  } else {
                     alert("오류가 발생하였습니다. 다시 시도해주세요.");
                  }
               }
            });
            }
        }

        function matchEnd() {
            self.close();
        }

  </script>
</body>
</html>