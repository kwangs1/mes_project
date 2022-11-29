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
            height: 35%;
            border: 1px solid black;
            z-index: 1;
        }
        #contents3{
            position: absolute;
            right: 0;
            top:60%;
            width: 85%;
            height: 35%;
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

        /* 컨테이너 스타일부 */
        #workOrderDetail{
            overflow: scroll;
            height: 100%;
        }
        #workOrderInfo {
            width: 100%;
            overflow: scroll;
            height: 94%;
        }
        /* 컨테이너 스타일부 종료 */
       /* 합계 출력부 */
       #resultWindow{
            height: 6%;
            background-color: gray;
            line-height: 2%;
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
    
                        <td colspan="5" style="width: 80px;">부서</td>
                        <td style="width: 80px;"><input type="text" style="width: 100%; background-color: yellow;"/></td>
                        <td><input type="text" name="" disabled/></td>
                        <td> <i class="fas fa-search" style="color: blue;"></i></td>
                        
                    </tr>
                    
                    <tr>
                        <td>지시일</td>
                        <td colspan="2" style="width: 50px;"><input type="date" style="width: 100%;"/></td>
                        <td>~</td>
                        <td ><input type="date" style="width: 100%;"/></td>
                        <td></td>
    
                        <td colspan="5" style="width: 80px;">사원</td>
                        <td style="width: 80px;"><input type="text" style="width: 100%; background-color: yellow;"/></td>
                        <td><input type="text" name="" disabled/></td>
                        <td > <i class="fas fa-search" style="color: blue;"></i></td>

                        <td>
                            <input type="button" value="자재사용" style="padding: 5px; margin-left: 30px;"></input>
                        </td>
                        <td>
                            <input type="button" value="검색상세" style="padding: 5px;"></input>
                        </td>
                    </tr>
                </table>
                </form>
        </container1>
        <container2 id="contents2">
             <div id="workOrderDetail">
                <table id="workOrderDetailTable">
                    <thead> 
                        <td><input type="checkbox" name="content" onclick="selectAll(this)"/></td>
                        <td>작업지시번호</td>
                        <td>자재출고상태</td>
                        <td>외주처</td>
                        <td>지시일</td>
                        <td>완료일</td>
                        <td>품번</td>
                        <td>품명</td>
                        <td>규격</td>
                        <td>단위</td>
                        <td>지시수량</td>
                        <td>단가</td>
                        <td>금액</td>
                        <td>실적수량</td>
                        <td>실적잔량</td>
                        <td>상태</td>
                        <td>검사</td>
                        <td>비고</td>
                    </thead>
                    <!-- 테스트용 데이터, 추후 표현식으로 수정필요 -->
                    <tbody>
                    
                        <c:forEach var="regOutPer" items="${regOutPerformanceView}" varStatus="status" >     
						   <tr align="center">
						   	  <td><input type="checkbox" name="content" value="${regOutPer.workOrderNumber}"/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].workOrderNumber" value = '${regOutPer.workOrderNumber}' readonly/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].materialForwardingStatus" value = '${regOutPer.materialForwardingStatus}' readonly/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].workplaceCode" value = '${regOutPer.workplaceCode}' readonly/></td>
						   	  <td><input type="date" name="ListVO[${status.index}].instructionDate" value = '${regOutPer.instructionDate}'/></td>
						   	  <td><input type="date" name="ListVO[${status.index}].dueDate" value = '${regOutPer.dueDate}'/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].parentItemCode" value = '${regOutPer.parentItemCode}' ondblclick="search2()"/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].parentItemName" value = '${regOutPer.parentItemName}' readonly/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].parentStandard" value = '${regOutPer.parentStandard}' readonly/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].parentInventoryUnit" value = '${regOutPer.parentInventoryUnit}' readonly/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].indicatedQuantity" value = '${regOutPer.indicatedQuantity}'/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].unitPrice" value = '${regOutPer.unitPrice}'/></td>
						   	  <td><input type="text" value = '${regOutPer.indicatedQuantity*regOutPer.unitPrice}' readonly/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].sumPerformanceQuantity" value = '${regOutPer.sumPerformanceQuantity}'/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].remainingPerformance" value = '${regOutPer.remainingPerformance}'/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].status" value = '${regOutPer.status}'/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].parentInspection" value = '${regOutPer.parentInspection}'/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].parentNote" value = '${regOutPer.note}'/></td>
						    </tr>
						    </c:forEach> 
						
						    <tr align="center">
						     <td><input type="checkbox" value = "check1" name="content"/></td>
						    	<td><input type="text" name="ListVO[${fn:length(regOutPerformanceView) }].workOrderNumber" readonly/></td>
						    	<td><input type="text" name="ListVO[${fn:length(regOutPerformanceView) }].materialForwardingStatus" readonly/></td>
						    	<td><input type="text" name="ListVO[${fn:length(regOutPerformanceView) }].workplaceCode" value='${param.workplaceCode }' /></td>
						    	<td><input type="date" id = "instructionDate" name="ListVO[${fn:length(regOutPerformanceView) }].instructionDate"  value='${param.workDate }'/></td>
						    	<td><input type="date" id = "dueDate" name="ListVO[${fn:length(regOutPerformanceView) }].dueDate"  value='${param.workDate }'/></td>
						    	<td><input type="text" name="ListVO[${fn:length(regOutPerformanceView) }].parentItemCode" value='${param.parentItemCode }' ondblclick="search2()"/></td>
						    	<td><input type="text" name="ListVO[${fn:length(regOutPerformanceView) }].parentItemName" value='${param.parentItemName }' readonly/></td>
						    	<td><input type="text" name="ListVO[${fn:length(regOutPerformanceView) }].parentStandard" value='${param.parentStandard }' readonly/></td>
						    	<td><input type="text" name="ListVO[${fn:length(regOutPerformanceView) }].parentInventoryUnit" value='${param.parentInventoryUnit }' readonly/></td>
						    	<td><input type="text" id = "indicatedQuantity" name="ListVO[${fn:length(regOutPerformanceView) }].indicatedQuantity"  value='${param.quantity }'/></td>
						    	<td><input type="text" id = "unitPrice" name="ListVO[${fn:length(regOutPerformanceView) }].unitPrice" /></td>
						    	<td><input type="text" id = "price" readonly/></td>
						    	<td><input type="text" id = "sumPerformanceQuantity" readonly/></td>
						    	<td><input type="text" id = "remainingPerformance" readonly/></td>
						    	<td><input type="text" name="ListVO[${fn:length(regOutPerformanceView) }].status" readonly/></td>
						    	<td><input type="text" name="ListVO[${fn:length(regOutPerformanceView) }].parentInspection" readonly/></td>
						    	<td><input type="text" name="ListVO[${fn:length(regOutPerformanceView) }].noteDetail" value='${param.note }'/></td>
						    </tr>
                    </tbody>
                </table>
            </div>
        </container2>
        <container3 id="contents3">
            <div id="workOrderInfo">
                <table id="workOrderTable">
                    <thead>
                        <td><input type="checkbox" name="content2" onclick="selectAll2(this)"/></td>
                        <td>작업실적번호</td>
                        <td>자재사용유무</td>
                        <td>실적일</td>
                        <td>공정</td>
                        <td>작업장</td>
                        <td>구분</td>
                        <td>실적수량</td>
                        <td>검사</td>
                        <td>비고</td>
                    </thead>
                    <!-- 테스트용 데이터, 추후 표현식으로 수정필요 -->
                    <tbody>
                                            
                        <c:forEach var="regOutPerDetail" items="${regOutPerformanceViewDetail}" varStatus="status" >     
						   <tr align="center">
						   	  <td><input type="checkbox" name="content" value="${regOutPerDetail.operationPerformanceNumber}"/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].operationPerformanceNumber" value = '${regOutPerDetail.operationPerformanceNumber}' readonly/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].materialUseStatus" value = '${regOutPerDetail.materialUseStatus}' readonly/></td>
						   	  <td><input type="date" name="ListVO[${status.index}].performanceDate" value = '${regOutPerDetail.performanceDate}' readonly/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].outsourcingCode" value = '${regOutPerDetail.outsourcingCode}'/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].workplaceCode" value = '${regOutPerDetail.workplaceCode}'/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].sortation" value = '${regOutPerDetail.sortation}' ondblclick="search2()"/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].performanceQuantity" value = '${regOutPerDetail.performanceQuantity}' readonly/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].inspection" value = '${regOutPerDetail.inspection}' readonly/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].note" value = '${regOutPerDetail.note}' readonly/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].workOrderNumber" value = '${regOutPerDetail.workOrderNumber}'/></td>

						    </tr>
						    </c:forEach> 
						
						    <tr align="center">
						     <td><input type="checkbox" value = "check1" name="content"/></td>
						    	<td><input type="text" name="ListVO[${fn:length(regOutPerformanceViewDetail) }].operationPerformanceNumber" readonly/></td>
						    	<td><input type="text" name="ListVO[${fn:length(regOutPerformanceViewDetail) }].materialUseStatus" readonly/></td>
						    	<td><input type="date" name="ListVO[${fn:length(regOutPerformanceViewDetail) }].performanceDate" value='${param.performanceDate }' /></td>
						    	<td><input type="text" id = "instructionDate" name="ListVO[${fn:length(regOutPerformanceViewDetail) }].Outsourcing_Code"  value='${param.Outsourcing_Code }'/></td>
						    	<td><input type="text" id = "dueDate" name="ListVO[${fn:length(regOutPerformanceViewDetail) }].Workplace_Code"  value='${param.Workplace_Code }'/></td>
						    	<td><input type="text" name="ListVO[${fn:length(regOutPerformanceViewDetail) }].sortation" value='${param.sortation }' ondblclick="search2()"/></td>
						    	<td><input type="text" name="ListVO[${fn:length(regOutPerformanceViewDetail) }].performanceQuantity" value='${param.performanceQuantity }' readonly/></td>
						    	<td><input type="text" name="ListVO[${fn:length(regOutPerformanceViewDetail) }].inspection" value='${param.inspection }' readonly/></td>
						    	<td><input type="text" name="ListVO[${fn:length(regOutPerformanceViewDetail) }].note" value='${param.note }' readonly/></td>
						    	<td><input type="text" id = "indicatedQuantity" name="ListVO[${fn:length(regOutPerformanceViewDetail) }].indicatedQuantity"  value='${param.workOrderNumber }'/></td>
						    	
						    </tr>
                    </tbody>
                </table>
            </div>
            <!-- 컨테이너 출력 종료 -->
             <!-- 합계 출력부 -->
             <div id="resultWindow">
                합 계 <span style="margin-left: 100px;"></span>실적수량 <span style="margin-left: 10px;"><input type="text"></span>
            </div>
                <!-- 합계 출력부 종료 -->
        </container3>
      
</body>
</html>