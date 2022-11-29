<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>    


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <style>
    	a{
    		text-decoration:none;
    	}
        #wrap{
            width: 1000px;
            height: 800px;
            border: 1px solid black;
        }
        #searchBox{
            width: 100%;
            height: 10%;
            border: 1px solid black;
        }
        #button{
            margin-right: 3%;
            text-align: right;
        }
        #search{
            margin-left: 30px;
        }
        #view{
        	width:100%;
        	height:90%;
        	overflow:scroll;
        }
    </style>
</head>
<body>
<form name="popForm" method="get" action="${contextPath }/member/productionPlanResponse.do" >
    <div id="wrap">
        <div id="searchBox">
            <table id="search">
                <tr>
                   <td>일생산 가능 최대수량</td>
                   <td><input type="text" id="dailyProduction" value="${param.dailyProduction }" readonly></td>
                   <td>남은 자재 최소수량</td>
                   <td><input type="text" id="minValue" value="${minValue }" readonly></td>
                </tr>
                <tr>
                   	<td>생산 수량</td>
                   	<td><input type="text" id="quantity"></td>
                	<td><input type="button" value="적용" onClick="sendData();"/></td>
                </tr>   
            </table>
        </div>
        <div id="view">
            <table style="width: 100%;">
                <tr align="center">     
                    <td>품번</td>
                    <td>품명</td>
                    <td>규격</td>
                    <td>단위</td>
                    <td>자재잔량</td>                    
                </tr>
     <c:forEach var="productionPlan" items="${itemView}" >     
		<tr align="center" id="insertData">			
      		<td>${productionPlan.itemCode }</td>
      		<td>${productionPlan.itemName}</td>
      		<td>${productionPlan.standard }</td>
      		<td>${productionPlan.inventoryUnit }</td>
      		<td>${productionPlan.quantity }</td>      		
    	</tr> 
    </c:forEach> 
            </table>
        </div>
    </div>
    <script>
        	
    	function sendData(){
    		var dailyProduction = document.getElementById("dailyProduction").value;
    		var minValue = document.getElementById("minValue").value;
    		var quantity = document.getElementById("quantity").value;
    		
    		if(dailyProduction*1 < quantity*1){    		
    			alert("생산 수량은 일 생산가능 최대수량을 초과할 수 없습니다!");
    		} else if(quantity*1 > minValue*1){
    			alert("자재가 모자랍니다!");
    		} else {    			
    			var url = window.opener.document.location.href;    			
    			const URLSearch = new URLSearchParams(window.opener.document.location.href);    		 	
    			
    			if(URLSearch.get('quantity') == null){
    				opener.parent.location = url +'&quantity='+quantity;
    			    } else{
    			     URLSearch.set('quantity', quantity);
    			     const newParam = URLSearch.toString();
    			     opener.parent.location = url;
    		    }
    			window.close();
    		}
    	}
    </script>
    </form>
</body>
</html>