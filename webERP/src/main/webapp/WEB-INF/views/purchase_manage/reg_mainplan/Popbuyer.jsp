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
						<td>거래처 코드</td>
						<td><input type="text" id="code" name="code" /></td>
					</tr>
					<tr>
						<td>거래처명</td>
						<td><input type="text" id="name" name="name" class="name" /></td>
					</tr>
			</table>
			<div id="button">	
				<button id="submit">적용</button>
                <input type="hidden" name="inputSeq" value=""/>
			</div>
		</div>
		<div id="view">
			<table style="width: 100%;" id="searchItem">
				<tr align="center">
					<td>거래처 코드</td>
					<td>거래처명</td>
				</thead>	
				<c:forEach var="com" items="${Listbuyer}">
					<tr align="center" id="searchItem">
					 <td><a href="javascript:popFunction('${com.general_Customer_Code }','${com.general_Customer_Name }')">${com.general_Customer_Code}</a></td>
      					  <td><a href="#">${com.general_Customer_Name}</a></td>      		
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


		
	function popFunction(code,name){
			text_code.value = code;
			text_name.value = name;

			
	}
 submit_button.onclick = function(){

	 opener.setChildValue(text_name.value);
	window.close();
	}	 
//ajax 구문
$('.name').keyup(function(){
//변수 words에 id가 name인것의 값을 저장한다
var words = $('#name').val();
$.ajax({
	type : 'GET',
	url : '/webERP/member/Searchbuyer.do',
	//words값을 "itemName"이라는 이름의 파라미터로 전송한다.
	data : { "buyer" : words},
	success : function(responseData){
	var data = responseData.popName;
	
	//검색을 시작할시 원래 있던 데이터를 지운다.
	$("#searchItem").empty();
					
		for(var i = 0 ; i<data.length ; i++){
			var str = '';
				str += 	'<tr align="center" id = "yahoo">';
				str += 	'<td>거래처 코드: </td>';
				str +=  '<td><a href = "#">'+ data[i].general_Customer_Code + '</a></td>';  
				str += 	'<td>거래처명 :</td>';
				str +=  '<td><a href = "#">'+ data[i].general_Customer_Name + '</a></td>';  
				str +=  '<td><input type = "hidden" id="iCode" name ="iCode" value = "'+data[i].general_Customer_Code+'"></td>';  
				str +=  '<td><input type = "hidden" id="iName" value = "'+data[i].general_Customer_Name+'" ></td>';  
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


$('input[name=code]').val(initCode);
$('input[name=name]').val(initName);


});
</script>
</form>
</body>
</html>