<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
String inputNo = (String) request.getAttribute("inputNo");
%>
<%
String parent = request.getParameter("itemNumber");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수주등록</title>

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

#view {
	width: 100%;
	text-align: center;
	border: 1px solid black;
}

#view td:not(#no) {
	width: 8%;
}

#view td input {
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
	<form id="searchForm" method="get"
		action="${pageContext.request.contextPath }/member/regorder.do">
		<table class="con1_search">
			<tr>
				<td>거래처</td>
				<td><input type="text" id="reqInput" name="bus_code"
					style="width: 100%;" value="${bus_code}" /></td>
				<td><a href="javascript:search1()"><i class="fas fa-search"
						style="color: blue;"></i></a></td>
				<td><input type="text" readonly name = "bus_name" value="${bus_name}"></td>
				
			</tr>

		</table>
	</form>
	</container1>
<form:form commandName="stVO" id="insertForm" action="${pageContext.request.contextPath }/member/insertNewRow.do" method="get" acceptCharset="UTF-8">
	<container2 id="contents2">
	<table id="view">
		<thead>
			<td><input type="checkbox" id="check" name="content"
				onclick="selectAll(this)" /></td>
			<td>주문번호</td>
			<td>주문일자</td>
			<td>고객</td>
			<td>과세구분</td>
			<td>비고</td>
		</thead>
		<tbody id="table1">
			<c:forEach var="item" items="${customerList}" varStatus="sts">
				<tr class="moveNum2">
					<td><input type="checkbox" value="${item.ordersNum }"
						name="content" /></td>
					<td><input type="text" class="ordersNum" 
						name="StoVO[${sts.index}].ordersNum" value="${item.ordersNum }" readonly /></td>
					<td><input type="date" name="StoVO[${sts.index}].ordersdate"
						value="${item.ordersdate }" style="background-color:rgb(255,255,149);" /></td>
					<td><input type="text"
						name="StoVO[${sts.index}].general_Customer_Code"
						value="${item.general_Customer_Code }"  readonly style="background-color:rgb(255,255,149);" /></td>
					<td><input type="text" name="StoVO[${sts.index}].tax"
						value='${item.tax }' style="background-color:rgb(255,255,149);" /></td>
					<td><input type="text" name="StoVO[${sts.index}].note"
						value='${item.note }' /></td>
				</tr>
			</c:forEach> 
				<tr id="insertsuju">
					<td><input type="checkbox" value="check1" id="check"
						name="content" /></td>
					<td><input type="text" id="ordersNum" class="ordersNum"
						name="sujuVO[0].ordersNum" readonly value=""  /></td>
					<td><input type="date" id="ordersdate"
						name="sujuVO[0].ordersdate" value=""  style="background-color:rgb(255,255,149);"/></td>
					<td><input type="text" id="customerCode"
						name="sujuVO[0].General_Customer_Code" readonly value="${param.bus_code}" style="background-color:rgb(255,255,149);" /></td>
					<td><input type="text" id="tax"
						name="sujuVO[0].tax" value=""  style="background-color:rgb(255,255,149);"/></td>
					<td><input type="text" id="note"
						name="sujuVO[0].note" value="" /></td>
				</tr>
		</tbody>
	</table>
	</container2>
	<container3 id="contents3">
	<table id="view">
			<tr>
			<td style="width: 5%;"><input type="checkbox" name="content1"
				onclick="selectAll1(this)"></td>
			<td>품번</td>
			<td>품명</td>
			<td>규격</td>
			<td>단위</td>
			<td>납기일</td>
			<td>주문수량</td>
			<td>단가</td>
			<td>부가세단가</td>
			<td>출하예정일</td>
			<td>검사</td>
			</tr>
		<tbody id="table3">
		</tbody>
		<tr>
			<td><span id="addInsertSubStoBlock" style="cursor: pointer;">+</span></td>
		</tr>
			
		</tbody>
	</table>
	</container3>
</form:form>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script>
	 var tbody3Index = 0;
	
	 
	function search1(){
      	openWindowPop('http://localhost:8090/webERP/member/searchcus.do','searchcus');
}
	function searchItem(){
		openWindowPop('http://localhost:8090/webERP/member/searchitemList1.do','popupItem');
	}
	function searchItem2(){
		openWindowPop('http://localhost:8090/webERP/member/searchitemList2.do','popupItem');
	}
	function openWindowPop(url, name){
        var options = 'top=0, left=0, width=320, height=420, status=no, menubar=no, toolbar=no, resizable=no';
        window.open(url, name, options);
    }
	function setChildValue(code, name) {
    	$('input[name=bus_code]').val(code);
    	$('input[name=bus_name]').val(name);
    }
	function setChildView(code, name , standard, unit) {
    	$('input[id=itemCode]').val(code);
    	$('input[id=itemName]').val(name);
    	$('input[id=standard]').val(standard);
    	$('input[id=unit]').val(unit);
    }
	
	function setChildView2(code, name , standard, unit) {
    	$('input[id=itemCode2]').val(code);
    	$('input[id=itemName2]').val(name);
    	$('input[id=standard2]').val(standard);
    	$('input[id=unit2]').val(unit);
    }
	
	view_button.onclick = function(){
    	
    	var searchForm = $('#searchForm');
    	
    	searchForm.submit();
	}
	
	 var table3 = document.getElementById('table3');
    var insertNo = '';
	 
    $('.ordersNum').dblclick(function(e) {
    	
//	        var checkMoveNum = document.getElementById('moveNum').value;
   //     deleteTbody3();
   		insertNo = '';
        if($(this).parent().parent()[0].id != 'insertsuju') {
        	insertNo = $(this).parent().parent().find('input[class=ordersNum]')[0].value;
        }
        var code = $(this).val();
    	$.ajax({ type: "GET",
    		url: "/webERP/member/searchsujusub.do",
    		data : {	"ordersNum" : code},
    		//dataType : 'text',
    		success: function(responseData){
    			var data = responseData.sujusub;
    			
    			// id=table3 안의 모든 요소 지우기
    			$("#table3").empty();
    			tbody3Index = 0;
    			
    		/* 	var tbody4index = 0; */
    			for(var i =0; i<data.length; i++){
    				var html = '';
        			html += '<tr>';
        			html += '<td><input type = "checkbox" name="subListStoVO['+i+'].no" class="content2" value = "'+data[i].no+'"></td>';  	
        			html += '<td><a href="javascript:searchItem()"><input type = "text" id = "itemCode" name = "subListStoVO['+i+'].itemCode" readonly value = "'+data[i].itemCode +'" style="background-color:rgb(255,255,149);"></a></td>';  		
        			html += '<td><a href="javascript:searchItem()"><input type = "text" id = "itemName" name = "subListStoVO['+i+'].itemName" readonly value = "'+data[i].itemName +'"></a></td>';  			
        			html += '<td><input type = "text" id = "standard" name = "subListStoVO['+i+'].standard" value = "'+data[i].standard+'"></td>';  			
        			html += '<td><input type = "text" id = "unit" name = "subListStoVO['+i+'].inventoryUnit" value = "'+data[i].inventoryUnit+'"></td>';  			
        			html += '<td><input type = "date" name = "subListStoVO['+i+'].dueDate" value = "'+data[i].dueDate+'" style="background-color:rgb(255,255,149);"></td>';  			
        			html += '<td><input type = "number" name = "subListStoVO['+i+'].ordersQuantity" value = "'+data[i].ordersQuantity+'" maxlength="8" style="background-color:rgb(255,255,149);"></td>';  			
        			html += '<td><input type = "number" name = "subListStoVO['+i+'].productPrice" value = "'+data[i].productPrice+'" maxlength="9" style="background-color:rgb(255,255,149);" ></td>';  			
        			html += '<td><input type = "number" name = "subListStoVO['+i+'].vatPrice" value = "'+data[i].vatPrice+'" maxlength="9" style="background-color:rgb(255,255,149);"></td>';  			
        			html += '<td><input type = "date" name = "subListStoVO['+i+'].expectedDate" value = "'+data[i].expectedDate+'" style="background-color:rgb(255,255,149);"></td>';  			
        			html += '<td><input type = "text" name = "subListStoVO['+i+'].inspection" value = "'+data[i].inspection+'" style="background-color:rgb(255,255,149);"></td>';  			
        			html += '<input type = "hidden" name = "subListStoVO['+i+'].no" value = "'+data[i].no+'">';  			
        			html += '<input type = "hidden" name = "subListStoVO['+i+'].code"  value = "'+data[i].code+'" ">';  		
        			html += '</tr>';
        			//  id=table3 안에 넣기
        			$("#table3").append(html);
    			} 
    			 
    			/* addTbody3(); */
    		},
    		error: function(request,status,error){
    	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    	       }
    	});
    });
    $('#delete').click(function () {
    	deleteData();
    });
    
    $('#save').click(function () {
    	newRow();
    });
    
    function newRow() {
    	 var itemCode2 = document.getElementById("itemCode2");
    	 var dueDate = document.getElementById("dueDate");
    	 var inspection = document.getElementById("inspection");
    	 var expectedDate = document.getElementById("expectedDate");
    	 var ordersQuantity = document.getElementById("ordersQuantity");
    	 var productPrice = document.getElementById("productPrice");
    	 var vatPrice = document.getElementById("vatPrice");
    	if(itemCode2.value == ""||dueDate.value == ""||inspection.value =="" ||expectedDate.value =="" ||ordersQuantity.value=="" ||productPrice.value == "" || vatPrice == ""){
    		alert ("필수입력사항을 입력하십시오.")
    	}
			else{
    	var addDate = $('#ordersdate').val();
    	
    	var datetime_pattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1]) (0[0-9]|1[0-9]|2[0-3]):([0-5][0-9])$/; 

    	if(!datetime_pattern.test(addDate)){
    		$('#ordersdate').val('2021-12-31');
    	}
    	
    	var busCode = $('#reqInput').val();
    	
    	var newForm = $('#insertForm');
    	$('<input>').attr({
    		type: 'hidden',
    		name: 'busCode',
    		value: busCode
    	}).appendTo(newForm);
    	
    	$('<input>').attr({
    		type: 'hidden',
    		name: 'insertNo',
    		value: insertNo
    	}).appendTo(newForm);
    	
    	newForm.submit();
    }}
    
    function deleteData() {
    	  var no = "";
    	  var secno = "";
    	  var ary = [];
    	  var secarr = [];
    	  var item = document.getElementsByName("content").length;
    	  var item2 = document.getElementsByName("content2").length;
  
    	  for(var i=0 ; i<item ; i++){
    		  if(document.getElementsByName("content")[i].checked==true){
    			no = document.getElementsByName("content")[i].value;
    			ary.push(no);
    		  }
    	  }
    	  
    	  for(var i=0 ; i<item2 ; i++){
    		  if(document.getElementsByName("content2")[i].checked==true){
    			secno = document.getElementsByName("content2")[i].value;
    			secarr.push(secno);
    			
  
    		  }
    	  }
    	  
    	  
    	  
    	if (Array.isArray(ary) && ary.length){
    		if(Array.isArray(secarr) && secarr.length){
  		  alert("부모데이터와 자식데이터를 함께 삭제할 수 없습니다 한쪽만 체크하십시오.");
    		}
    		else{
    			 window.location.href = "${contextPath}/member/delsuju.do?no="+ary;
    		}
  	 }
    	else{
    		
  		 window.location.href = "${contextPath}/member/delsujuSub.do?no="+secarr;
  	 }
      }
    
    $('#addInsertSubStoBlock').click(function(){
    	addTbody3();
    })
    
    
    
   
    
    function addTbody3() {
    	
        var tbody2html = '<tr class="newSubSujuRow">'
            + '<td><input type="checkbox" name="content2" /></td>'
            + '<td><a href="javascript:searchItem2(this)"><input type="text" id = "itemCode2" name="subSujuList['+ tbody3Index +'].itemCode" readonly value="" style="background-color:rgb(255,255,149);"/></a></td>'
            + '<td><a href="javascript:searchItem2(this)"><input type="text" id = "itemName2" name="subSujuList['+ tbody3Index +'].itemName" readonly value="" /></a></td>'
            + '<td><input type="text" id = "standard2" name="subSujuList['+ tbody3Index +'].standard" value="" /></td>'
            + '<td><input type="text" id = "unit2" name="subSujuList['+ tbody3Index +'].inventoryUnit" value="" /></td>'
            + '<td><input type="date" id= "dueDate" name="subSujuList['+ tbody3Index +'].dueDate" value="" style="background-color:rgb(255,255,149);"/></td>'
            + '<td><input type="number" id = "ordersQuantity"name="subSujuList['+ tbody3Index +'].ordersQuantity" value="" maxlength="8" style="background-color:rgb(255,255,149);"/></td>'
            + '<td><input type="number" id = "productPrice" name="subSujuList['+ tbody3Index +'].productPrice" value="" maxlength="9" style="background-color:rgb(255,255,149);"/></td>'
            + '<td><input type="number" id = "vatPrice" name="subSujuList['+ tbody3Index +'].vatPrice" value="" maxlength="9" style="background-color:rgb(255,255,149);"/></td>'
            + '<td><input type="date" id = "expectedDate" name="subSujuList['+ tbody3Index +'].expectedDate" value="" style="background-color:rgb(255,255,149);"/></td>'
            + '<td><input type="text" id = "inspection" name="subSujuList['+ tbody3Index +'].inspection" value="" style="background-color:rgb(255,255,149);"/></td>'
            + '<input type="hidden" name="subSujuList['+ tbody3Index +'].code" value=""/>'
            + '</tr>';
    	$('#table3').append(tbody2html);
    	
    	tbody3Index++;
    }
	
    
    $('#update').click(function(){
    	updateRow();
    });
    
    function updateRow(){
    	if(itemCode2.val() == "" ){
    		alert ("품목명은 필수 입력사항입니다.")
    	}
			else{
    	
		var busCode = $('#reqInput').val();
		
		$('#insertsuju').empty();
		$('.newSubSujuRow').remove();
    	
    	var newForm = $('#insertForm');
    	$('<input>').attr({
    		type: 'hidden',
    		name: 'busCode',
    		value: busCode
    	}).appendTo(newForm);
    	
    	$('<input>').attr({
    		type: 'hidden',
    		name: 'insertNo',
    		value: insertNo
    	}).appendTo(newForm);
    	
    	
    	newForm.attr("action", "${contextPath}/member/updateSuju.do");
    	newForm.submit();
    	 
			}
    }
    
	</script>
</body>
</html>