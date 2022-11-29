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
		<title>견적 현황</title>
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
        	input{
        		width: 100%;
        	}
        	i{
        		color: blue;
        	}
        	.codeInput{
        	width: 80px;
        	}
        	.nameInput{
        	width: 150px;
        	}
        	
		</style>
	</head>
	<body>
		<container1 id = contents1>
       		<table class="con1_search">
                <tr>
                    <td>사업장</td>
                    <td class="nameInput"><input type="text" id="reqInput"/></td>
					<td colspan="3"><input type="text" name="" disabled/></td>                    
                    <td><i class="fas fa-search" ></td>
                    
                    <td colspan="5" style="width: 50px;">부서</td>
                    <td class="codeInput"><input type="text"/></td>
                    <td><input type="text" name="" disabled/></td>
                    <td ><i class="fas fa-search"></td>
                    
                </tr> 
                <tr>
                    <td>견적기간</td>
                    <td colspan="2" style="width: 80px;"><input type="date" id="reqInput"/></td>
                    <td>~</td>
                    <td><input type="date" id="reqInput"/></td>
                    <td></td>
                    <td colspan="5">거래처 명</td>
                    <td class="codeInput"><input type="text" name="cust" value='${param.custCode}'disabled /></td>
                    <td class="nameInput"><input type="text" name="cust" value='${param.custName}'disabled /></td>
                    <td style="width: 50px;"><a href="javascript:search1()"><i class="fas fa-search"></i></a></td>

                </tr>
        	</table>
		</container1>

	</body>
</html>