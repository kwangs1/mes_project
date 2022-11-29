<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
request.setCharacterEncoding("UTF-8");
%>
<%
String dueDate = (String) request.getAttribute("dueDate");
%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
#contents1 {
	position: absolute;
	left: 15%;
	top: 15%;
	width: 85%;
	height: 10%;
	border: 1px solid black;
	z-index: 1;
}

#contents2 {
	position: absolute;
	left: 15%;
	top: 25%;
	width: 85%;
	height: 70%;
	border: 1px solid black;
	z-index: 1;
	overflow: scroll;
}

.con1_search {
	padding: 0;
	text-align: center;
	position: absolute;
	top: 30%;
	left: 25%;
}

#rsTable {
	width: 100%;
	text-align: center;
	border: 1px solid black;
}

#rsSum {
	position: absolute;
	right: 0;
	bottom: 0;
}

#reqInput {
	background-color: rgb(255, 255, 149);
	text-align: center;
}
</style>
<script>
window.onload = function(){
	l_sub1.style.position = "relative";
    l_sub2.style.display = "block";
    l_sub2.style.marginLeft = "10px";
}
</script>
</head>
<body>
	<container1 id=contents1>
	<form id="searchForm">
		<table class="con1_search">
			<tr>
				<td colspan="">출고일자 범위를 입력 해주세요</td>
				<td colspan="3" style="width: 80px;">
				<input type="date" id="searchStartDate" value="${param.startDate }" style="width: 100%; background-color:rgb(255,255,149);" />
				</td>
				<td>~</td>
				<td>
				<input type="date" id="searchEndDate" value="${param.endDate }"style="width: 100%; background-color:rgb(255,255,149);" />
				</td>
			</tr>
		</table>
	</form>
	</container1>
	<form id="regRs" method="get" commandName="ListVO">
		<container2 id=contents2>
		<div id="rsInfo">
			<table id="rsTable">
				<thead>
					<td>출고번호</td>
					<td>출고일자</td>
					<td>고 객</td>
					<td>품 번</td>
					<td>품 명</td>
					<td>납기일</td>
					<td>주문수량</td>
					<td>단 가</td>
					<td></td>
					<td>공급가</td>
					<td>부가세</td>
					<td>공급대가</td>
					<td>출고구분</td>
				</thead>
				<c:set var = "qtot" value="0" />
				<c:set var = "ptot" value="0" />
				<c:set var = "vtot" value="0" />
				<c:set var = "pvtot" value="0" />
				<c:forEach var="rs" items="${rsView }" varStatus="status">
				<tr>
					<td><input type="text" id="releaseNum" value='${rs.rsjVO.releaseNum }' readonly/></td>
					<td><input type="text" id="releaseDate" value='${rs.rsjVO.releaseDate }' readonly/></td>
					<td><input type="text" id="customerCode" value='${rs.rsjVO.customerCode }' readonly/></td>
					<td><input type="text" id="itemCode"  value='${rs.itemCode }' readonly/></td>
					<td><input type="text" id="itemName"  value='${rs.itemName }' readonly/></td>
					<td><input type="text" id="dueDate"  value='${rs.dueDate }' readonly/></td>
					<td><input type="text" id="ordersQuantity"  value='${rs.ordersQuantity }' readonly/></td>
					<td><input type="text" id="productPrice"  value='${rs.productPrice }' readonly/></td>
					<td><input type="hidden" id="vatPrice"  value='${rs.vatPrice }' readonly/></td>
					<td><input type="number" id="totPrice" value='${rs.ordersQuantity * rs.productPrice }' readonly/></td>
					<td><input type="number" id="vat" value='${rs.ordersQuantity * rs.vatPrice}' readonly/></td>
					<td><input type="number" id="totVatPrice" value='${(rs.ordersQuantity * rs.productPrice) + (rs.ordersQuantity * rs.vatPrice)}' readonly/>
					<td><input type="text" id="orderOX" name="ListVO[${fn:length(rsView) }].orderOX" value='${rs.orderOX }' readonly/></td>
				</tr>
				<c:set var="qtot" value="${qtot + rs.ordersQuantity}" />
				<c:set var="ptot" value="${ptot + rs.ordersQuantity * rs.productPrice}" />
				<c:set var="vtot" value="${vtot + rs.ordersQuantity * rs.vatPrice}" />
				<c:set var="pvtot" value="${pvtot + ((rs.ordersQuantity * rs.productPrice) + (rs.ordersQuantity * rs.vatPrice))}" />
				</c:forEach>
			</table>
		</div>
		
		<div id="rsSum">
			수량합계: <input type="text" disabled value= <c:out value="${qtot }" /> style="text-align:center"/>
			공급가 합계: <input type="text" disabled value= <c:out value="${ptot }"/> style="text-align:center"/>
			부가세 합계: <input type="text" disabled value= <c:out value="${vtot }"/> style="text-align:center"/>
			합계액: <input type="text" disabled value= <c:out value="${pvtot }"/> style="text-align:center"/>
		</div>
		
		</container2>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script>
			var startDate = new Date().toISOString().substring(0,10);;
			var endDate = new Date().toISOString().substring(0,10);;
			
			$('#searchStartDate').change(function(){
				var date = $('#searchStartDate').val();
				startDate = date;
			});
			$('#searchEndDate').change(function(){
				var date = $('#searchEndDate').val();
				endDate = date;
			});
			
			view_button.onclick = function(){
				if(startDate>endDate){
					alert("지시기간 종료일은 시작일보다 작을 수 없습니다.");
				} else{
					const URLSearch = new URLSearchParams(location.search);
					URLSearch.set('submit',"1")
					URLSearch.set('startDate',startDate);
					URLSearch.set('endDate',endDate);
					const newParam = URLSearch.toString();
					
					window.open(location.pathname + '?' + newParam, '_self');
				}
			}
		</script>
	</form>
</body>
</html>