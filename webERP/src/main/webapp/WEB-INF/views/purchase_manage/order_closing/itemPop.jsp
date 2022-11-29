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
						<td>품번</td>
						<td><input type="text" id="code" name="code" /></td>
					</tr>
					<tr>
						<td>품명</td>
						<td><input type="text" id="name" name="name" class="name" /></td>
					</tr>
					<tr>
						<td><input type="hidden" id="cost" name="cost"  /></td>
					</tr>
					<tr>
						<td><input type="hidden" id="standard" name="standard" /></td>
					</tr>
					<tr>
						<td><input type="hidden" id="inventory_Unit" name="inventory_Unit"  /></td>
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
				</thead>	
				<c:forEach var="item" items="${itemList}">
					<tr align="center" id="searchItem">
					 <td><a href="javascript:popFunction('${item.item_Code }','${item.item_Name }','${item.cost }','${item.standard }','${item.inventory_Unit }')">${item.item_Code}</a></td>
      					  <td><a href="#">${item.item_Name}</a></td>      		
      					  <td><intput type="hidden" value="${item.cost}"/></td>      		
      					  <td><intput type="hidden" value="${item.standard}"/></td>      		
      					  <td><intput type="hidden" value="${item.inventory_Unit}"/></td>      		
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
var submit_button = document.getElementById("submit");
var text_code = document.getElementById("code");
var text_name = document.getElementById("name");
var text_cost = document.getElementById("cost");
var text_standard = document.getElementById("standard");
var text_inventory_Unit = document.getElementById("inventory_Unit");


		
	function popFunction(code,name,cost,standard,inventory_Unit){
			text_code.value = code;
			text_name.value = name;
			text_cost.value = cost;
			text_standard.value = standard;
			text_inventory_Unit.value = inventory_Unit;

			
	}

	submit_button.onclick = function() { //적용버튼에 온클릭이벤트 부여함 (팝업창)
		$(opener.document).find("#item_Code").val($("#code").val()); //#zipCode는 body.jsp의 텍스트박스임, #code는 팝업.jsp의 텍스트박스임
		$(opener.document).find("#item_Name").val($("#name").val()); //#zipCode는 body.jsp의 텍스트박스임, #code는 팝업.jsp의 텍스트박스임
		$(opener.document).find("#cost").val($("#cost").val()); //#zipCode는 body.jsp의 텍스트박스임, #code는 팝업.jsp의 텍스트박스임
		$(opener.document).find("#standard").val($("#standard").val()); //#zipCode는 body.jsp의 텍스트박스임, #code는 팝업.jsp의 텍스트박스임
		$(opener.document).find("#inventory_unit").val($("#inventory_Unit").val()); //#zipCode는 body.jsp의 텍스트박스임, #code는 팝업.jsp의 텍스트박스임

		window.close();
	}	

//ajax 구문
$('.name').keyup(function(){
//변수 words에 id가 name인것의 값을 저장한다
var words = $('#name').val();
$.ajax({
	type : 'GET',
	url : '/webERP/member/NameSearch.do',
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
				str += 	'<td>원가</td>';
				str +=  '<td><a href = "#">'+ data[i].cost + '</a></td>';  
				str += 	'<td>규격</td>';
				str +=  '<td><a href = "#">'+ data[i].standard + '</a></td>';  
				str += 	'<td>단위</td>';
				str +=  '<td><a href = "#">'+ data[i].inventory_Unit + '</a></td>';  
				str +=  '<td><input type = "hidden" id="iCode" name ="iCode" value = "'+data[i].item_Code+'"></td>';  
				str +=  '<td><input type = "hidden" id="iName" value = "'+data[i].item_Name+'" ></td>';  
				str +=  '<td><input type = "hidden" id="iCost" value = "'+data[i].cost+'" ></td>';  
				str +=  '<td><input type = "hidden" id="iStd" value = "'+data[i].standard+'" ></td>';  
				str +=  '<td><input type = "hidden" id="iUnit" value = "'+data[i].inventory_Unit+'" ></td>';  
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
var initCost = 	$(this).find('input[id=iCost]').val();
var initStd = 	$(this).find('input[id=iStd]').val();
var initUnit = 	$(this).find('input[id=iUnit]').val();


$('input[name=code]').val(initCode);
$('input[name=name]').val(initName);
$('input[name=cost]').val(initCost);
$('input[name=Standard]').val(initStd);
$('input[name=Inventory_Unit]').val(initUnit);


});
</script>
</form>
</body>
</html>