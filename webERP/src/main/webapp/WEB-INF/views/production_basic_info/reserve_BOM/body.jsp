<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"    
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
            /* position: absolute; 칸 모잘라서 지움*/
            top: 25%;
            left: 5%;
        }
        #searchForm {
            height: 100%;
            margin: 20px 10px;
        }
        /* 컨테이너 스타일부 */
        #workOrderInfo {
            overflow: scroll;
            height: 97%;
            width: 100%;
        }
        /* 합계 출력부 */
        #resultWindow{
            height: 3%;
            background-color: gray;
            line-height: 5%;
        }
        #workOrderTable{
            width: 100%;
        }

</style>
<script>
	window.onload = function(){
		l_sub3.style.display = "block";
        l_sub3.style.position = "relative";
        l_sub3.style.marginLeft = "10px";
	}
</script>
</head>
<body>
<container1 id = contents1>
            <form id="searchForm">
                <table>
                    <tr>
                        <td>
                            자품목
                        </td>
                         <Td>
                            <input type="text" name="factory" value='${param.itemNumber }' style="width: 120px; background-color: yellow;">
                        </Td>
                        <td>
                            <a href="javascript:search1()"><i class="fas fa-search" style="color: blue;"></i></a>
                        </td>
                        <td>
                            <input type="text" name="ckfactory" value='${param.itemName }' style="width: 120px;" disabled>
                        </td>
                       
                    </tr>
                </table>
                </form>
        </container1>
        <container2 id= contents2>
            <div id="workOrderInfo">
                <table id="workOrderTable">
                    <tr align="center" style="font-weight:bold;background-color:gray">
                        <td>품번</td>
                        <td>품명</td>
                        <td>규격</td>
                        <td>단위</td>
                        <td>정미수량</td>
                        <td>LOSS(%)</td>
                        <td>필요수량</td>
                        <td>계정</td>
                    </tr>
                   <c:forEach var="bom" items="${bomView}">  
                    <tbody align="center">
                        <td>${bom.itemNumber }</td>
                        <td>${bom.itemName}</td>
                        <td>${bom.standard}</td>
                        <td>${bom.unit}</td>
                        <td>${bom.precisionQuantity }</td>
                        <td>${bom.loss }</td>
                        <td>${bom.precisionQuantity+(bom.precisionQuantity * (bom.loss * 0.01)) }</td>
                        <td>${bom.division }</td>
                    </tbody>
                    </c:forEach>
                </table>
            </div>
            <!-- 합계 출력부 -->
            <div id="resultWindow">
                합 계 <span style="margin-left: 100px;">정미수량 <input type="text"></span><span style="margin-left: 100px;">필요수량 <input type="text"></span>
            </div>
            <!-- 합계 출력부 종료 -->
        </container2>
      <script>
      function openWindowPop(url, name){
          var options = 'top=0, left=0, width=320, height=420, status=no, menubar=no, toolbar=no, resizable=no';
          window.open(url, name, options);
      }
      
      function search1(){
    	  openWindowPop('${contextPath}/member/reservePop.do','codehelper');
      }
      view_button.onclick = function(){
		  const URLSearch = new URLSearchParams(location.search);
		  URLSearch.set('submit', '1');
		  const newParam = URLSearch.toString();

		  window.open(location.pathname + '?' + newParam, '_self');
 	}

		
      </script>
</body>
</html>