<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
.error_h1 { 
margin: 28px 0 0; 
font-size: 24px; 
line-height: 32px; 
font-weight: 700; 
color: #000; 
text-align: center;
}
.area_btn{
margin-top:44px;
font-size:0;
line-height:0;
text-align: center;
}
.area_btn .link{
display:inline-block;
width:280px;height:48px;
border-radius:6px;
background-color:#323232;
font-size:15px;line-height:48px;
color:#fff;
font-weight:700;
text-align:center;
text-decoration:none
}
</style>
</head>
<body>
	<h1 class="error_h1">죄송합니다. 유효하지 않은 주소입니다.<br>
		404에러!!</h1>
	<div class="area_btn">
		<a href="javascript:history.back(-1)" class="link">이전 화면으로</a>
</div>
</body>
</html>