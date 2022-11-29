<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
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
        #contents2{
            position: absolute;
            right: 0;
            top: 25%;
            width: 85%;
            height: 30%;
            border: 1px solid black;
            z-index: 1;
        }
        #contents3{
            position: absolute;
            right: 0;
            top:55%;
            width: 85%;
            height: 40%;
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
            margin: 10px 20px;
            padding:0;
            text-align: center;
        }

        /* 테이블 css */
        #MDTable,#MDDetailTable{
            width: 100%;
            text-align: center;
            border: 1px solid black;
        }
        
        /* 컨테이너 파트 */
        #MDDetail {
            width: 100%;
            height: 100%;
            overflow: scroll;
        }
        
        #MDInfo{
            width: 100%;
            height: 95%;
            overflow: scroll;
        }

        #pdcInfo::after{
            content: "";
            display: block;
            clear: both;
        }

        /* 합계 출력부 */
        #resultWindow{
            height: 5%;
            background-color: gray;
            line-height: 5%;
        }

</style>
</head>
<body>
<container1 id = contents1>
            <!-- 조회검색 폼 -->
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
                            <input type="button" value="자재출고" style="padding: 5px; margin-left: 30px;"></input>
                        </td>
                        <td>
                            <input type="button" value="취소" style="padding: 5px;"></input>
                        </td>
                        <td>
                            <input type="button" value="확정" style="padding: 5px;" onClick="confirm()"></input>
                        </td>
                    </tr>
                </table>
            </form>
        </container1>

        <container2 id="contents2">
            <!-- 디테일부 -->
            <div id="MDDetail">
             <form id="comOutsourcing" method="get" commandName = "ListVO">
                <table id="MDDetailTable">
                    <thead>
                        <td><input type="checkbox" name="content" onclick="selectAll(this)"/></td>
                        <td>생산지시번호</td>
                        <td>자재출고상태</td>
                        <td>지시일</td>
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
                    <!-- 테스트용 데이터, 추후 표현식으로 수정필요 -->
                    <tbody>
						 <c:forEach var="out" items="${comOutsourcingView}" varStatus="status" >     
						   <tr align="center">
						   	  <td><input type="checkbox" name="content" value="${out.workOrderNumber}"/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].workOrderNumber" value = '${out.workOrderNumber}' readonly/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].materialForwardingStatus" value = '${out.materialForwardingStatus}' readonly/></td>
						   	  <td><input type="date" name="ListVO[${status.index}].instructionDate" value = '${out.instructionDate}'/></td>
						   	  <td><input type="date" name="ListVO[${status.index}].dueDate" value = '${out.dueDate}'/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].parentItemCode" value = '${out.parentItemCode}' ondblclick="search2()"/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].parentItemName" value = '${out.parentItemName}' readonly/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].parentStandard" value = '${out.parentStandard}' readonly/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].parentInventoryUnit" value = '${out.parentInventoryUnit}' readonly/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].indicatedQuantity" value = '${out.indicatedQuantity}'/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].unitPrice" value = '${out.unitPrice}'/></td>
						   	  <td><input type="text" value = '${out.indicatedQuantity*out.unitPrice}' readonly/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].status" value = '${out.status}'/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].inspection" value = '${out.inspection}'/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].note" value = '${out.note}'/>   </td>
						    </tr>
						    </c:forEach> 
						
						    <tr align="center">
						     <td><input type="checkbox" value = "check1" name="content"/></td>
						    	<td><input type="text" name="ListVO[${fn:length(outsourcingView) }].workOrderNumber" readonly/></td>
						    	<td><input type="text" name="ListVO[${fn:length(outsourcingView) }].materialForwardingStatus" readonly/></td>
						    	<td><input type="date" id = "instructionDate" name="ListVO[${fn:length(outsourcingView) }].instructionDate"  value='${param.workDate }'/></td>
						    	<td><input type="date" id = "dueDate" name="ListVO[${fn:length(outsourcingView) }].dueDate"  value='${param.workDate }'/></td>
						    	<td><input type="text" name="ListVO[${fn:length(outsourcingView) }].parentItemCode" value='${param.parentItemCode }' ondblclick="search2()"/></td>
						    	<td><input type="text" name="ListVO[${fn:length(outsourcingView) }].parentItemName" value='${param.parentItemName }' readonly/></td>
						    	<td><input type="text" name="ListVO[${fn:length(outsourcingView) }].parentStandard" value='${param.parentStandard }' readonly/></td>
						    	<td><input type="text" name="ListVO[${fn:length(outsourcingView) }].parentInventoryUnit" value='${param.parentInventoryUnit }' readonly/></td>
						    	<td><input type="text" id = "indicatedQuantity" name="ListVO[${fn:length(outsourcingView) }].indicatedQuantity"  value='${param.quantity }'/></td>
						    	<td><input type="text" id = "unitPrice" name="ListVO[${fn:length(outsourcingView) }].unitPrice" /></td>
						    	<td><input type="text" id = "price" readonly/></td>
						    	<td><input type="text" name="ListVO[${fn:length(outsourcingView) }].status" readonly/></td>
						    	<td><input type="text" name="ListVO[${fn:length(outsourcingView) }].inspection" readonly/></td>
						    	<td><input type="text" name="ListVO[${fn:length(outsourcingView) }].note" value='${param.note }'/></td>
						    </tr>

                    </tbody>
                </table>
            </div>
                <!-- 디테일부 종료 -->
            </container2>
            
            <container3 id="contents3">
                <div id="MDInfo">
                    <table id="MDTable">
                        <thead>
                            <td><input type="checkbox" name="content" onclick="selectAll(this)"/></td>
                            <td>청구일</td>
                            <td>품번</td>
                            <td>품명</td>
                            <td>규격</td>
                            <td>단위</td>
                            <td>정미수량</td>
                            <td>LOSS</td>
                            <td>확정수량</td>
                            <td>외주단가</td>
                            <td>금액</td>
                            <td>비고</td>
                        </thead>
                        <!-- 테스트용 데이터, 추후 표현식으로 수정필요 -->
                        
                        <tbody>
                            <c:forEach var="comOut" items="${comOutsourcingViewDetail}" varStatus="status" >     
							   <tr align="center">
							   	  <td><input type="checkbox" name="content" value="${comOut.no}"/></td>
							   	  <td><input type="text" name="ListVO[${status.index}].billingDate" value = '${comOut.billingDate}' readonly/></td>
							   	  <td><input type="text" name="ListVO[${status.index}].itemCode" value = '${comOut.itemCode}' ondblclick="search2()"/></td>
							   	  <td><input type="text" name="ListVO[${status.index}].itemName" value = '${comOut.itemName}' readonly/></td>
							   	  <td><input type="text" name="ListVO[${status.index}].standard" value = '${comOut.standard}' readonly/></td>
							   	  <td><input type="text" name="ListVO[${status.index}].inventoryUnit" value = '${comOut.inventoryUnit}' readonly/></td>
							   	  <td><input type="text" name="ListVO[${status.index}].precisionQuantity" value = '${comOut.precisionQuantity}'/></td>
							   	  <td><input type="text" name="ListVO[${status.index}].loss" value = '${comOut.loss}'/></td>
							   	  <td><input type="text" value = '${comOut.precisionQuantity+(comOut.precisionQuantity*comOut.loss*0.01)}' readonly/></td>
							   	  <td><input type="text" value = '${comOut.outsourcingUnitPrice}'/></td>
							   	  <td><input type="text" value = '${(comOut.precisionQuantity+(comOut.precisionQuantity*comOut.loss*0.01))*comOut.outsourcingUnitPrice}'/></td>
							   	  <td><input type="text" name="ListVO[${status.index}].note" value = '${comOut.note}'/>   </td>
							    </tr>
							    </c:forEach> 
							
							    <tr align="center">
							     <td><input type="checkbox" value = "check1" name="content"/></td>
							    	<td><input type="text" name="ListVO[${fn:length(outsourcingView) }].no" readonly/></td>
							    	<td><input type="text" name="ListVO[${fn:length(outsourcingView) }].billingDate" readonly/></td>
							    	<td><input type="text" name="ListVO[${fn:length(outsourcingView) }].itemCode" value='${param.itemCode }' ondblclick="search2()"/></td>
							    	<td><input type="text" name="ListVO[${fn:length(outsourcingView) }].itemName" value='${param.itemName }' readonly/></td>
							    	<td><input type="text" name="ListVO[${fn:length(outsourcingView) }].standard" value='${param.standard }' readonly/></td>
							    	<td><input type="text" name="ListVO[${fn:length(outsourcingView) }].inventoryUnit" value='${param.inventoryUnit }' readonly/></td>
							    	<td><input type="text" id = "precisionQuantity" name="ListVO[${fn:length(outsourcingView) }].precisionQuantity"  value='${param.precisionQuantity}'/></td>
							    	<td><input type="text" id = "loss" name="ListVO[${fn:length(outsourcingView) }].loss"  value='${param.loss}'/></td>
							    	<td><input type="text" id = "comfirmQuantity" readonly/></td>
							    	<td><input type="text" id = "outsourcingUnitPrice" name="ListVO[${fn:length(outsourcingView) }].outsourcingUnitPrice" /></td>
							    	<td><input type="text" id = "price" readonly/></td>
							    	<td><input type="text" name="ListVO[${fn:length(outsourcingView) }].note" value='${param.note }'/></td>
							    </tr>
                        </tbody>
                    </table>
                    
                    <!-- 출력부 1 -->
                </div>
                 <!-- 합계 출력부 -->
                <div id="resultWindow">
                    합 계 <span style="margin-left: 100px;"></span>정미수량 <input type="text"><span style="margin-left: 100px;">확정수량 <input type="text"></span><span style="margin-left: 100px;">금액 <input type="text"></span>
                </div>
                    <!-- 합계 출력부 종료 -->
        </container3>
      
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
      function confirm(){
    	  var item = document.getElementsByName("content").length;

    	  for(var i=0; i<item;i++){
    		  
    	  if(document.getElementsByName("content")[i].checked){
    		  alert(document.getElementsByName("status")[i].value);
    		  document.getElementsByName("status")[i].value='확정';
    	  	}
    	  }
    	  document.getElementById('comOutsourcing').action = "${contextPath}/member/updateComOutsourcing.do";
			document.getElementById('comOutsourcing').submit();  
    	  /*
    	  var workOrderTable = document.getElementById('MDDetailTable');
			 var row = workOrderTable.insertRow(); 
	          const URLSearch = new URLSearchParams(location.search);
			  const newParam = URLSearch.toString();
			 var link = location.pathname +'?'+newParam;
	  			var linkPath = document.createElement("input");
	  		     linkPath.setAttribute("type","hidden");
	  		     linkPath.setAttribute("name","path");
	  		     linkPath.setAttribute("value", link);
	  		     document.getElementById('comOutsourcing').appendChild(linkPath);
	            document.getElementById('comOutsourcing').action = "${contextPath}/member/updateComOutsourcing.do";
	  			document.getElementById('comOutsourcing').submit();  
	  			*/
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
    	  		     document.getElementById('comOutsourcing').appendChild(linkPath);
    	            document.getElementById('comOutsourcing').action = "${contextPath}/member/updateOutsourcing.do";
    	  			document.getElementById('comOutsourcing').submit();  
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
    		     document.getElementById('comOutsourcing').appendChild(linkPath);
              document.getElementById('comOutsourcing').action = "${contextPath}/member/addOutsourcing.do";
    			document.getElementById('comOutsourcing').submit();  
  		
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
