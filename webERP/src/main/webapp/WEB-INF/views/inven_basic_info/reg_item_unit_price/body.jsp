<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<% 
	String inputNo = (String)request.getAttribute("inputNo");
%>
<% 
	String itemNumber = request.getParameter("itemNumber");
%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:forEach var="iup" items="${iupInsert}">
	<c:set var="itemNumber" value="${iup.itemNumber }"/>
	<c:set var="itemName" value="${iup.itemName }"/>
	<c:set var="standard" value="${iup.standard }"/>
	<c:set var="inventoryUnit" value="${iup.inventoryUnit }"/>
	<c:set var="purchasePrice" value="${iup.purchasePrice }"/>
	<c:set var="salesPrice" value="${iup.salesPrice }"/>
	</c:forEach>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>품목단가등록</title>
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
            top: 25%;
            left: 18%;
        }
        #iupTable1,#view2{
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
	l_sub1.style.position = "relative";
    l_sub3.style.position = "relative";
    l_sub4.style.display = "block";
    l_sub4.style.marginLeft = "10px";
}
</script>
</head>
<body>
	<container1 id = contents1>
		<form id="searchForm">
			<table class="con1_search">
                <tr>
                    <td>
                    	단가 등록 된 품목 검색(삭제,수정)
                    </td>
                    <td style="width: 100px;">
                    	<input type="text" style="width: 100%; background-color:rgb(255,255,149);" name="" value='${param.itemNumber }'/>
                    </td>
                    <td>
                    	<a href="javascript:search1()">
                    		<i class="fas fa-search" style="color: blue;"></i>
                    	</a>
                    </td> 
                    <td colspan="4" style="width:200px;">
                    	<input type="text" name="" value='${param.itemName }' disabled style="width: 100%;"/>
                    </td>
                </tr>
                <tr>
                	<td colspan="4">단가 등록은 하단의 품번 박스를 더블 클릭 해주세요</td>
                </tr>
			</table>
		</form>
        </container1>
	<form id="regIup" method="get" commandName="ListVO">
		<container2 id="contents2">
			<div id="iupInfo">    
            	<table id="iupTable">
                	<thead align="center" style="background-color:gray">                    
                    	<td><input type="checkbox" name="content" onclick="selectAll(this)"/></td>
                    	<td style="width:10px;">No</td>
                    	<td>품 번</td>
                    	<td>품 명</td>
                    	<td>규 격</td>
                    	<td>재고단위</td>
                    	<td>구매단가</td>
                    	<td>판매단가</td>
					</thead>
				<c:forEach var="iup" items="${iupView }" varStatus="status">
					<tr id="updateIup" align="center">
                    	<td><input type="checkbox" name="content" value="${iup.no }"/></td>
                    	<td style="width:13px;"><input type="text" name="ListVO[${status.index}].no" value='${iup.no }' readonly style="width:100%;"/></td>
                    	<td><input type="text" name="ListVO[${status.index}].itemNumber" value='${iup.itemNumber }' readonly /></td>
                    	<td><input type="text" name="ListVO[${status.index}].itemName" value='${iup.itemName }' readonly/></td>
                    	<td><input type="text" name="ListVO[${status.index}].standard" value='${iup.standard }' readonly/></td>
                    	<td><input type="text" name="ListVO[${status.index}].inventoryUnit" value='${iup.inventoryUnit }' readonly/></td>
                    	<td><input type="text" name="ListVO[${status.index}].purchasePrice" value='${iup.purchasePrice }' style="background-color:rgb(255,255,149);"/></td>
                    	<td><input type="text" name="ListVO[${status.index}].salesPrice" value='${iup.salesPrice }' style="background-color:rgb(255,255,149);"/></td>                                                                            
                	</tr>
				</c:forEach>
                	<tr id="insertIup" align="center">
                		<td></td>
              			<td><input type="text" id="no" name="ListVO[${fn:length(iupView) }].no" value='${inputNo }' style="width:100%" readonly></td>
                    	<td><input type="text" id="itemNumber" name="ListVO[${fn:length(iupView) }].itemNumber" value='${itemNumber }' ondblclick="search2()" readonly style="background-color:rgb(149,149,255);"/></td>
                    	<td><input type="text" id="itemName" name="ListVO[${fn:length(iupView) }].itemName" value='${itemName }' readonly/></td>
                    	<td><input type="text" id="standard" name="ListVO[${fn:length(iupView) }].standard" value='${standard }' readonly/></td>
                    	<td><input type="text" id="inventoryUnit" name="ListVO[${fn:length(iupView) }].inventoryUnit" value='${inventoryUnit }' readonly/></td>
                    	<td>
                    	<input type="text" id="purchasePrice" name="ListVO[${fn:length(iupView) }].purchasePrice" value='${purchasePrice }' style="background-color:rgb(255,255,149);"/>
                    	</td>
                    	<td>
                    	<input type="text" id="salesPrice" name="ListVO[${fn:length(iupView) }].salesPrice" value='${salesPrice }' style="background-color:rgb(255,255,149);"/>
                    	</td>                                               
                	</tr>
            	</table>
			</div>
		</container2>
	
    <script src="http://code.jquery.com/jquery-latest.js"></script> <!--제이쿼리최신버젼가져옴-->
    <script>
    	var no = document.getElementById("no")
        var itemNumber = document.getElementById("itemNumber");
        var itemName = document.getElementById("itemName");
        var standard = document.getElementById("standard");
      	var inventoryUnit = document.getElementById("inventoryUnit");
		var purchasePrice = document.getElementById("purchasePrice");
		var salesPrice = document.getElementById("salesPrice");
		
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
			openWindowPop('http://localhost:8090/webERP/member/iupcodehelper1.do','iupcodehelper1');
		}
		
		function search2(){
			openWindowPop('http://localhost:8090/webERP/member/iupcodehelper2.do','iupcodehelper2');
		}
		
		function setChildValue(name){
			const URLSearch = new URLSearchParams(location.search);
			URLSearch.set('submit','2');
			const newParam = URLSearch.toString();
			if(URLSearch.get('itemNumber') == null){
				window.location.href = location.pathname + '?' + newParam + '&itemNumber=' + name;
			}
			else{
				URLSearch.set('itemNumber',name);
				const newParam = URLSearch.toString();
				window.location.href = location.pathname + '?' + newParam;
			}
		}
		
		function updateRow(){
			 var UpdConfirm = confirm('수정하실껀가요?');
				if(UpdConfirm){
					alert('수정 완료되셨습니다!');
			var iupTable = document.getElementById('iupTable');
			var row = iupTable.insertRow();
			const URLSearch = new URLSearchParams(location.search);
			URLSearch.set('submit','1');
			const newParam = URLSearch.toString();
			
			var link = location.pathname + '?' + newParam;
				document.getElementById("no").disabled = true;
				document.getElementById("purchasePrice").disabled = true;
				document.getElementById("salesPrice").disabled = true;
				
			var articleNoInput = document.createElement("input");
				articleNoInput.setAttribute("type","hidden");
				articleNoInput.setAttribute("name","path");
				articleNoInput.setAttribute("value",link);
				document.getElementById('regIup').appendChild(articleNoInput);
				document.getElementById('regIup').action = "${contextPath}/member/updateIup.do";
				document.getElementById('regIup').submit();
		}else{
			alert('수정을 취소하셨습니다!');
			location.reload(true);
			location.href = location.href;

			history.go(0);
		}
		
	}
		
		function newRow(){
			if(itemNumber.value == "" || itemName.value == "" || purchasePrice.value == "" 	|| salesPrice.value == "")
			{
			    if(itemNumber.value == ""){
			       alert("품번은 필수 입력사항입니다.");
			       return itemNumber.focus();
			    }else if(itemName.value == ""){
			       alert("품명은 필수 입력사항입니다.");
			       return itemName.focus();
			    }else if(purchasePrice.value == ""){
			       alert("구매단가는 필수 입력사항입니다.");
			       return purchasePrice.focus();
			    }else if(salesPrice.value ==""){
			    	alert("판매단가는 필수 입력사항입니다.");
			    	return salesPrice.focus();
			    }
			}else{
			var row = iupTable.insertRow();
			const URLSearch = new URLSearchParams(location.search);
			URLSearch.set('submit','1');
			const newParam = URLSearch.toString();
			var link = location.pathname + '?' + newParam;
			var articleNoInput = document.createElement("input");
			articleNoInput.setAttribute("type","hidden");
			articleNoInput.setAttribute("name","path");
			articleNoInput.setAttribute("value",link);
			document.getElementById('regIup').appendChild(articleNoInput);
			document.getElementById('regIup').action = "${contextPath}/member/addIup.do";
			document.getElementById('regIup').submit();
		}
	}
		
		function deleteData(){
			var item = document.getElementsByName("content").length;
			var no = "";
			var ary = [];
			for(var i=0; i<item; i++){
				if(document.getElementsByName("content")[i].checked==true){
					no = document.getElementsByName("content")[i].value;
					ary.push(no);
				}
			}

			  if(ary.length === 0 || ary === null){
				  alert('삭제할 칼럼의 체크박스를 선택해주세요!');
			  }else{
				  alert('삭제 되었습니다!');
				  window.location.href = "${contextPath}/member/delIup.do?no="+ary;
			  }
				
		}
	</script>
	</form>
</body>
</html>