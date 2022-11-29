<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	left: 18%;
}

#MRPTable {
	width: 100%;
	text-align: center;
	border: 1px solid black;
}

#total {
	position: absolute;
	bottom: 0;
	left: 0;
	width: 100%;
	text-align: center;
}

#total input {
	width: 7.7%;
	text-align: justify;
	border-style: none;
	background-color: rgb(223, 223, 223);
}

#total td {
	margin: 0;
	padding: 0;
}

#contents1 div {
	position: absolute;
	right: 20px;
	top: 10px;
}
#MrpInfo{
    overflow: scroll;
    height: 100%;
    width: 100%;
}
#button {
	margin-top: 3%;
	margin-right: 3%;
	text-align: right;
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
			<td>계획기간</td>
			<td colspan="2" style="width: 50px;"><input type="date"
				id='searchStartDate' style="width: 100%;" /></td>
			<td>~</td>
			<td><input type="date" id='searchEndDate' style="width: 100%;" /></td>
			<td></td>
		</tr>
	</table>
	</container1>
	<container2 id=contents2>
	<div id="MrpInfo">
<form id="MRP" mehtod="get" commandName="ListVO">
	<table id="MRPTable">
		<thead align="center" style="background-color: gray">
			<td>구분</td>
  			<td>모품목</td>
			<td>품번</td>
			<td>품명</td>
			<td>규격</td>
			<td>납기일</td>
			<td>예정발주일</td>
			<td>예정수량</td>
			<td>단위</td>
		</thead>
		<tbody>
		<c:forEach var="mrp" items="${mrpList}" varStatus="status">
			<tr align="center">
				<td><input type="text" name="ListVO[${status.index}].division" value='${mrp.bomVO.division}' readonly/></td>
				<td><input type="text" name="ListVO[${status.index}].parent" value='${mrp.bomVO.parent}' readonly/></td>
				<td><input type="text" name="ListVO[${status.index}].item_Code" value='${mrp.item_Code}' readonly/></td>
				<td><input type="text" name="ListVO[${status.index}].item_Name" value='${mrp.item_Name}' readonly/></td>
				<td><input type="text" name="ListVO[${status.index}].standard" value='${mrp.standard}' readonly/></td>
				<td><input type="date" name="ListVO[${status.index}].dueDate" value='${mrp.dueDate}' readonly /></td>
				<td><input type="date" name="ListVO[${status.index}].expectedDate" value='${mrp.expectedDate}' readonly/></td>
 				<td><input type="text" name="ListVO[${status.index}].expected_quantity" value='${mrp.expected_quantity}'/></td>
				<td><input type="text" name="ListVO[${status.index}].inventory_unit" value='${mrp.inventory_unit}' readonly/></td>
			</tr>	
		</c:forEach>
		</tbody>
	</table>
	</div>
	</container2>
</form>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

/* 검색부 date onChange 함수 설정 */
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
	view_button.onclick = function() {
		if (startDate == null && endDate == null) {
			alert("시작일과 종료일은 필수 입력 요소입니다!");
		} else if (startDate == null) {
			alert("시작일은 필수 입력 요소입니다!");
		} else if (endDate == null) {
			alert("종료일은 필수 입력 요소입니다!");
		} else if (startDate > endDate) {
			alert("종료일은 시작일보다 커야합니다!");
		} else {

			const URLSearch = new URLSearchParams(location.search);
			URLSearch.set('startDate', startDate);
			URLSearch.set('endDate', endDate);
			const newParam = URLSearch.toString();

			window.open(location.pathname + '?' + newParam, '_self');
		}
	}
</script>
</body>
</html>