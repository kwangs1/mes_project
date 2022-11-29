<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%> 
<%
	String inputNo = (String)request.getAttribute("inputNo");
	
%>
<% String parent = request.getParameter("custCode");%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!--<c:forEach var="cust" items="${estList}"> 
	<c:set var="code" value="${cust.custCode}"/>
</c:forEach>
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        #contents2{
            position: absolute;
            left: 15%;
            top: 25%;
            width: 85%;
            height: 70%;
            border: 1px solid black;
            z-index: 1;
        }
         .con1_search{
            padding:0;
            text-align: center;
            position: absolute;
            top: 25%;
            left: 18%;
        }
        #view1{
            width: 100%;
            text-align: center;
            border: 1px solid black;
        }
        #total{
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            text-align: center;
        }
        #total input{

            width: 7.7%;
            text-align: justify;
            border-style: none;
            background-color: rgb(223, 223, 223);
            
        }
        #total td{
            margin: 0;
            padding: 0;
        }
        #view1 td:not(#non){
            width: 8%;
        }
        #view1 td input{
            width: 100%;
        }
        #reqInput {
            background-color: rgb(255, 255, 149);
            text-align: center;
        }
</style>
</head>
<body>
        <container2 id= contents2>
            <table id="view1">
                <thead>
                    <td id="non"><input type="checkbox" name="content" onclick="selectAll(this)"/></td>
                    <td>견적번호</td>
                    <td>견적일자</td>
                    <td>고객명</td>
                    <td>부가세 구분</td>
                    <td>품번</td>
                    <td>품명</td>
                    <td>단위</td>
                    <td>견적수량</td>
                    <td>단가</td>
                    <td>공급가</td>
                    <td>부가세</td>
                    <td>합계액</td>
                </thead>
            <!-- <c:forEach var="cust" items="${estList}" varStatus="status" > 
    	            <tbody>
                    <td  class="ch" style="width: 5%;"><input type="checkbox" name="content"/></td>
                    <td><input type="text" value="${cust.estCode}"readonly/></td>
                    <td><input type="text" value="${cust.estDate}" readonly/></td>
                    <td><input type="text" value="${cust.custCode}" readonly/></td>
                    <td><input type="text" value="${cust.tax}" readonly/></td>
                    <td><input type="text" value="${cust.corVO.item_code}" readonly/></td>
                    <td><input type="text" value="${cust.corVO.item_name}" readonly/></td>
                    <td><input type="text" value="${cust.corVO.unit}" readonly/></td>
                    <td><input type="text" value="${cust.corVO.orderQuant}" readonly/></td>
                    <td><input type="text" value="${cust.corVO.price}" readonly/></td>                    
                    <td><input type="text" value="${cust.corVO.orderQuant*cust.corVO.price}" readonly/></td>
                    <td><input type="text" value="${(cust.corVO.orderQuant*cust.corVO.price)*01}" readonly/></td>
                    <td><input type="text" value="${cust.corVO.orderQuant*cust.corVO.price}" readonly/></td>
                 
	                </tbody>
                   </c:forEach>-->
               
            </table>
            <div id="total">
                <td>견적합계:</td>
                <td>&nbsp;<input type="text" disabled/></td>
                <td>견적수량 총합: </td>
                <td>&nbsp;<input type="text" disabled/></td>
                <td>공급가 총액: </td>
                <td>&nbsp;<input type="text" disabled/></td>
                <td>부가세 총합: </td>
                <td>&nbsp;<input type="text" disabled/></td>
                <td>합계액: </td>
                <td>&nbsp;<input type="text" disabled/></td>
            </div>
        </container2>
</body>
</html>