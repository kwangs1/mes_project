<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"    
    isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
            /* position: absolute; 칸 모잘라서 지움*/
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
</head>
<body>
<container1 id = contents1>
            <form id="searchForm">
                <table>
                    <tr>
                        <td>
                            모품목
                        </td>
                        <Td>
                            <input type="text" id="factory" value='${param.itemNumber }' readonly style="width: 120px; background-color: yellow;">
                        </Td>
                        <td>
                            <a href="javascript:search1()"><i class="fas fa-search" style="color: blue;"></i></a>
                        </td>
                        <td>
                            <input type="text" id="ckfactory" value='${param.itemName }' style="width: 120px;" disabled>
                        </td>
                    </tr>
                </table>
                </form>
                
        </container1>
        
      <script>
      function openWindowPop(url, name){
          var options = 'top=0, left=0, width=320, height=420, status=no, menubar=no, toolbar=no, resizable=no';
          window.open(url, name, options);
      }
      
      function search1(){
    	  
    	      	openWindowPop('${contextPath}/member/codehelper.do','codehelper');

    	  
      }
      	
      </script>
</body>
</html>