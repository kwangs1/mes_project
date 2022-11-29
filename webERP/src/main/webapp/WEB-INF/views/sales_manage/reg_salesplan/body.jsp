<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<% 
	String itemCode = request.getParameter("itemCode");
%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:forEach var="sp" items="${spInsert}">
	<c:set var="planDate" value="${sp.planDate }"/>
	<c:set var="itemCode" value="${sp.itemCode }"/>
	<c:set var="itemName" value="${sp.itemName }"/>
	<c:set var="standard" value="${sp.standard }"/>
	<c:set var="inventoryUnit" value="${sp.inventoryUnit }"/>
	<c:set var="planItemQuantity" value="${sp.planItemQuantity }"/>
	<c:set var="planUnitPrice" value="${sp.planUnitPrice }"/>
	<c:set var="newPlanItemQuantity" value="${sp.newPlanItemQuantity }"/>
	<c:set var="newPlanUnitPrice" value="${sp.newPlanUnitPrice }"/>
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
            height: 12%; 
            border: 1px solid black;
            z-index: 1;
        }
        
        #contents2{
            position: absolute;
            right: 0;
            top: 27%; 
            width: 85%;
            height: 68%; 
            border: 1px solid black;
            z-index: 1;
        }
        .con1_search{
            padding:0;
            text-align: center;
            /* position: absolute; 칸 모잘라서 지움*/
            top: 22%;
            left: 25%;
        }
        #spTable1,#view2{
            width: 100%;
            text-align: center;
            border: 1px solid black;
            
        }
        /* end default 밑으로 css 추가함*/
        .con1_search {
            margin: 10px;
        }        
        #contents2 {
            overflow: scroll;
        }
</style>
<script>
window.onload = function(){
    l_sub2.style.position = "relative";
    l_sub1.style.display = "block";
    l_sub1.style.marginLeft = "10px";
}
</script>
</head>
<body>
	<container1 id = contents1>
		<form id="searchForm">
			<table class="con1_search">
                <tr>
                    <td>
                    	검색하시려는 품목번호를 조회(삭제,수정)
                    </td>
                    <td style="width: 100px;">
                    	<input type="text" style="width: 100%; background-color:rgb(255,255,149);" name="" value='${param.itemCode }'/>
                    </td>
                    <td>
                    	<a href="javascript:search1()">
                    		<i class="fas fa-search" style="color: blue;"></i>
                    	</a>
                    </td> 
                    <td colspan="3">
                    	<input type="text" name="" value='${param.itemName }' disabled style="width: 100%;"/>
                    </td>
                </tr>
                <tr>
                	<td colspan="4">등록 하시려면 아래 품번 밑의 박스를 더블 클릭 해주세요</td>
                </tr>
			</table>
		</form>
        </container1>
	<form id="regSp" method="get" commandName="ListVO">
		<container2 id="contents2">
			<div id="spInfo">    
            	<table id="spTable">
                	<thead align="center" style="background-color:gray">                    
                    	<td style="width: 5%;"><input type="checkbox" name="content" onclick="selectAll(this)"></td>
                    	<td align="center">등록일자</td>
						<td align="center">품 번</td>
						<td align="center">품 명</td>
						<td align="center">규 격</td>
						<td align="center">단위(관리)</td>
						<td align="center">판매 계획 수량</td>
						<td align="center">판매 계획단가</td>
						<td align="center">판매 계획 금액</td>
						<td align="center">계획 수정 수량</td>
						<td align="center">계획 수정 단가</td>
						<td align="center">계획 수정 금액</td>	
					</thead>
				<c:forEach var="sp" items="${spView }" varStatus="status">
					<tr id="updateSp" align="center">
                    	<td style="width: 5%;"><input type="checkbox" value="${sp.itemCode }" name="content" /></td>
                    	<td><input type="text" name="ListVO[${status.index}].planDate" value="${sp.planDate}" readonly/></td>
						<td><input type="text" name="ListVO[${status.index}].itemCode" value="${sp.itemCode}" readonly/></td>
                    	<td><input type="text" name="ListVO[${status.index}].itemName" value="${sp.itemName}" readonly/></td>
                    	<td><input type="text" name="ListVO[${status.index}].standard" value="${sp.standard}" readonly/></td>
                    	<td><input type="text" name="ListVO[${status.index}].inventoryUnit" value="${sp.inventoryUnit}" readonly/></td>
                    	<td><input type="number" name="ListVO[${status.index}].planItemQuantity" value="${sp.planItemQuantity}" readonly/></td>
                    	<td><input type="number" name="ListVO[${status.index}].planUnitPrice" value="${sp.planUnitPrice}" readonly/></td>
                    	<td><input type="number" value="${sp.planItemQuantity * sp.planUnitPrice}" readonly/></td>
                    	<td><input type="number" name="ListVO[${status.index}].newPlanItemQuantity" value="${sp.newPlanItemQuantity}" maxlength="8" style="background-color:rgb(255,255,149);"/></td>
                    	<td><input type="number" name="ListVO[${status.index}].newPlanUnitPrice" value="${sp.newPlanUnitPrice}"  maxlength="9"style="background-color:rgb(255,255,149);"/></td>
                    	<td><input type="number" value="${sp.newPlanItemQuantity * sp.newPlanUnitPrice}" readonly/></td>                                                                      
                	</tr>
				</c:forEach>
                	<tr id="insertSp" align="center">
                		<td></td>
              			<td><input type="date" id="planDate" name="ListVO[${fn:length(spView) }].planDate" value='${planDate }' style="background-color:rgb(255,255,149);"></td>
                    	<td><input type="text" id="itemCode" name="ListVO[${fn:length(spView) }].itemCode" value='${itemCode }' ondblclick="search2()" readonly style="background-color:rgb(149,149,255);"/></td>
                    	<td><input type="text" id="itemName" name="ListVO[${fn:length(spView) }].itemName" value='${itemName }' readonly/></td>
                    	<td><input type="text" id="standard" name="ListVO[${fn:length(spView) }].istandard" value='${standard }' readonly/></td>
                    	<td><input type="text" id="inventoryUnit" name="ListVO[${fn:length(spView) }].inventoryUnit" value='${inventoryUnit }' readonly/></td>
                    	<td><input type="number" id="planItemQuantity" name="ListVO[${fn:length(spView) }].planItemQuantity" value='${planItemQuantity }' style="background-color:rgb(255,255,149) max;" maxlength="8"/></td>
                    	<td><input type="number" id="planUnitPrice" name="ListVO[${fn:length(spView) }].planUnitPrice" value='${planUnitPrice }' style="background-color:rgb(255,255,149);" maxlength="9"/></td>
                    	<td><input type="number" value='${planItemQuantity * planUnitPrice }' readonly/></td>
                    	<td><input type="number" id="newPlanItemQuantity" name="ListVO[${fn:length(spView) }].newPlanItemQuantity" value='${newPlanItemQuantity }'  maxlength="8" readonly/></td>
                    	<td><input type="number" id="newPlanUnitPrice" name="ListVO[${fn:length(spView) }].newPlanUnitPrice" value='${newPlanUnitPrice }' maxlength="20" readonly/></td>
                    	<td><input type="number" value='${newPlanItemQuantity * newPlanUnitPrice }' readonly/></td>                                         
                	</tr>
            	</table>
			</div>
		</container2>
	
    <script src="http://code.jquery.com/jquery-latest.js"></script> <!--제이쿼리최신버젼가져옴-->
    <script>
    	var planDate = document.getElementById("planDate");
        var itemCode = document.getElementById("itemCode");
        var itemName = document.getElementById("itemName");
        var standard = document.getElementById("standard");
      	var inventoryUnit = document.getElementById("inventoryUnit");
		var planItemQuantity = document.getElementById("planItemQuantity");
		var planUnitPrice = document.getElementById("planUnitPrice");
		var newPlanItemQuantity = document.getElementById("newPlanItemQuantity");
		var newPlanUnitPrice = document.getElementById("newPlanUnitPrice");
		
		var view_button = document.getElementById("view_button");
		var save_button = document.getElementById("save");
		var update_button = document.getElementById("update");
		
		function openWindowPop(url, name){
			var options = 'top=0, left=0, width=320, height=420, status=no, menubar=no, toolbar=no, resizable=no';
			window.open(url, name, options);
		}
		
		view_button.onclick = function(){
			  const URLSearch = new URLSearchParams(location.search);
			  URLSearch.set('submit', '1');
			  const newParam = URLSearch.toString();

			  window.open(location.pathname + '?' + newParam, '_self');
    	}
		
		function selectAll(selectAll){
            const checkbox = document.getElementsByName('content');
            checkbox.forEach((checkbox) => {
                checkbox.checked = selectAll.checked;
            })
        }
		
		function search1(){
			openWindowPop('http://localhost:8090/webERP/member/spcodehelper1.do','spcodehelper1');
		}
		
		function search2(){
			openWindowPop('http://localhost:8090/webERP/member/spcodehelper2.do','spcodehelper2');
		}
		
		function setChildValue(name){
			const URLSearch = new URLSearchParams(location.search);
			URLSearch.set('submit','2');
			const newParam = URLSearch.toString();
			if(URLSearch.get('itemCode') == null){
				window.location.href = location.pathname + '?' + newParam + '&itemCode=' + name;
			}
			else{
				URLSearch.set('itemCode',name);
				const newParam = URLSearch.toString();
				window.location.href = location.pathname + '?' + newParam;
			}
		}
		
		
		function updateRow(){
			var spTable = document.getElementById('spTable');
			
				
			var row = spTable.insertRow();
			const URLSearch = new URLSearchParams(location.search);
			URLSearch.set('submit','1');
			const newParam = URLSearch.toString();
			
			var link = location.pathname + '?' + newParam;
				document.getElementById("planDate").disabled = true;
				document.getElementById("planItemQuantity").disabled = true;
				document.getElementById("planUnitPrice").disabled = true;
				document.getElementById("newPlanItemQuantity").disabled = true;
				document.getElementById("newPlanUnitPrice").disabled = true;
				
			var articleNoInput = document.createElement("input");
				articleNoInput.setAttribute("type","hidden");
				articleNoInput.setAttribute("name","path");
				articleNoInput.setAttribute("value",link);
				document.getElementById('regSp').appendChild(articleNoInput);
				document.getElementById('regSp').action = "${contextPath}/member/updateSp.do";
				document.getElementById('regSp').submit();
			
		}
		
		function newRow(){
			if(planDate.value == "" || itemCode.value == "" || itemName.value == "" ){
				if(planDate.value == ""){
					alert("날짜는 필수 입력사항입니다.");
					return planDate.focus();
				}else if(itemCode.value == ""){
					alert("품목코드는 필수 입력사항입니다.");
					return itemCode.focus();
				}else if(itemName.value == ""){
					alert("품명은 필수 입력사항입니다.");
					return itemName.focus();
				}}else{
			var row = spTable.insertRow();
			const URLSearch = new URLSearchParams(location.search);
			URLSearch.set('submit','1');
			const newParam = URLSearch.toString();
			var link = location.pathname + '?' + newParam;
			var articleNoInput = document.createElement("input");
			articleNoInput.setAttribute("type","hidden");
			articleNoInput.setAttribute("name","path");
			articleNoInput.setAttribute("value",link);
			document.getElementById('regSp').appendChild(articleNoInput);
			document.getElementById('regSp').action = "${contextPath}/member/addSp.do";
			document.getElementById('regSp').submit();
		}
		
		}
		
		function deleteData(){
			var item = document.getElementsByName("content").length;
			var itemCode = "";
			var ary = [];
			for(var i=0; i<item; i++){
				if(document.getElementsByName("content")[i].checked==true){
					itemCode = document.getElementsByName("content")[i].value;
					ary.push(itemCode);
				}
				window.location.href = "${contextPath}/member/delSp.do?itemCode="+ary;
			}
		}
	</script>
	</form>
</body>
</html>