<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<style>
a {
	text-decoration: none;
}

#wrap {
	width: 1400px;
	height: 450px;
	border: 1px solid black;
}

#searchBox {
	width: 100%;
	height: 23%;
	border: 1px solid black;
}

#button {
	margin-top: 3%;
	margin-right: 3%;
	text-align: right;
}

#search {
	margin-left: 30px;
}

#view {
	width: 1400px;
	height: 800px;
	/* overflow: scroll; */
}
</style>
</head>
<body>
<form name="select" action="member/regbilling.do" method="get">
	<div id="wrap">
		<div id="searchBox">
			<table id="search">
				<tr>
					<td>소요예정일</td>
					<td colspan="2" style="width: 80px;"><input type="date"
						id="reqInput" style="width: 100%;" /></td>
					<td>~</td>
					<td><input type="date" id="reqInput" style="width: 100%;" /></td>
					<td></td>
				</tr>
			</table>
			<div id="button">
				<button>조회</button>
				<button onClick="sendToParent();">적용</button>
				<button>취소</button>
			</div>
		</div>
		<div id="view">
			<table style="width: 100%;">
				<thead align="center" style="background-color: gray">
					<td><input type="checkbox" name="content" onclick="selectAll(this)"/></td>
					<td>소요일자</td>
					<td>발주예정일</td>
					<td>품번</td>
					<td>품명</td>
					<td>규격</td>
					<td>단위</td>
					<td>소요수량</td>
				</thead>
				<c:forEach var="mrp" items="${mrpamount}">
					<tr align="center">
						<td><input type="checkbox" name="content" /></td>
						<td><input id="need_date" type="date" value="${mrp.need_date}" /></td>
						<td><input type="text" value="${mrp.expected_order}" /></td>
						<td><input id="item_Code" type="text" value="${mrp.item_Code}" /></td>
						<td><input id="item_Name" type="text" value="${mrp.item_Name}" /></td>
					<td style="width:33%"><input type="text" value="${mrp.standard}"style="width:100%"/></td>
					<td style="width:33%"><input type="text" value="${mrp.inventory_unit}" style="width:100%"/></td>
						<td><input id="expected_quantity" type="text" value="${mrp.expected_quantity}" /></td>
					</tr>
				</c:forEach>
			</table>			
		</div>
	</div>
<script type="text/javascript">
function sendToParent(){
    var text_Code = document.getElementById("item_Code").value;
    var text_Name = document.getElementById("item_Name").value;
    
    opener.document.getElementById("item_Code").value=text_Code;
    opener.document.getElementById("item_Name").value=text_Name;
    
    window.close();
}   
</script>
</form>
</body>
</html>