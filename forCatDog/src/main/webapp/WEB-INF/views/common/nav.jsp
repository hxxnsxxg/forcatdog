<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nav</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/common/nav.css">
</head>
<body>
	<div id='nav'>
		<ul class='out'>
			<li class='in'>
				캣독정보
				<ul>					
					<li><a href='${ contextPath }/cat.cc'><span>CAT</span></a></li>
					<li><a href='${ contextPath }/dog.cc'><span>DOG</span></a></li>
				</ul>
			</li>
			<li class='in'>
				매칭
				<ul>
					<li><a href='${ contextPath }/findMatchList.mc?cate=1'><span>짝 찾기</span></a></li>
					<li><a href='${ contextPath }/findMatchList.mc?cate=2'><span>산책 메이트 찾기</span></a></li>
					<li><a href='${ contextPath }/findMatchList.mc?cate=3'><span>펫 시터 찾기</span></a></li>
				</ul>
			</li>
			<li class='nin'>
				<a href='${contextPath }/findHospital'><span>애견카페/병원찾기</span></a>
			</li>
			<li class='nin'>
				<a href='${ contextPath }/boardList.bo'><span>자유게시판</span></a>
			</li>
			<li class='in'>
				팔아요/나눔해요
				<ul>
					<li><a href='${ contextPath }/sell.ss'><span>팔아요</span></a></li>
					<li><a href='${ contextPath }/share.ss'><span>나눔해요</span></a></li>
				</ul>
			</li>
			<li class='menuline'></li>
		</ul>
	</div>
</body>
</html>