<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>    


<html>
<head>
<meta charset=UTF-8">
<title>회원 정보 출력창</title>
</head>
<body>
<table border="1"  align="center"  width="80%">
    <tr align="center"   bgcolor="lightgreen">
      <td ><b>아이디</b></td>
      <td><b>비밀번호</b></td>
      <td><b>이름</b></td>
      <td><b>이메일</b></td>
      <td><b>가입일</b></td>
      <td><b>삭제</b></td>
   </tr>
   
 <c:forEach var="itemview" items="${allItemsList}" >     
   <tr align="center">
      <td>${itemview.item_code}</td>
      <td>${itemview.item_name}</td>
      <td>${itemview.standard}</td>
      <td>${itemview.inventory_unit}</td>
      <td>${itemview.inspection_status}</td>
      <td><a href="${contextPath}/itemview/removeItem.do?item_code=${itemview.item_code}">삭제하기</a></td>
    </tr>
  </c:forEach>   
</table>
<a  href="${contextPath}/member/itemviewForm.do"><h1 style="text-align:center">회원가입</h1></a>
</body>
</html>
