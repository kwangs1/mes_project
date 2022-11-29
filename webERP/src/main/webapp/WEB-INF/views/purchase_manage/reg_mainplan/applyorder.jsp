<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import ="java.util.Arrays"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
	request.setCharacterEncoding("UTF-8");
	String inputSeq = (String)request.getAttribute("inputSeq");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<style>
a {
	text-decoration: none;
}

#wrap {
	width: 600px;
	height: 400px;
	border: 1px solid black;
}

#searchBox {
	width: 100%;
	height: 23%;
	border: 1px solid black;
}

#button {
	margin-top: -5%;
	margin-right: 3%;
	text-align: right;
}
#view {	
    overflow: scroll;
    height: 77%;
    width: 100%;
    
}
</style>
</head>
<body>
<form name="popForm" method="get">
	<div id="wrap">
		<div id="searchBox">
			<table id="search">
					<tr>
						<td>품목코드</td>
						<td><input type="text" id="code" name="code" /></td>
					</tr>
					<tr>
						<td>품목명</td>
						<td><input type="text" id="name" name="name" class="name" /></td>
					</tr>
					<tr>
						<td><input type="hidden" id="expectedDate" name="ExpDate" /></td>
					</tr>
					<tr>
						<td><input type="hidden" id="general_Customer_Name" name="general_Customer_Name"/></td>
					</tr>
					<tr>
						<td><input type="hidden" id="standard" name="standard"/></td>
					</tr>
					<tr>
						<td><input type="hidden" id="inventory_unit" name="inventory_unit"/></td>
					</tr>
					<tr>
						<td><input type="hidden" id="ordersQuantity" name="ordersQuantity" /></td>
					</tr>
					<tr>
						<td><input type="hidden" id="note" name="note"/></td>
					</tr>
			</table>
			<div id="button">	
				<button id="submit" onclick="submitClick(this.form)">적용</button>
                <input type="hidden" name="inputSeq" value=""/>
			</div>
		</div>
		<div id="view">
			<table style="width: 100%;" id="searchItem">
				<tr align="center">
					<td>품번</td>
					<td>품명</td>
					<td>주문수량</td>
					<td>발주예정일</td>
				</thead>	
				<c:forEach var="MpsOS" items="${mpsosList}">
					<tr align="center" id="searchItem">
					 <td><a href="javascript:popFunction('${MpsOS.item_Code }','${MpsOS.item_Name }','${MpsOS.general_Customer_Name }'
					 ,'${MpsOS.standard }','${MpsOS.inventory_unit }','${MpsOS.note }')">${MpsOS.item_Code}</a></td>
      					  <td><a href="#">${MpsOS.item_Name}</a></td>
      					  <td><a href="#">${MpsOS.ordersQuantity}</a></td>
      					  <td><a href="#">${MpsOS.expectedDate}</a></td>
      					  <td><intput type="hidden" value="${MpsOS.general_Customer_Name}"></td>
      					  <td><intput type="hidden" value="${MpsOS.standard}"></td>
      					  <td><intput type="hidden" value="${MpsOS.inventory_unit}"></td>
      					  <td><intput type="hidden" value="${MpsOS.note}"></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>
<script type="text/javascript">
var submit_button = document.getElementById("submit");
var text_code = document.getElementById("code");
var text_name = document.getElementById("name");
var text_ExpDate = document.getElementById("ExpDate");
var text_general_Customer_Name = document.getElementById("general_Customer_Name");
var text_standard = document.getElementById("standard");
var text_inventory_unit = document.getElementById("inventory_unit");
var text_note = document.getElementById("note");

		
	function popFunction(code,name,general_Customer_Name,standard,inventory_unit,note){
			text_code.value = code;
			text_name.value = name;
			text_general_Customer_Name.value = general_Customer_Name;
			text_standard.value = standard;
			text_inventory_unit.value = inventory_unit;
			text_note.value = note;

			
	}
submit_button.onclick = function(){
		
	text_code.setAttribute("item_Code",text_code.value);
	text_name.setAttribute("item_Name",text_name.value);
	text_general_Customer_Name.setAttribute("general_Customer_Name",text_general_Customer_Name.value);
	text_standard.setAttribute("standard",text_standard.value);
	text_inventory_unit.setAttribute("inventory_unit",text_inventory_unit.value);
	text_note.setAttribute("note",text_note.value);
	
	var url = window.opener.document.location.href;
	var url_arr = url.split('?');
	opener.parent.location=url_arr[0] + '?item_Code='+text_code.value+'&&item_Name='+text_name.value+
	'&&general_Customer_Name='+text_general_Customer_Name.value+'&&standard='+text_standard.value+'&&inventory_unit='+text_inventory_unit.value+
	'&&note='+text_note.value+'&&submit='+0;
	
	window.close();
	}	
//ajax 구문
$('.name').keyup(function(){
//변수 words에 id가 name인것의 값을 저장한다
var words = $('#name').val();
$.ajax({
	type : 'GET',
	url : '/webERP/member/searchMPSOS.do',
	//words값을 "itemName"이라는 이름의 파라미터로 전송한다.
	data : { "itemName" : words},
	success : function(responseData){
	var data = responseData.popName;
	
	//검색을 시작할시 원래 있던 데이터를 지운다.
	$("#searchItem").empty();
					
		for(var i = 0 ; i<data.length ; i++){
			var str = '';
				str += 	'<tr align="center" id = "yahoo">';
				str += 	'<td>품번</td>';
				str +=  '<td><a href = "#">'+ data[i].item_Code + '</a></td>';  
				str += 	'<td>품명</td>';
				str +=  '<td><a href = "#">'+ data[i].item_Name + '</a></td>';  
				str += 	'<td>주문수량</td>';
				str +=  '<td><a href = "#">'+ data[i].ordersQuantity + '</a></td>';  
				str += 	'<td>예정발주일</td>';
				str +=  '<td><a href = "#">'+ data[i].expectedDate + '</a></td>';  
				str +=  '<td><input type = "hidden" id="iCode" name ="iCode" value = "'+data[i].item_Code+'"></td>';  
				str +=  '<td><input type = "hidden" id="iName" value = "'+data[i].item_Name+'" ></td>';  
				str +=  '<td><input type = "hidden" id="iOdQty" value = "'+data[i].ordersQuantity+'" ></td>';  
				str +=  '<td><input type = "hidden" id="iExpDate" value = "'+data[i].expectedDate+'" ></td>';  
				str +=	'</tr>';
				//반복문을 사용하여 searchItem table에 추가
				$("#searchItem").append(str);
			}	    					    						
				},
	error: function(request,status,error){
      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    	}
});
		
});

$(document).on("click", "#yahoo", function (e){

var initCode = 	$(this).find('input[id=iCode]').val();	
var initName = 	$(this).find('input[id=iName]').val();
var initOdQty = 	$(this).find('input[id=iOdQty]').val();
var initExpDate = 	$(this).find('input[id=iExpDate]').val();

$('input[name=code]').val(initCode);
$('input[name=name]').val(initName);
$('input[name=ordersQuantity]').val(initOdQty);
$('input[name=ExpDate]').val(initExpDate);

});
</script>
</form>
</body>
</html>