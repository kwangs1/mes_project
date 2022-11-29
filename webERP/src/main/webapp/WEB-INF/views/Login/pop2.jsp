<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>    
    
<%
	String inputNo = (String)request.getAttribute("inputNo");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <style>
    	a{
    		text-decoration:none;
    	}
        #wrap{
            width: 300px;
            height: 400px;
            border: 1px solid black;
        }
        #searchBox{
            width: 100%;
            height: 23%;
            border: 1px solid black;
        }
        #button{
            margin-top: 3%;
            margin-right: 3%;
            text-align: right;
        }
        #view{
        	width:100%;
        	height:77%;
        	overflow:scroll;
        }
    </style>
</head>
<body>
<form name="popForm" method="get" >
    <div id="wrap">
        <div id="searchBox">
            <table id="search" style="width:100%">
                <tr>
                    <td>품목코드</td>
                    <td><input type="text" id="code" /></td>
                </tr>
                <tr>
                    <td>품목명</td>
                    <td><input type="text" id="name" class="name"/></td>
                </tr>
            </table>
            <div id="button">
                <button id="submit" onclick="submitClick(this.form)">적용</button>
                <input type="hidden" name="inputNo" value=""/>
            </div>
        </div>
        <div id="view">
            <table style="width: 100%;">
                <tr align="center">
                    <td>사원코드</td>
                    <td>사원이름</td>
                </tr>
            </table>
           <table id="searchItem" style="width:100%">
                <c:forEach var="emp" items="${empView}">
   				<tr align="center" >
      				<td><a href="javascript:popFunction('${emp.emp_Code }','${emp.emp_Name }')">${emp.emp_Code}</a></td>
     				 <td><a href="#">${emp.emp_Name}</a></td>
   				</tr>
    </c:forEach> 
            </table>
            
        </div>
    </div>
    <script>
			var submit_button = document.getElementById("submit");
			var text_code = document.getElementById("code");
			var text_name = document.getElementById("name");
			
			function popFunction(code, name) {
				text_code.value = code;
				text_name.value = name;
			}
			
			function submitClick(form) {
				opener.setChildValue(text_code.value, text_name.value);
				window.close();
			}
			
		</script>
    </form>
</body>
</html>