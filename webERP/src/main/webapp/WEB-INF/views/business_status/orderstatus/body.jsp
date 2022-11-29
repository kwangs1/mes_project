<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수주 현황</title>
<style>
#contents1{
            position: absolute;
            left: 15%;
            top: 15%;
            width: 85%;
            height: 10%;
            border: 1px solid black;
            z-index: 1;
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
<script>
   window.onload = function(){
	   l_sub2.style.display = "block";
	   l_sub2.style.position = "relative";
	   l_sub2.style.marginLeft = "10px";
   }
</script>
</head>
<body>
<container1 id = contents1>
            <table class="con1_search">
                <tr>
                    <td>거래처 명</td>
                    <td style="width: 50px;"><input type="text" name="cust" value='${param.custCode}' style="width: 100%;" disabled /></td>
                    <td colspan="3"><input type="text" name="cust" value='${param.custName}' style="width: 100%;"disabled /></td>
                    <td><a href="javascript:search1()"><i class="fas fa-search" style="color: blue;"></i></a></td>
                    <td colspan="5" style="width: 100px;">거래구분</td>
                    <td style="width: 80px;"><input type="text" style="width: 100%;"/></td>
                    <td><input type="text" name="" disabled/></td>
                    <td ><i class="fas fa-search" style="color: blue;"></td>
                    
                </tr> 
                <tr>
                    <td>수주기간</td>
                    <td colspan="2" style="width: 80px;"><input type="date" id="reqInput" style="width: 100%;"/></td>
                    <td>~</td>
                    <td><input type="date" id="reqInput" style="width: 100%;"/></td>
                    <td></td>
                    <td colspan="5">사원</td>
                    <td style="width: 80px;"><input type="text" style="width: 100%;"/></td>
                    <td><input type="text" name="" disabled/></td>
                    <td><i class="fas fa-search" style="color: blue;"></td>
                </tr>
            </table>
        </container1>
        	</container1>
	   <script>
	   function openWindowPop(url, name){
           var options = 'top=330, left=400, width=320, height=420, status=no, menubar=no, toolbar=no, resizable=no';
           window.open(url, name, options);
       }
          function search1(){
    	  
        	  openWindowPop('http://localhost:8090/webERP/member/ordercodehelper.do','CustOrderSta');  
    }
    
    </script>
</body>
</html>