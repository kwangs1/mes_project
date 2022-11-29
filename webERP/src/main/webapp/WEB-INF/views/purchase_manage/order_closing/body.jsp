<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
String sequence = (String) request.getAttribute("sequence");
%>
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
}

.con1_search {
	padding: 0;
	text-align: center;
	position: absolute;
	top: 25%;
	left: 15%;
}

#OrderClosingTable {
	width: 100%;
	text-align: center;
	border: 1px solid black;
}

#contents2 div {
	position: absolute;
	right: 0;
	bottom: 0;
}

#button {
	margin-top: 3%;
	margin-right: 3%;
	text-align: right;
}

#view {
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
	<container1 id=contents1>
	<table class="con1_search">
		<tr>
			<td>발주기간</td>
			<td colspan="2" style="width: 50px;"><input type="date"
				id='searchStartDate' style="width: 100%;" /></td>
			<td>~</td>
			<td><input type="date" id='searchEndDate' style="width: 100%;" /></td>
		</tr>
	</table>
	<div id="button">
		<input type="button" onClick="func_DeadLine()" value="마감처리" />
	</div>
	</container1>
	<container2 id=contents2>
	<div id=view>
		<form id="OrderClosing" mehtod="get" commandName="ListVO">
			<table id="OrderClosingTable">
				<thead align="center" style="background-color: gray">
					<td><input type="checkbox" name="content" /></td>
					<td>발주번호</td>
					<td>발주일자</td>
					<td>거래처명</td>
					<td>No</td>
					<td>품번</td>
					<td>품명</td>
					<td>규격</td>
					<td>단위</td>
					<td>발주수량</td>
					<td>마감</td>
					<td>단가</td>
 	 				<td>공급가</td>
					<td>부가세</td>
					<td>합계액</td>
					<td>비고</td>
				</thead>
				<tbody>
					<c:forEach var="OrderClosing" items="${ClosingList}"
						varStatus="status">
						<tr align="center">
				<td><input type="checkbox" name="content" value="${OrderClosing.sequence}" /></td>
				<td><input type="text" name="ListVO[${status.index}].order_no" value='${OrderClosing.order_no}' readonly /></td>
				<td><input type="date" name="ListVO[${status.index}].order_date" value='${OrderClosing.order_date}' /></td>
				<td><input type="text" name="ListVO[${status.index}].general_Customer_Name" value='${OrderClosing.general_Customer_Name}' readonly /></td>
				<td style="width: 33px;"><input type="text" value='${OrderClosing.sequence}' readonly style="width: 100%" /></td>
				<td><input type="text" name="ListVO[${status.index}].item_Code" value='${OrderClosing.item_Code}'  readonly  /></td>
				<td><input type="text" name="ListVO[${status.index}].item_Name" value='${OrderClosing.item_Name}' readonly  /></td>
				<td><input type="text" name="ListVO[${status.index}].standard" value='${OrderClosing.standard}' style="width: 100%" readonly /></td>
				<td><input type="text" name="ListVO[${status.index}].inventory_unit" value='${OrderClosing.inventory_unit}' readonly /></td>
				<td><input type="text" name="ListVO[${status.index}].order_quantity" value='${OrderClosing.order_quantity}' /></td>
				<td><input type="text" name="ListVO[${status.index}].deadline" value='${OrderClosing.deadline}' readonly/></td>
				<td><input type="text" name="ListVO[${status.index}].cost" value='${OrderClosing.cost}' /></td>
				<td><input type="text" value = '${OrderClosing.order_quantity*OrderClosing.cost}' readonly/></td>
				<td><input type="text" value = '${OrderClosing.order_quantity*OrderClosing.cost*0.1}' readonly/></td>
				<td><input type="text" value = '${OrderClosing.order_quantity*OrderClosing.cost+(OrderClosing.order_quantity*OrderClosing.cost*0.1)}' readonly/></td>
				<td><input type="text" name="ListVO[${status.index}].note" value='${OrderClosing.note}' /></td>
						</tr>
					</c:forEach>
				<tr align="center">
					<td></td>
				<td><input type="text" id="order_no"  value='${order_no}' readonly/></td>
				<td><input type="date" id="order_date" name="ListVO[${fn:length(ClosingList) }].order_date" value='${order_date}' /></td>
		<td><input type="text" id="general_Customer_Name" name="ListVO[${fn:length(ClosingList) }].general_Customer_Name" value='${general_Customer_Name}' ondblclick="search2()" readonly style="background-color:#E6E6FA"/></td>
				<td><input type="text" id="sequence"  value='${sequence}' style="width: 100%" readonly/></td>
				<td><input type="text" id="item_Code" name="ListVO[${fn:length(ClosingList) }].item_Code" value='${item_Code}' ondblclick="search1()" readonly  style="background-color:#E0FFFF"/></td>
				<td><input type="text" id="item_Name" name="ListVO[${fn:length(ClosingList) }].item_Name" value='${item_Name}' ondblclick="search1()" readonly  style="background-color:#E0FFFF"/></td>
				<td><input type="text" id="standard" name="ListVO[${fn:length(ClosingList) }].standard" value='${standard}' style="width: 100%" /></td>
				<td><input type="text" id="inventory_unit" name="ListVO[${fn:length(ClosingList) }].inventory_unit" value='${inventory_unit}'readonly /></td>
				<td><input type="text" id="order_quantity" name="ListVO[${fn:length(ClosingList) }].order_quantity" value='${order_quantity}' /></td>
				<td><input type="text" id="deadline" name="ListVO[${fn:length(ClosingList) }].deadline" value='${deadline}' readonly/></td>
				<td><input type="text" id="cost" name="ListVO[${fn:length(ClosingList) }].cost" value='${cost}' readonly/></td>
 				<td><input type="text" id="cost" value = '${OrderClosing.order_quantity*OrderClosing.cost}' readonly/></td>
				<td><input type="text" id="cost" value = '${OrderClosing.order_quantity*OrderClosing.cost*0.1}' readonly/></td>
				<td><input type="text" id="cost" value = '${OrderClosing.order_quantity*OrderClosing.cost+(OrderClosing.order_quantity*OrderClosing.cost*0.1)}' readonly/></td> 
				<td><input type="text" id="note" name="ListVO[${fn:length(ClosingList) }].note" value='${note}' /></td>
				</tr>
				</tbody>
			</table>
	</div>
	</container2>
	</form>
</body>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
var order_date = document.getElementById("order_date");
var code = document.getElementById("code");
var general_Customer_Name = document.getElementById("general_Customer_Name");
var item_Code = document.getElementById("item_Code");
var item_Name = document.getElementById("item_Name");
var order_quantity = document.getElementById("order_quantity");
var deadline = document.getElementById("deadline");
var cost = document.getElementById("cost");
var startDate;
var endDate;
   	
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
    	   if(startDate == null && endDate == null){
    	    	alert("시작일과 종료일은 필수 입력 요소입니다!");
    	    } else if(startDate == null) {
    	    	alert("시작일은 필수 입력 요소입니다!");
    	    } else if(endDate == null){
    	    	alert("종료일은 필수 입력 요소입니다!");
    	    } else if(startDate > endDate){
    	    	alert("종료일은 시작일보다 커야합니다!");
 		  } else{
 			  
     	  const URLSearch = new URLSearchParams(location.search);
 		  URLSearch.set('startDate', startDate);
 		  URLSearch.set('endDate', endDate);
 		  const newParam = URLSearch.toString();

 		  window.open(location.pathname + '?' + newParam, '_self');
 		  }
   	}

function newRow(){
	    if(order_date.value == ""){
	       alert("발주일자는 필수 입력사항입니다.");
	       return order_date.focus();
	    }else if(general_Customer_Name.value == ""){
	       alert("회사명은 필수 입력사항입니다.");
	       return general_Customer_Name.focus();
	    }else if(item_Code.value ==""){
	    	alert("품번은 필수 입력사항입니다.");
	    	return item_Code.focus();
	    }else if(item_Name.value ==""){
	    	alert("품명은 필수 입력사항입니다.");
	    	return item_Name.focus();
	    }else if(order_quantity.value ==""){
	    	alert("발주수량은 필수 입력사항입니다.");
	    	return order_quantity.focus();
	    }else{
	const URLSearch = new URLSearchParams(location.search);
	const newParam = URLSearch.toString();
	var link = location.pathname + '?' + newParam;
	var Input = document.createElement("input");
	Input.setAttribute("type", "hidden");
	Input.setAttribute("name", "path");
	Input.setAttribute("value", link);
	document.getElementById('OrderClosing').appendChild(Input);
	document.getElementById('OrderClosing').action = "${contextPath}/member/addClosing.do";
	document.getElementById('OrderClosing').submit();
	}
}

function updateRow() {
	 var UpdConfirm = confirm('수정하실껀가요?');
if(UpdConfirm){
		alert('수정 완료되셨습니다!');
	
	var OrderClosingTable = document.getElementById('OrderClosingTable');
    var row = OrderClosingTable.insertRow(); 
	const URLSearch = new URLSearchParams(location.search);
	const newParam = URLSearch.toString();
	var link = location.pathname + '?' + newParam;
	document.getElementById("order_no").disabled = true;		
	document.getElementById("order_date").disabled = true;
	document.getElementById("general_Customer_Name").disabled = true;
	document.getElementById("sequence").disabled = true;
	document.getElementById("item_Code").disabled = true;
	document.getElementById("item_Name").disabled = true;
	document.getElementById("standard").disabled = true;
	document.getElementById("inventory_unit").disabled = true;
	document.getElementById("order_quantity").disabled = true;
	document.getElementById("deadline").disabled = true;
	document.getElementById("cost").disabled = true;
	document.getElementById("note").disabled = true;
	
	var Input = document.createElement("input");
	Input.setAttribute("type", "hidden");
	Input.setAttribute("name", "path");
	Input.setAttribute("value", link);
	document.getElementById('OrderClosing').appendChild(Input);
	document.getElementById('OrderClosing').action = "${contextPath}/member/updateClosing.do";
	document.getElementById('OrderClosing').submit();
}else{
	alert('수정을 취소하셨습니다!');
	location.reload(true);
	location.href = location.href;

	history.go(0);
	}
}

function deleteData() {
	  var item = document.getElementsByName("content").length;
	  var no = "";
	  var ary = [];
	  for(var i=0; i<item;i++){
		  if(document.getElementsByName("content")[i].checked==true){
			  sequence = document.getElementsByName("content")[i].value;
			  ary.push(sequence);
		  }
	  }
	  if(ary.length === 0 || ary === null){
		  alert('삭제할 칼럼의 체크박스를 선택해주세요!');
	  }else{
		  alert('삭제 되었습니다!');
		  window.location.href = "${contextPath}/member/delClosing.do?sequence="+ary;	 
	  }
}
function func_DeadLine(){
	  var item = document.getElementsByName("content").length;
	  var no = "";
	  var ary = [];
	  for(var i=0; i<item;i++){
		  if(document.getElementsByName("content")[i].checked==true){
			  sequence = document.getElementsByName("content")[i].value;
			  ary.push(sequence);
		  }
	}
	  if(ary.length === 0 || ary === null){
		  alert('마감처리 시킬 칼럼의 체크박스를 선택해주세요!');
	  }else{
		  alert('마감처리 되었습니다!');
		  window.location.href = "${contextPath}/member/updateOrderClosing.do?sequence="+ary; 
	  }
			  
}
function openWindowPop(url, name){
    var options = 'top=0, left=0, width=600, height=420, status=no, menubar=no, toolbar=no, resizable=no';
    window.open(url, name, options);
}


function search1(){ 	  
	      	openWindowPop('${contextPath}/member/itemPop.do','itemPop');
}       
function search2(){ 	  
	      	openWindowPop('${contextPath}/member/buyerPop.do','buyerPop');
}      

</script>
</html>