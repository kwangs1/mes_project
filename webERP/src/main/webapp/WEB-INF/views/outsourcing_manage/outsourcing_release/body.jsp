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
            height: 76%;
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
        /* 컨테이너 파트 종료 */

        /* 출력부 스타일*/
        #detailPrint1{
            border: 1px solid;
        }

        #detailPrint2{
            border: 1px solid;
            height: 7%;
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
    
                        <td colspan="5" style="width: 80px;">부서</td>
                        <td style="width: 80px;"><input type="text" style="width: 100%; background-color: yellow;"/></td>
                        <td><input type="text" name="" disabled/></td>
                        <td> <i class="fas fa-search" style="color: blue;"></i></td>
                        
                    </tr>
                    
                    <tr>
                        <td>출고기간</td>
                        <td colspan="2" style="width: 50px;"><input type="date" style="width: 100%; background-color: yellow;"/></td>
                        <td>~</td>
                        <td ><input type="date" style="width: 100%; background-color: yellow;"/></td>
                        <td></td>
    
                        <td colspan="5" style="width: 80px;">사원</td>
                        <td style="width: 80px;"><input type="text" style="width: 100%; background-color: yellow;"/></td>
                        <td><input type="text" name="" disabled/></td>
                        <td > <i class="fas fa-search" style="color: blue;"></i></td>

                        <td>
                            <input type="button" value="출고요청" style="padding: 5px; margin-left: 30px;"></input>
                        </td>
                        <td>
                            <input type="button" value="일괄적용" style="padding: 5px;"></input>
                        </td>
                        <td>
                            <input type="button" value="재고확인" style="padding: 5px;"></input>
                        </td>
                    </tr>
                </table>
            </form>
        </container1>

        <container2 id="contents2">
            <!-- 디테일부 -->
            <div id="MDDetail">
                <table id="MDDetailTable">
                    <thead>
                        <td><input type="checkbox" name="content" onclick="selectAll(this)"/></td>
                        <td>출고번호</td>
                        <td>출고일자</td>
                        <td>출고창고</td>
                        <td>출고장소</td>
                        <td>공정</td>
                        <td>작업장</td>
                        <td>비고</td>
                    </thead>
                    <!-- 테스트용 데이터, 추후 표현식으로 수정필요 -->
                    <tbody>
                        <c:forEach var="outRelease" items="${outReleaseView}" varStatus="status" >     
						   <tr align="center">
						   	  <td><input type="checkbox" name="content" value="${outRelease.forwardingNumber}"/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].forwardingNumber" value = '${outRelease.forwardingNumber}' /></td>
						   	  <td><input type="date" name="ListVO[${status.index}].forwardingDate" value = '${outRelease.forwardingDate}' /></td>
						   	  <td><input type="text" name="ListVO[${status.index}].houseCode" value = '${outRelease.houseCode}'/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].locationCode" value = '${outRelease.locationCode}'/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].outsourcingCode" value = '${outRelease.outsourcingCode}'/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].workplaceCode" value = '${outRelease.workplaceCode}'/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].note" value = '${outRelease.note}'/></td>
						    </tr>
						    </c:forEach> 
						
						    <tr align="center">
						     <td><input type="checkbox" value = "check1" name="content"/></td>
						    	<td><input type="text" name="ListVO[${fn:length(outReleaseView) }].forwardingNumber" /></td>
						    	<td><input type="date" name="ListVO[${fn:length(outReleaseView) }].forwardingDate" /></td>
						    	<td><input type="text" name="ListVO[${fn:length(outReleaseView) }].houseCode"  value='${param.houseCode }'/></td>
						    	<td><input type="text" name="ListVO[${fn:length(outReleaseView) }].locationCode"  value='${param.locationCode }'/></td>
						    	<td><input type="text" name="ListVO[${fn:length(outReleaseView) }].outsourcingCode" value='${param.outsourcingCode }' /></td>
						    	<td><input type="text" name="ListVO[${fn:length(outReleaseView) }].workplaceCode" value='${param.workplaceCode }' /></td>
						    	<td><input type="text" name="ListVO[${fn:length(outReleaseView) }].note" value='${param.note }' /></td>
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
                            <td>NO.</td>
                            <td>품번</td>
                            <td>품명</td>
                            <td>규격</td>
                            <td>단위</td>
                            <td>요청수량</td>
                            <td>출고수량</td>
                            <td>비고</td>
                        </thead>
                        <!-- 테스트용 데이터, 추후 표현식으로 수정필요 -->
                        
                        <tbody>
                        <c:forEach var="outReleaseDetail" items="${outReleaseViewDetail}" varStatus="status" >     
						   <tr align="center">
						   	  <td><input type="checkbox" name="content" value="${outReleaseDetail.no}"/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].no" value = '${outReleaseDetail.no}' /></td>
						   	  <td><input type="text" name="ListVO[${status.index}].itemCode" value = '${outReleaseDetail.itemCode}' /></td>
						   	  <td><input type="text" name="ListVO[${status.index}].itemName" value = '${outReleaseDetail.itemName}' /></td>
						   	  <td><input type="text" name="ListVO[${status.index}].standard" value = '${outReleaseDetail.standard}'/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].inventoryUnit" value = '${outReleaseDetail.inventoryUnit}'/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].precisionQuantity" value = '${outReleaseDetail.precisionQuantity}'/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].forwardingQuantity" value = '${outReleaseDetail.forwardingQuantity}'/></td>
						   	  <td><input type="text" name="ListVO[${status.index}].noteDetail" value = '${outReleaseDetail.noteDetail}'/></td>
						    </tr>
						    </c:forEach> 
						
						    <tr align="center">
							     <td><input type="checkbox" value = "check1" name="content"/></td>
							    	<td><input type="text" name="ListVO[${fn:length(outReleaseViewDetail) }].no" readonly/></td>
							    	<td><input type="text" name="ListVO[${fn:length(outReleaseViewDetail) }].itemCode" value='${param.itemCode }' ondblclick="search2()"/></td>
							    	<td><input type="text" name="ListVO[${fn:length(outReleaseViewDetail) }].itemName" value='${param.itemName }' readonly/></td>
							    	<td><input type="text" name="ListVO[${fn:length(outReleaseViewDetail) }].standard" value='${param.standard }' readonly/></td>
							    	<td><input type="text" name="ListVO[${fn:length(outReleaseViewDetail) }].inventoryUnit" value='${param.inventoryUnit }' readonly/></td>
							    	<td><input type="text" id = "precisionQuantity" name="ListVO[${fn:length(outReleaseViewDetail) }].precisionQuantity"  value='${param.precisionQuantity}'/></td>
							    	<td><input type="text" id = "forwardingQuantity" name="ListVO[${fn:length(outReleaseViewDetail) }].forwardingQuantity"  value='${param.forwardingQuantity}'/></td>
							    	<td><input type="text" name="ListVO[${fn:length(outReleaseViewDetail) }].note" value='${param.noteDetail }'/></td>
							    </tr>
                        </tbody>
                    </table>
                    <!-- 출력부 1 -->
                    
                </div>
                 <!-- 합계 출력부 -->
                 
                 <div id="resultWindow">
                    요청수량 <span style="margin-left: 100px;"></span>출고수량 <input type="text"><span style="margin-left: 100px;"></span>
                </div>
                    <!-- 합계 출력부 종료 -->
                    
                    <div id="detailPrint1">
                        관리구분 <input type="text" name="controlCondition" style="width: 75px;"><input type="button" value="검"><input type="text" name="ckfactory" style="width: 75px;" disabled>
                        지시수량 <input type="text" name="printQuantity" disabled><br>
                        모품목 <input type="text" name="parentItem" disabled><input type="button" value="검">
                        모품목명 <input type="text" name="parentItemName" disabled> 지시번호 <input type="text" name="num" disabled>
                    </div>
                    <!-- 출력부 1 종료 -->
                    <!-- 출력부 2 -->
                    
            <div id="detailPrint2">
                재고    사업장별 현재고 <input type="text" name="stockPerFactory">
                창고/장소별 현재고 <input type="text" name="stockPerCargo">
            </div>
            <!-- 출력부 2 종료 -->
            
        </container3>
       
</body>
</html>