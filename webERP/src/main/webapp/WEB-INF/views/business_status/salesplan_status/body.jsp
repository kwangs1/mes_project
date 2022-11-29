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
<title>판매계획 현황</title>
<style>
#contents1{
            position: absolute;
            padding: 10px;
            right: 0;
            top: 15%;
            width: 85%;
            height: 10%;
            border: 1px solid black;
            z-index: 1;
        }
                .con1_search{
            padding:0;
            text-align: center;
            top: 25%;
            left: 5%;
        }
         #searchForm {
            height: 100%;
            margin: 25px 10px;
        }
        
        #button{
            position: absolute;
            right: 10px;
            top: 10px;
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
                    <td>품  목</td>
                    <td style="width: 50px;"><input type="text" name="item" value='${param.item_code}' style="width: 100%;"/></td>
                    <td style="width: 120px;"><input type="text" name="item" value='${param.item_name}' style="width: 100%;"/></td>
                    <td style="width: 50px;"><a href="javascript:search1()"><i class="fas fa-search"></i></a></td>
                </tr>
            </table>
        </container1>

    <script>
    function openWindowPop(url, name){
        var options = 'top=330, left=400, width=320, height=420, status=no, menubar=no, toolbar=no, resizable=no';
        window.open(url, name, options);
    }
          function search1(){
    	  
        	  openWindowPop('http://localhost:8090/webERP/member/salsplanhelper2.do','popupItem');  
    }
          
    </script>
</body>
</html>