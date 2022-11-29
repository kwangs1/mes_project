<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"    
    isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
            margin: 0;
            padding:0;
            text-align: center;
        }
        /* 컨테이너 스타일부 */
        #workOrderInfo {
            overflow: scroll;
            height: 100%;
            width: 100%;
        }

</style>
<script>
	window.onload = function(){
		l_sub1.style.display = "block";
        l_sub1.style.position = "relative";
        l_sub1.style.marginLeft = "10px";
	}
</script>
</head>
<body>
<container1 id = contents1>
            <form id="searchForm">
                <table class="con1_search">
                    <tr>
                        <td>품번</td>
                        <td style="width: 80px;"><input type="text" value="${param.itemCode }" style="width: 100%; background-color: yellow;"/></td>
                        <td colspan="3"><input type="text" value="${param.itemName }" disabled style="width: 100%;"/></td>
                        <td><a href="javascript:search1()"><i class="fas fa-search" style="color: blue;"></i></td>                        
                    </tr>
                    
                    <tr>
                        <td>작업예정일</td>
                        <td colspan="2" style="width: 50px;"><input type="date"  id='searchStartDate' style="width: 100%; background-color: yellow;"/></td>
                        <td>~</td>
                        <td ><input type="date" id='searchEndDate' style="width: 100%; background-color: yellow;"/></td>
                        <td></td>                        
                        <td><input type="button" value="재고 확인" onClick="checkStock();" /></td>
                    </tr>
                </table>
                </form>
        </container1>
        <container2 id= contents2>
            <div id="workOrderInfo">
	         <form id="dataForm" mehtod="get" commandName="ListVO">
                <table id="workOrderTable">
                    <thead>
                        <td><input type="checkbox" name="content" onclick="selectAll(this)"/></td>
                        <td>품번</td>
                        <td>품명</td>
                        <td>규격</td>
                        <td>단위</td>
                        <td>일생산량</td>
                        <td>순서</td>
                        <td>작업예정일</td>
                        <td>수량</td>
                        <td>비고</td>
                    </thead>
                    <!-- 테스트용 데이터, 추후 표현식으로 수정필요 -->
                    <tbody>
               		<c:forEach var="info" items="${infoList}" varStatus="status">    
                     <tr id="updateData" align="center">
                     	<td><input type="checkbox" value = "${info.productionPlanCode }"  name="content"/></td>
                     	<td><input type="text" name="ListVO[${status.index}].itemCode" value="${info.itemCode }" readonly/></td>
                     	<td><input type="text" name="ListVO[${status.index}].itemName" value="${info.itemName }" readonly/></td>
                     	<td><input type="text" name="ListVO[${status.index}].standard" value="${info.standard }" readonly/></td>
                     	<td><input type="text" name="ListVO[${status.index}].inventoryUnit" value="${info.inventoryUnit }" readonly/></td>
                     	<td><input type="text" name="ListVO[${status.index}].dailyProduction" value="${info.dailyProduction }" readonly/></td>
                        <td><input type="text" name="ListVO[${status.index}].sequence" value="${info.sequence }" readonly/></td>
                        <td><input type="date" name="ListVO[${status.index}].scheduled" value="${info.scheduled }" /></td>
                        <td><input type="text" name="ListVO[${status.index}].quantity" value="${info.quantity }" /></td>
                        <td><input type="text" name="ListVO[${status.index}].note" value="${info.note }" /></td>
                        <td><input type="hidden" name="ListVO[${status.index }].productionPlanCode" value="${info.productionPlanCode }" /></td>
                     </tr>
                     </c:forEach>
                     <tr>
                        <td><input type="checkbox" value ="check1" name="content"/></td>
                        <td><input type="text" id="itemCode" name="ListVO[${fn:length(infoList)}].itemCode" value="${param.itemCode }"/></td>
                        <td><input type="text" id="itemName" name="ListVO[${fn:length(infoList)}].itemName" value="${param.itemName }"/></td>
                        <td><input type="text" id="standard" name="ListVO[${fn:length(infoList)}].standard" value="${param.standard }"/></td>
                        <td><input type="text" id="inventoryUnit" name="ListVO[${fn:length(infoList)}].inventoryUnit" value="${param.inventoryUnit }" readonly /></td>
                        <td><input type="text" id="dailyProduction" name="ListVO[${fn:length(infoList)}].dailyProduction" value="${param.dailyProduction }" readonly /></td>
                        <td><input type="text" disabled /></td>
                        <td><input type="date" id="scheduled" name="ListVO[${fn:length(infoList)}].scheduled" /></td>
                        <td><input type="text" id="quantity" name="ListVO[${fn:length(infoList)}].quantity" value="${param.quantity }"/></td>
                        <td><input type="text" id="note" name="ListVO[${fn:length(infoList)}].note" /></td>
                     </tr>
                    </tbody>
                </table>
                </form>
            </div>
        </container2>
      
</body>
</html>
 <script>
 function isEmpty(str){
     
     if(typeof str == "undefined" || str == null || str == "")
         return true;
     
     else
         return false ;
     
 	}
 /* input date의 현재 날짜 기본값 설정*/
 document.getElementById('searchStartDate').value = new Date().toISOString().substring(0,10);;
 document.getElementById('searchEndDate').value = new Date().toISOString().substring(0,10);;
 
 /* 검색부 date onChange 함수 설정 */
 		var startDate = new Date().toISOString().substring(0,10);;
    	var endDate = new Date().toISOString().substring(0,10);;
    	
    	$('#searchStartDate').change(function (){
            var date = $('#searchStartDate').val();
            startDate = date;
        });
    	$('#searchEndDate').change(function (){
            var date = $('#searchEndDate').val();
            endDate = date;
        });
    	
      function search1(){  
    	  openWindowPop('http://localhost:8090/webERP/member/itemCodePop.do','itemCodePop');  	  
      }
      
      /* 조회버튼 클릭시 기능 구현 */
      view_button.onclick = function(){
		  if(startDate>endDate){
			  alert("지시기간 종료일은 시작일보다 작을수 없습니다.");
		  } else{
			  
    	  const URLSearch = new URLSearchParams(location.search);
    	  URLSearch.set('submit', '1');
		  URLSearch.set('startDate', startDate);
		  URLSearch.set('endDate', endDate);
		  const newParam = URLSearch.toString();

		  window.open(location.pathname + '?' + newParam, '_self');
		  }
  	}
      
      /* 저장 버튼 기능 구현 */
      
        function newRow(){
          // dao에서 저장
    	 
        	var row = workOrderTable.insertRow(); 
          	const URLSearch = new URLSearchParams(location.search);
		 	const newParam = URLSearch.toString();
			var link = location.pathname +'?'+newParam;
  			var linkPath = document.createElement("input");
  		    linkPath.setAttribute("type","hidden");
  		    linkPath.setAttribute("name","path");
  		    linkPath.setAttribute("value", link);
  		    
  		  var scheduled = document.getElementById("scheduled").value;
  		  var quantity = document.getElementById("quantity").value;
   		   if (isEmpty(scheduled)){
		      		alert("날짜값이 비어져있습니다. 값을 추가해주세요!");
		      		document.getElementById("scheduled").focus();
	
	  	  }
   		   else if(isEmpty(quantity)){
		      		alert("수량값이 비어져있습니다. 값을 추가해주세요!");		            	
		      		document.getElementById("quantity").focus();
		   }else{
  		       
  		    document.getElementById('dataForm').appendChild(linkPath);
            document.getElementById('dataForm').action = "${contextPath}/member/addProductionPlan.do";
  			document.getElementById('dataForm').submit();  		
	  		alert("값이 저장되었습니다!");          	
		   }   
      }
      
        function updateRow() {
        	var row = workOrderTable.insertRow(); 
        	const URLSearch = new URLSearchParams(location.search);
        	const newParam = URLSearch.toString();
  		 	var link = location.pathname +'?'+newParam;
  		 	document.getElementById("scheduled").disabled = true;
		    document.getElementById("quantity").disabled = true;
		    document.getElementById("standard").disabled = true;
		    document.getElementById("note").disabled = true;
    		var linkPath = document.createElement("input");
    		linkPath.setAttribute("type","hidden");
    		linkPath.setAttribute("name","path");
    		linkPath.setAttribute("value", link);
  		    document.getElementById('dataForm').appendChild(linkPath);
            document.getElementById('dataForm').action = "${contextPath}/member/updateProductionPlan.do";
    		document.getElementById('dataForm').submit();  
        }
        
      
        function deleteData() {
      	  var item = document.getElementsByName("content").length;
      	  var no = "";
      	  var ary = [];
      	  for(var i=0; i<item;i++){
      		  if(document.getElementsByName("content")[i].checked==true){
      			  no = document.getElementsByName("content")[i].value;
      			  ary.push(no);
      		  }
      			  window.location.href = "${contextPath}/member/delProductionPlan.do?productionPlanCode="+ary;
      	  }
        }
        
        function checkStock() {
        	var itemCode = document.getElementById('itemCode').value;
        	var dailyProduction = document.getElementById('dailyProduction').value;
        	if(itemCode == null || itemCode == ""){
        		alert("품번을 선택해 주세요!");
        	} else{
        	openWindowBroadPop('http://localhost:8090/webERP/member/checkStock.do?parentItemCode='+itemCode+'&dailyProduction='+dailyProduction,'checkStock');      		
        	}
        }
      </script>