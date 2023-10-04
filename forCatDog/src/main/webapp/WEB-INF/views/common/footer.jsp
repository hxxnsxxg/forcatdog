<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/common/footer.css">
</head>
<body>
	<footer>
        <div class="container">
            <div class="sec aboutus">
                <h2>About us</h2>
                <p>
					기본적으로 다양한 종류의 반려동물에 대한 정보를 제공하고 다양한 만남과 돌봄이 필요한 경우를 위해서 매칭 서비스를 제공
				</p>

                <ul class="sci">
                    <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                    <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                    <li><a href="#"><i class="fab fa-youtube"></i></a></li>
                    <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                </ul>
            </div>
<!--             <div class="sec quickLinks"> -->
<!--                 <h2>Quick Links</h2> -->
<!--                 <ul> -->
<!--                     <li><a href="#">About</a></li> -->
<!--                     <li><a href="#">FAQ</a></li> -->
<!--                     <li><a href="#">Private Policy</a></li> -->
<%--                     <li><a href="${ contextPath }/notice.cs">Help</a></li> --%>
<!--                 </ul> -->
<!--             </div> -->

            <div class="sec contact">
                <h2>Contact Info</h2>
                <ul class="info">
                    <li>
                        <span><i class="fas fa-map-marker-alt"></i></span>
                        <span>서울시 강남구<br></span>
                        <span  class="margin_left2">역삼동</span><br>
                        <span class="margin_left2">포캣독</span>
                        
                    </li>
                    <li>
                        <span><i class="fas fa-phone-square-alt"></i></span>
                        <span><a href="tel:123456789">+1 234 567 8900</a><br>
                            <a href="tel:123456789" class="margin_pleft">+1 234 567 8900</a></span>
                    </li>
                    <li>
                        <span>
                            <i class="fas fa-envelope"></i></span>
                        <span><a href="malito:sjd@gmail.com">ForCatDog@gmail.com</a></span>
                    </li>
                </ul>
            </div>
            
<!-- 	        <div class="copyrightText"> -->
<!-- 	       		 <p>Team ForCatDog</p> -->
<!-- 	   		</div> -->
        </div>
    </footer>
    
</body>
</html>