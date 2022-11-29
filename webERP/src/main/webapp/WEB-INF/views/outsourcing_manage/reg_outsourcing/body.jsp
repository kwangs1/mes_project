<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
   request.setCharacterEncoding("UTF-8");
%> 

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <c:forEach var="productionPlanView" items="${productionPlanView}" >     
 	<c:set var="parentItemCode;" value="${productionPlanView.item_Code }"/>
 	<c:set var="itemName" value="${productionPlanView.item_Name }"/>
 	<c:set var="standard" value="${productionPlanView.standard }"/>
 	<c:set var="inventoryUnit;" value="${productionPlanView.inventory_Unit}"/>

 </c:forEach>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
window.onload = function(){
	var itemcode = document.getElementById('itemcode');
	itemcode.onclick = function(){
		window.open('http://localhost:8090/webERP/member/codehelper.do','codehelper','width = 300, height = 200');
	}
}
</script>
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
            margin: 20px 20px;
            padding:0;
            text-align: center;
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

</style>
</head>
<body>
	<container1 id = contents1>
	<form id="searchForm">
                <table class="con1_search">
                    <tr>
                        <td>사업장</td>
                        <td style="width: 80px;"><input type="text" style="width: 100%; background-color: yellow;"/></td>
                        <td colspan="3"><input type="text" name="" disabled style="width: 100%;"/></td>
                        <td> <i class="fas fa-search" style="color: blue;"></i></td> 
    
                        <td colspan="4" style="width: 80px;">부서</td>
                        <td style="width: 80px;"><input type="text" style="width: 100%; background-color: yellow;"/></td>
                        <td><input type="text" name="" disabled/></td>
                        <td> <i class="fas fa-search" style="color: blue;"></i></td>
                    </tr>
                    
                    <tr>
                        <td>외주처</td>
                        <td style="width: 50px;"><input type="text" style="width: 100%; background-color: yellow;"/></td>
                        <td colspan="3"><input type="text" style="width: 100%;"/></td>
                        <td> <i class="fas fa-search" style="color: blue;"></i></td>
                    </tr>
                    <tr>
    					<td>지시기간</td>
                        <td colspan="2" style="width: 50px;"><input type="date"  id='searchStartDate' style="width: 100%;"/></td>
                        <td>~</td>
                        <td ><input type="date" id='searchEndDate' style="width: 100%;"/></td>
                        <td></td>	
                        <td colspan="4" style="width: 80px;">사원</td>
                        <td style="width: 80px;"><input type="text" style="width: 100%; background-color: yellow;"/></td>
                        <td><input type="text" name="" disabled/></td>
                        <td > <i class="fas fa-search" style="color: blue;"></i></td>
                        <td>
                            <input type="button" value="생산계획조회" style="padding: 5px;" onClick="searchPlan()"></input>
                            <input type="button" value="청구조회" style="padding: 5px; margin-left: 30px;"></input>
                        </td>
                        <td>
                            <input type="button" value="주문조회" style="padding: 5px;"></input>
                        </td>
                        <td>
                            <input type="button" value="생산계획조회" style="padding: 5px; " ondblclick="openWindowPop('codehelper.do#','codehelper')"></input>
                        </td>
                    </tr>
                </table>
            </form>
        </container1>
        <container2 id= contents2>
            <div id="workOrderInfo">
            <form id="regOutsourcing" method="get" commandName = "ListVO">
                <table id="workOrderTable">
					 <thead align="center" style="background-color:gray">
                        <td><input type="checkbox" name="content" onclick="selectAll(this)"/></td>
                        <td>외주지시번호</td>
                        <td>발주일</td>
                        <td>납기일</td>
                        <td>품번</td>
                        <td>품명</td>
                        <td>규격</td>
                        <td>단위</td>
                        <td>지시수량</td>
                        <td>단가</td>
                        <td>금액</td>
                        <td>상태</td>
                        <td>검사</td>
                        <td>비고</td>
                        </thead>

   <c:forEach var="out" items="${outsourcingView}" varStatus="status" >     
   <tr align="center">
   	  <td><input type="checkbox" name="content" value="${out.workOrderNumber}"/></td>
   	  <td><input type="text" name="ListVO[${status.index}].workOrderNumber" value = '${out.workOrderNumber}' readonly/></td>
   	  <td><input type="date" name="ListVO[${status.index}].instructionDate" value = '${out.instructionDate}'/></td>
   	  <td><input type="date" name="ListVO[${status.index}].dueDate" value = '${out.dueDate}'/></td>
   	  <td><input type="text" name="ListVO[${status.index}].itemCode" value = '${out.itemCode}' ondblclick="search2()"/></td>
   	  <td><input type="text" name="ListVO[${status.index}].itemName" value = '${out.itemName}' readonly/></td>
   	  <td><input type="text" name="ListVO[${status.index}].standard" value = '${out.standard}' readonly/></td>
   	  <td><input type="text" name="ListVO[${status.index}].inventoryUnit" value = '${out.inventoryUnit}' readonly/></td>
   	  <td><input type="text" name="ListVO[${status.index}].indicatedQuantity" value = '${out.indicatedQuantity}'/></td>
   	  <td><input type="text" name="ListVO[${status.index}].unitPrice" value = '${out.unitPrice}'/></td>
   	  <td><input type="text" value = '${out.indicatedQuantity*out.unitPrice}' readonly/></td>
   	  <td><input type="text" name="ListVO[${status.index}].status" value = '${out.status}'/></td>
   	  <td><input type="text" name="ListVO[${status.index}].inspection" value = '${out.inspection}'/></td>
   	  <td><input type="text" name="ListVO[${status.index}].note" value = '${out.note}'/>   </td>
   	  <td><input type="text" name="ListVO[${status.index}].productionPlanCode" value = '${out.productionPlanCode}'/>   </td>
    </tr>
    </c:forEach> 

    <tr align="center">
     <td><input type="checkbox" value = "check1" name="content"/></td>
    	<td><input type="text" name="ListVO[${fn:length(outsourcingView) }].workOrderNumber" readonly/></td>
    	<td><input type="date" id = "instructionDate" name="ListVO[${fn:length(outsourcingView) }].instructionDate"  value='${param.workDate }'/></td>
    	<td><input type="date" id = "dueDate" name="ListVO[${fn:length(outsourcingView) }].dueDate"  value='${param.workDate }'/></td>
    	<td><input type="text" name="ListVO[${fn:length(outsourcingView) }].itemCode" value='${param.itemCode }' ondblclick="search2()"/></td>
    	<td><input type="text" name="ListVO[${fn:length(outsourcingView) }].itemName" value='${param.itemName }' readonly/></td>
    	<td><input type="text" name="ListVO[${fn:length(outsourcingView) }].standard" value='${param.standard }' readonly/></td>
    	<td><input type="text" name="ListVO[${fn:length(outsourcingView) }].inventoryUnit" value='${param.inventoryUnit }' readonly/></td>
    	<td><input type="text" id = "indicatedQuantity" name="ListVO[${fn:length(outsourcingView) }].indicatedQuantity"  value='${param.quantity }'/></td>
    	<td><input type="text" id = "unitPrice" name="ListVO[${fn:length(outsourcingView) }].unitPrice" /></td>
    	<td><input type="text" id = "price" readonly/></td>
    	<td><input type="text" name="ListVO[${fn:length(outsourcingView) }].status" readonly/></td>
    	<td><input type="text" name="ListVO[${fn:length(outsourcingView) }].inspection" readonly/></td>
    	<td><input type="text" name="ListVO[${fn:length(outsourcingView) }].note" value='${param.note }'/></td>
    	<td><input type="text" name="ListVO[${fn:length(outsourcingView) }].productionPlanCode" value='${param.productionPlanCode}' disabled/></td>
    </tr>
                </table>
                </form>
            </div>
            <!-- 합계 출력부 -->
            <div id="resultWindow">
                합 계 <span style="margin-left: 100px;"></span>지시수량 <input type="text"><span style="margin-left: 100px;">금액 <input type="text"></span>
            </div>
            <!-- 합계 출력부 종료 -->
        </container2>
        </body>
                  
</html>
          <script>
          document.getElementById('searchStartDate').value = new Date().toISOString().substring(0,10);;
          document.getElementById('searchEndDate').value = new Date().toISOString().substring(0,10);;
          
          /* 검색부 date onChange 함수 설정 */
          		var startDate = new Date().toISOString().substring(0,10);;
             	var endDate = new Date().toISOString().substring(0,10);;
             	var unitPrice = document.getElementById("unitPrice");
             	var instructionDate = document.getElementById("instructionDate");
             	var dueDate = document.getElementById("dueDate");
             	var indicatedQuantity = document.getElementById("indicatedQuantity");
             	
             	$('#searchStartDate').change(function (){
                     var date = $('#searchStartDate').val();
                     startDate = date;
                 });
             	$('#searchEndDate').change(function (){
                     var date = $('#searchEndDate').val();
                     endDate = date;
                 });
             	
      function search2(){
      	
        	openWindowPop('http://localhost:8090/webERP/member/bomcodehelper.do','codehelper');
      	 
        }
      function searchPlan(){
    	  openWindowBroadPop('http://localhost:8090/webERP/member/productionPlanSearchOut.do','productionPlanSearchOut');
      }
      view_button.onclick = function(){
		  if(startDate>endDate){
			  alert("지시기간 종료일은 시작일보다 작을수 없습니다.");
		  } else{
			  
    	  const URLSearch = new URLSearchParams(location.search);
		  URLSearch.set('startDate', startDate);
		  URLSearch.set('endDate', endDate);
		  const newParam = URLSearch.toString();

		  window.open(location.pathname + '?' + newParam, '_self');
		  }
  	}
        
        function updateRow(){
      	  //var workOrderTable = document.getElementById('workOrderTable');
    			 var row = workOrderTable.insertRow(); 
    	          const URLSearch = new URLSearchParams(location.search);
    			  const newParam = URLSearch.toString();
    			 var link = location.pathname +'?'+newParam;
    			 document.getElementById("unitPrice").disabled = true;
    			 document.getElementById("instructionDate").disabled = true;
    			 document.getElementById("dueDate").disabled = true;
    			 document.getElementById("indicatedQuantity").disabled = true;
    	  			var linkPath = document.createElement("input");
    	  		     linkPath.setAttribute("type","hidden");
    	  		     linkPath.setAttribute("name","path");
    	  		     linkPath.setAttribute("value", link);
    	  		     document.getElementById('regOutsourcing').appendChild(linkPath);
    	            document.getElementById('regOutsourcing').action = "${contextPath}/member/updateOutsourcing.do";
    	  			document.getElementById('regOutsourcing').submit();  
        }
        
        
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
    		     document.getElementById('regOutsourcing').appendChild(linkPath);
              document.getElementById('regOutsourcing').action = "${contextPath}/member/addOutsourcing.do";
    			document.getElementById('regOutsourcing').submit();  
  		
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
      		  
      			  window.location.href = "${contextPath}/member/removeOutsourcing.do?workOrderNumber="+ary;
      	  }
        }
      	
      </script>
