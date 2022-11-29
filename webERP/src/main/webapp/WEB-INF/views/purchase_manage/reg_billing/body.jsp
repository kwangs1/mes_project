<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
String sequence = (String)request.getAttribute("sequence");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
	function func_Popup(){
		var url = "mrpamount.do";
		var name = "mrpamount";
		var option = "width = 1500, height= 600, top = 100, left = 200"
		window.open(url, name, option);
	}
</script>
<style>
#contents1 {
	position: absolute;
	padding: 10px;
	right: 0;
	top: 15%;
	width: 85%;
	height: 10%;
	border: 1px solid black;
	z-index: 1;
}

#contents2 {
	position: absolute;
	right: 0;
	top: 25%;
	width: 85%;
	height: 35%;
	border: 1px solid black;
	z-index: 1;
}

#contents3 {
	position: absolute;
	right: 0;
	top: 60%;
	width: 85%;
	height: 35%;
	border: 1px solid black;
	z-index: 1;
}

.con1_search {
	padding: 0;
	text-align: center;
	position: absolute;
	top: 25%;
	left: 18%;
}

 #view2 {
	width: 100%;
	text-align: center;
	border: 1px solid black;
}

#total {
	position: absolute;
	bottom: 0;
	right: 0;
}

#button {
	position: absolute;
	top: 10px;
	right: 20px;
}

#contents3 {
	 overflow: scroll; 
	
}

#total td {
	width: 10%;
}

#total td input {
	width: 100%;
}

#reqInput {
	background-color: rgb(255, 255, 149);
	text-align: center;
}

#BillingInfo {
 	overflow: scroll;
	height: 100%;
	width: 100%;
}
#BillingTable {
	width: 100%;
	text-align: center;
	border: 1px solid black;
}
</style>
</head>
<body>
	<container1 id=contents1>
	<table class="con1_search">
		<tr>
			<td>사업장</td>
			<td style="width: 50px;"><input type="text" id="reqInput"
				style="width: 100%;" /></td>

			<td colspan="3"><input type="text" name="" disabled
				style="width: 100%;" /></td>
			<td><i class="fas fa-search" style="color: blue;"></i></td>
			<td colspan="5" style="width: 50px;">부서</td>
			<td style="width: 80px;"><input type="text" id="reqInput"
				style="width: 100%;" /></td>
			<td><input type="text" name="" disabled /></td>
			<td><i class="fas fa-search" style="color: blue;"></i></td>

		</tr>
		<tr>
			<td>요청일자</td>
			<td colspan="2" style="width: 80px;"><input type="date"
				id="reqInput" style="width: 100%;" /></td>
			<td>~</td>
			<td><input type="date" id="reqInput" style="width: 100%;" /></td>
			<td colspan="2" style="width: 50px;"><input type="date"
				id='searchStartDate' style="width: 100%;" /></td>
			<td>~</td>
			<td><input type="date" id='searchEndDate' style="width: 100%;" /></td>
			<td></td>
			<td colspan="5">사원</td>
			<td style="width: 80px;"><input type="text" id="reqInput"
				style="width: 100%;" /></td>
			<td><input type="text" name="" disabled /></td>
			<td><i class="fas fa-search" style="color: blue;"></i></td>
		</tr>
	</table>
	<div id="button">
		<input type="button" id="Popup" onclick="func_Popup();" value="소요량적용" />
	</div>
	</container1>
	<container2 id="contents2">
	<table id="view1">
		<thead align="center" style="background-color: gray">
			<td><input type="checkbox" name="content"/></td>
			<td>청구번호</td>
			<td>청구일자</td>
			<td>청구구분</td>
			<td>비고</td>
		</thead>
		<c:forEach var="cm" items="${cmList}">
			<tr align="center">
				<td><input type="checkbox" name="content" /></td>
				<td>${cm.claim_no}</td>
				<td>${cm.claim_date}</td>
				<td>${cm.claim_division}</td>
				<td>${cm.note}</td>
			</tr>
		</c:forEach>
	</table>
	</container2>
	<container3 id="contents3">
	<table id="view2">
				<thead align="center" style="background-color: gray">
			<td><input type="checkbox" name="content"/></td>
			<td>순서</td>
		<input type="button" onclick="MrpAmount();" value="소요량적용">
	</div>
	</container1>
	<container2 id="contents2">
<div id="BillingInfo">
<form id="Billing" mehtod="get" commandName="ListVO">
	<table id="BillingTable">
		<thead align="center" style="background-color: gray">
			<td><input type="checkbox" name="content"/></td>
			<td>순서</td>
			<td>청구번호</td>
			<td>청구일자</td>
			<td>청구구분</td>
			<td>품번</td>
			<td>품명</td>
			<td>규격</td>
			<td>요청일</td>
			<td>재고단위</td>
			<td>재고단위수량</td>
			<td>청구단위</td>
			<td>청구단위수량</td>
			<td>주거래처</td>
		</thead>
		<c:forEach var="btm" items="${bottomList}">
			<tr align="center">
				<td><input type="checkbox" name="content" /></td>
				<td>${btm.sequence}</td>
					<td>${btm.itemNumber}</td>
					<td>${btm.itemName}</td>
					<td>${btm.standard}</td>
					<td>${btm.requestdate}</td>
					<td>${btm.inventory_unit}</td>
					<td>${btm.inventory_qy}</td>
					<td>${btm.claim_unit}</td>
					<td>${btm.claim_quantity}</td>
					<td>${btm.buyer}</td>
			</tr>
		</c:forEach>
	</table>
			<td>재고단위수량</td>
			<td>청구단위수량</td>
			<td>주거래처</td>
			<td>비고</td>
		</thead>
		<tbody>
		<c:forEach var="cm" items="${cmList}" varStatus="status">
			<tr align="center">
				<td><input type="checkbox"name="content" value="${cm.sequence}"/></td>
			<td style="width:13px;"><input type="text" name="ListVO[${status.index}].sequence" value = '${cm.sequence}'readonly style="width:100%"/></td>
			<td><input type="text" name="ListVO[${status.index}].claim_no" value = '${cm.claim_no}' readonly/></td>
			<td><input type="date" name="ListVO[${status.index}].claim_date" value = '${cm.claim_date}'  style="width:100%"/></td>
			<td><input type="text" name="ListVO[${status.index}].claim_division" value = '${cm.claim_division}' /></td>
			<td><input type="text" name="ListVO[${status.index}].item_Code" value="${cm.item_Code}" readonly/></td>
			<td><input type="text" name="ListVO[${status.index}].item_Name" value="${cm.item_Name}" readonly/></td>
			<td><input type="text" name="ListVO[${status.index}].standard" value="${cm.standard}" readonly style="width:100%"/></td>
			<td><input type="date" name="ListVO[${status.index}].requestdate" value="${cm.requestdate}" style="width:100%"/></td>
			<td><input type="text" name="ListVO[${status.index}].inventory_qty" value="${cm.inventory_qty}" /></td>
			<td><input type="text" name="ListVO[${status.index}].claim_quantity" value="${cm.claim_quantity}" /></td>
			<td><input type="text" name="ListVO[${status.index}].buyer"  value="${cm.buyer}" /></td>
			<td><input type="text" name="ListVO[${status.index}].note" value = '${cm.note}' style="width:100%"/></td>
			</tr>
		</c:forEach>
		<tr align="center">
		<td></td>
			<td style="width:13px;"><input type="text" id="sequence" name="ListVO[${fn:length(cmList) }].sequence" value='${sequence}' readonly style="width:100%"/></td>
			<td><input type="text" id="claim_no" name="ListVO[${fn:length(cmList) }].claim_no" value='${claim_no}' readonly/></td>
			<td><input type="date" id="claim_date" name="ListVO[${fn:length(cmList) }].claim_date" value='${claim_date}' style="width:100%"/></td>
			<td><input type="text" id="claim_division" name="ListVO[${fn:length(cmList) }].claim_division" value='${claim_division}' /></td>
			<td><input type="text" id="item_Code" name="ListVO[${fn:length(cmList) }].item_Code" value='${item_Code}' readonly/></td>
			<td><input type="text" id="item_Name" name="ListVO[${fn:length(cmList) }].item_Name" value='${item_Name}' readonly/></td>
			<td><input type="text" id="standard" name="ListVO[${fn:length(cmList) }].standard" value='${standard}'readonly style="width:100%"/></td>
			<td><input type="date" id="requestdate" name="ListVO[${fn:length(cmList) }].requestdate" value='${requestdate}'/></td>
			<td><input type="text" id="inventory_qty" name="ListVO[${fn:length(cmList) }].inventory_qty" value='${inventory_qty}' /></td>
			<td><input type="text" id="claim_quantity" name="ListVO[${fn:length(cmList) }].claim_quantity" value='${claim_quantity}' /></td>		
			<td><input type="text" id="buyer" name="ListVO[${fn:length(cmList) }].buyer" value='${buyer}'/></td>			
			<td><input type="text" id="note" name="ListVO[${fn:length(cmList) }].note" value='${note}'/></td>
		</tr>
	</tbody>
	</table>
	</div>
	</container2>
	<container3 id="contents3">
	<div id="total">
		<table>
			<tr>
				<td>발주수량합계</td>
				<td><input type="text" disabled /></td>
				<td>공급가합계</td>
				<td><input type="text" disabled /></td>
				<td>공급가합계</td>
				<td><input type="text" disabled /></td>
				<td>공급가합계</td>
				<td><input type="text" disabled /></td>
				<td>공급가합계</td>
				<td><input type="text" disabled /></td>
			</tr>
			<tr>
				<td>현재고</td>
				<td><input type="text" disabled /></td>
				<td>가용재고</td>
				<td><input type="text" disabled /></td>
				<td>입고예정량</td>
				<td><input type="text" disabled /></td>
			</tr>
		</table>
	</div>
	</container3>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
var windowObj;

function MrpAmount(){	
	window.name = "/member/regbilling.do";
	var settings ='width=1400, height=500, resizable = no, scrollbars = no';

	windowObj = window.open("mrpamount.do","mrpamount",settings);
	
	var txt_code = document.getelementById("item_Code");
	var txt_Name = document.getelementById("item_Name");
	
	document.getElementById('item_Code').value= windowObj.document.getElementById("item_Code").value;  
	document.getElementById('item_Name').value= windowObj.document.getElementById("item_Name").value;  
}

function deleteRow() {
	  var item = document.getElementsByName("content").length;
	  var no = "";
	  var ary = [];
	  for(var i=0; i<item;i++){
		  if(document.getElementsByName("content")[i].checked==true){
			  sequence = document.getElementsByName("content")[i].value;
			  ary.push(sequence);
		  }
		  
			  window.location.href = "${contextPath}/member/delbilling.do?sequence="+ary;
	  }
}

function updateRow() {
	const URLSearch = new URLSearchParams(location.search);
	const newParam = URLSearch.toString();
	var link = location.pathname + '?' + newParam;
document.getElementById("sequence").disabled = true;
document.getElementById("claim_no").disabled = true;		
document.getElementById("claim_date").disabled = true;
document.getElementById("claim_division").disabled = true;
document.getElementById("item_Code").disabled = true;
document.getElementById("item_Name").disabled = true;
document.getElementById("standard").disabled = true;
document.getElementById("requestdate").disabled = true;
document.getElementById("inventory_qty").disabled = true;
document.getElementById("claim_quantity").disabled = true;
document.getElementById("buyer").disabled = true;
document.getElementById("note").disabled = true;
var Input = document.createElement("input");
Input.setAttribute("type", "hidden");
Input.setAttribute("name", "path");
Input.setAttribute("value", link);
document.getElementById('Billing').appendChild(Input);
document.getElementById('Billing').action = "${contextPath}/member/updatebilling.do";
document.getElementById('Billing').submit();
}

function InsertRow(){
	const URLSearch = new URLSearchParams(location.search);
	const newParam = URLSearch.toString();
	var link = location.pathname + '?' + newParam;
	var Input = document.createElement("input");
	Input.setAttribute("type", "hidden");
	Input.setAttribute("name", "path");
	Input.setAttribute("value", link);
	document.getElementById('Billing').appendChild(Input);
	document.getElementById('Billing').action = "${contextPath}/member/addbilling.do";
	document.getElementById('Billing').submit();

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
   	
   	 /* 조회버튼 클릭시 기능 구현 */
       view_button.onclick = function(){
 		  if(startDate>endDate){
 			  alert(" 종료일은 시작일보다 작을수 없습니다.");
 		  } else{
 			  
     	  const URLSearch = new URLSearchParams(location.search);
 		  URLSearch.set('startDate', startDate);
 		  URLSearch.set('endDate', endDate);
 		  const newParam = URLSearch.toString();

 		  window.open(location.pathname + '?' + newParam, '_self');
 		  }
   	}
       
</script>
</form>
</body>
</html>