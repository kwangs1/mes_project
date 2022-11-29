<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" isELIgnored="false"%>
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
            /* position: absolute; ĭ ���߶� ����*/
            top: 25%;
            left: 5%;
        }
        #searchForm {
            height: 100%;
            margin: 25px 10px;
        }
        /* �����̳� ��Ÿ�Ϻ� */
        #workOrderInfo {
            overflow: scroll;
            height: 100%;
            width: 100%;
        }
        #workOrderTable{
            width: 100%;
        }
</style>
<script>
	window.onload = function(){
		l_sub4.style.display = "block";
        l_sub4.style.position = "relative";
        l_sub4.style.marginLeft = "10px";
	}
</script>
</head>
<body>
<container1 id = contents1>
            <form id="searchForm">
                <table>
                    <tr>
                        <td>
                            ��ǰ��
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
                    <thead align="center">                        
                        <td>ǰ���ڵ�</td>
                        <td>ǰ��</td>
                        <td>�԰�</td>
                        <td>����</td>
                        <td>�԰����</td>
                        <td>������</td>                        
                        <td>�������</td>                        
                    </thead>
                    <!-- �׽�Ʈ�� ������, ���� ǥ�������� �����ʿ� -->
                    <c:forEach var="wip" items="${infoList}">  
                    <tbody align="center">                        
                        <td>${wip.itemCode}</td>
                        <td>${wip.itemName}</td>
                        <td>${wip.standard}</td>                        
                        <td>${wip.inventoryUnit }</td>
                        <td>${wip.indicatedQuantity }</td>
                        <td>${wip.sumPerformanceQuantity }</td>
                        <td>${wip.remainingPerformance }</td>                        
                    </tbody>
                  </c:forEach>                   
                </table>
            </div>
        </container2>
      <script>
      function openWindowPop(url, name){
          var options = 'top=0, left=0, width=320, height=420, status=no, menubar=no, toolbar=no, resizable=no';
          window.open(url, name, options);
      }
      
      function search1(){
    	      	openWindowPop('${contextPath}/member/codehelper.do','codehelper');
      }
      
      view_button.onclick = function(){
		  const URLSearch = new URLSearchParams(location.search);
		  URLSearch.set('submit', '1');
		  const newParam = URLSearch.toString();

		  window.open(location.pathname + '?' + newParam, '_self');
 	}
      
      function childSearch(name){
    	  const URLSearch = new URLSearchParams(location.search);
		  URLSearch.set('submit', '2');
		  const newParam = URLSearch.toString();
		  if(URLSearch.get('childCode') == null)
		  window.open(location.pathname + '?' + newParam + "&&childCode=" + name.innerText, '_self');
		  else{
			  URLSearch.set('childCode',name.innerText);
			  const newParam = URLSearch.toString();
	          window.location.href = location.pathname +'?'+newParam;
		  }
			  
      }
      </script>
</body>
</html>