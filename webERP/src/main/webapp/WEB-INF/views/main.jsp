<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>
<%
  request.setCharacterEncoding("UTF-8");
%>    
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<style>
#contents{
            position: absolute;
            left: 15%;
            top: 15%;
            width: 85%;
            height: 80%;
            border: 1px solid black;
            z-index: 1;
        }
	.main{
	position: absolute;
            width: 100%;
            height: 100%;
            left: -10px;
            }
        
</style>
<head>
  <meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
  <title>메인 페이지</title>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<container id="contents">
   		<p><img src="${contextPath }/resources/img/main_.png" class="main"/></p>
   </container>
</body>
</html>