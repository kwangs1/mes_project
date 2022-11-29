<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>    
<% 
	String general_Customer_Code = request.getParameter("general_Customer_Code");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수주 현황</title>
<style>
        #contents2{
            position: absolute;
            right: 0;
            top: 25%;
            width: 85%;
            height: 65%;
            border: 1px solid black;
            z-index: 1;
            overflow-x: scroll;
        }
        #contents3{
            position: absolute;
            right: 0;
            top: 90%;
            width: 85%;
            height: 5%;
            border: 1px solid black;
        }
        .con1_search{
            padding:0;
            text-align: center;
            position: absolute;
            top: 25%;
            left: 15%;
        }
        .con1_search{
            padding:0;
            text-align: center;
            position: absolute;
            top: 25%;
            left: 15%;
        }
        #view1{
            width: 100%;
            text-align: center;
            border: 1px solid black;
        }
        #contents2 div{
            position: absolute;
            right: 0;
            bottom: 0;
        }
</style>
</head>
<body>
        <container2 id= contents2>
            <table id="view1">
                <tr>
                    <th><input type="checkbox" name="content"/></th>
                    <th>주문번호</th>
                    <th>주문일자</th>
                    <th>고   객</th>
                    <th>품   번</th>
                    <th>품   명</th>
                    <th>단   위</th>
                    <th>수   량</th>
                    <th>단   가</th>
                    <th>공 급 가</th>
                    <th>부 가 세</th>
                    <th>합 계 액</th>
                    <th>납 기 일</th>
                    <th>출하예정일</th>
                </tr>
                 <c:forEach var="cust" items="${submitOrderCust}" varStatus="status" > 
                <tr>
                	<th><input type="checkbox" name="content"/></th>
                	<th><input type="text" value="${cust.ordCode}" readonly/></th>
                	<th><input type="text" value="${cust.ordDate}" readonly/></th>
                	<th><input type="text" value="${cust.corVO.custCode}" readonly/></th>
                	<th><input type="text" value="${cust.corVO.item_code}" readonly/></th>
                	<th><input type="text" value="${cust.corVO.item_name}" readonly/></th>
                	<th><input type="text" value="${cust.corVO.unit}" readonly/></th>
                	<th><input type="text" value="${cust.corVO.orderQuant}" readonly/></th>
                	<th><input type="text" value="${cust.corVO.price}" readonly/></th>
                	<th><input type="text" value="${cust.corVO.orderQuant*cust.corVO.price}" readonly/></th>
                	<th><input type="text" value="${(cust.corVO.orderQuant*cust.corVO.price)*0.1}" readonly/></th>
                	<th><input type="text" value="${cust.corVO.orderQuant*cust.corVO.price}" readonly/></th>
                	<th><input type="text" value="${cust.corVO.dueDate}" readonly/></th>
                	<th><input type="text" value="${cust.corVO.expDate}" readonly/></th>
                </tr>
                </c:forEach>
            </table>
            </container2>
            <container3 id= contents3>
            <div id= total_quant>
                수량합계: <input type="text" value="${cust.orderQuant}" disabled/>
                공급가 합계: <input type="text" value="${cust.orderQuant*cust.price}" disabled/>
                부가세 합계: <input type="text" value="${(cust.orderQuant*cust.price)*0.1}" disabled/>
                합계액: <input type="text" value="${cust.orderQuant*cust.price}" disabled/>
            </div>
        </container3>
</body>
</html>