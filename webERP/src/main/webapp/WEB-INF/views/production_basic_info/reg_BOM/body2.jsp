<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"    
    isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
    
<%
	String inputNo = (String)request.getAttribute("inputNo");
	
%>
<% String parent = request.getParameter("itemNumber"); %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <c:forEach var="bom" items="${bomInsert}" >     
 	<c:set var="itemNumber" value="${bom.itemNumber }"/>
 	<c:set var="itemName" value="${bom.itemName }"/>
 	<c:set var="standard" value="${bom.standard }"/>
 	<c:set var="unit" value="${bom.unit }"/>
 	<c:set var="division" value="${bom.division }"/>
 </c:forEach>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
		
        #contents2{
            position: absolute;
            left: 15%;
            top: 25%;
            width: 85%;
            height: 70%;
            border: 1px solid black;
            z-index: 1;
        }
        
        /* 컨테이너 스타일부 */
        #workOrderInfo {
            overflow: scroll;
            height: 97%;
            width: 100%;
        }
        #workOrderTable{
       		width:100%;
       	}
        /* 합계 출력부 */
        #resultWindow{
            height: 3%;
            background-color: gray;
            line-height: 5%;
        }
        #button{
            position: absolute;
            right: 10px;
            top: 10px;
        }
		input {
			text-align : center;
		}
img {
	margin-left:10px;
}
</style>
<script>
	window.onload = function(){
		l_sub3.style.display = "block";
		l_sub3.style.position = "relative";
		l_sub3.style.marginLeft = "10px";
	}
</script>
</head>
<body>
<form id="regBOM" method="get" commandName = "ListVO" >
        <container2 id= contents2>
            <div id="workOrderInfo">
                <table id="workOrderTable">
                    <thead align="center" style="background-color:gray">
                        <td><input type="checkbox" name="content" onclick="selectAll(this)"/></td>
                        <td style="width:10px;">No</td>
                        <td>품번코드</td>
                        <td>품명</td>
                        <td>규격</td>
                        <td>단위</td>
                        <td>계정</td>
                        <td>정미수량</td>
                        <td>LOSS(%)</td>
                        <td>필요수량</td>
                    </thead>
                    <!-- 테스트용 데이터, 추후 표현식으로 수정필요 -->
         <c:forEach var="bom" items="${bomView}" varStatus="status" >     
   <tr id= "updateTest" align="center">
   	  <td><input type="checkbox" name="content" value="${bom.no }"/></td>
   	  <td style="width:13px;"><input type="text" name="ListVO[${status.index}].no" value = '${bom.no }' readonly style="width:100%"/></td>
   	  <input type="hidden" name="ListVO[${status.index}].parent" value = '${bom.parent}' readonly/>
   	  <td><input type="text" name="ListVO[${status.index}].itemNumber" value = '${bom.itemNumber}' readonly/></td>
   	  <td><input type="text" name="ListVO[${status.index}].itemName" value = '${bom.itemName}' readonly/></td>
   	  <td><input type="text" name="ListVO[${status.index}].standard" value = '${bom.standard }' readonly/></td>
   	  <td><input type="text" name="ListVO[${status.index}].unit" value = '${bom.unit }' readonly/></td>
   	  <td><input type="text" name="ListVO[${status.index}].division" value = '${bom.division }' readonly/>   </td>
   	  <td><input type="text" name="ListVO[${status.index}].precisionQuantity" value = '${bom.precisionQuantity }'/></td>
   	  <td><input type="text" name="ListVO[${status.index}].loss" value = '${bom.loss }'/></td>
   	  <td><input type="text" value = '${bom.precisionQuantity+(bom.precisionQuantity * (bom.loss * 0.01)) }' readonly/></td>
    </tr>
    </c:forEach> 

    <tr id ="insertTest" align="center">
    <td></td>
    	<td><input type="text" id="no" name="ListVO[${fn:length(bomView) }].no" value='${inputNo }' readonly style="width:100%"/></td>
    	<input type="hidden" id="parent" name="ListVO[${fn:length(bomView) }].parent" value = '${param.itemNumber }' />
    	<td><input type="text" id="itemNumber" name="ListVO[${fn:length(bomView) }].itemNumber" value='${itemNumber }' ondblclick="search2()" readonly/></td>
    	<td><input type="text" id="itemName" name="ListVO[${fn:length(bomView) }].itemName" value='${itemName }' readonly/></td>
    	<td><input type="text" id="standard" name="ListVO[${fn:length(bomView) }].standard" value='${standard }' readonly/></td>
    	<td><input type="text" id="unit" name="ListVO[${fn:length(bomView) }].unit" value='${unit }' readonly/></td>
    	<td><input type="text" id="division" name="ListVO[${fn:length(bomView) }].division" value='${division }'/></td>
    	<td><input type="text" id="precisionQuantity" name="ListVO[${fn:length(bomView) }].precisionQuantity" /></td>
    	<td><input type="text" id="loss" name="ListVO[${fn:length(bomView) }].loss" /></td>
    	<td><input type="text" readonly id="actualQuantity"/></td>
    </tr>
     
                </table>
                 
            </div>
            <!-- 합계 출력부 -->
            <div id="resultWindow">
                합 계 <span style="margin-left: 100px;">정미수량 <input type="text"></span><span style="margin-left: 100px;">필요수량 <input type="text"></span>
            </div>
            <!-- 합계 출력부 종료 -->
        </container2>
        
      <script>
      function isEmpty(str){
 	     
 	     if(typeof str == "undefined" || str == null || str == "")
 	         return true;
 	     
 	     else
 	         return false ;
 	     
 	 	}
      
      var itemNumber = document.getElementById("itemCode");

      
      var precisionQuantity = document.getElementById("precisionQuantity");
      var loss = document.getElementById("loss");
      var startDate = document.getElementById("startDate");
      var endDate = document.getElementById("endDate");
     	  var actualQuantity = document.getElementById('actualQuantity');
     	  var actualQuantity1 = document.getElementById('actualQuantity1');

      var save_button = document.getElementById("save");
      var update_button = document.getElementById('update');
      actualQuantity.onfocus = function(){
    	  var loss = document.getElementById('loss');
    	  var precisionQuantity = document.getElementById('precisionQuantity');
    	  var preQuan = parseFloat(precisionQuantity.value);
    	  var lossInt = parseFloat(loss.value);
    	  actualQuantity.value = preQuan + (preQuan * (lossInt/100));

      }

      function search2(){
    	
      	openWindowPop('${contextPath}/member/bomcodehelper.do','codehelper');
    	 
      }
      function setChildValue(name){
    	  
    	  const URLSearch = new URLSearchParams(location.search);
		  URLSearch.set('submit', '2');
		  const newParam = URLSearch.toString();
        if(URLSearch.get('itemCode') == null){
		window.location.href = location.pathname +'?'+newParam + '&itemCode=' + name;
        }
        else{
        	URLSearch.set('itemCode', name);
        	const newParam = URLSearch.toString();
        	window.location.href = location.pathname +'?'+newParam;
        }
        
    }
      
      function updateRow(){
    	  var workOrderTable = document.getElementById('workOrderTable');
          var row = workOrderTable.insertRow(); 
          const URLSearch = new URLSearchParams(location.search);
          URLSearch.set('submit', '1');
		  const newParam = URLSearch.toString();
		 var link = location.pathname +'?'+newParam;
  			 document.getElementById("precisionQuantity").disabled = true;
  		     document.getElementById("loss").disabled = true;
  		     document.getElementById("no").disabled = true;
  		   	 var articleNOInput = document.createElement("input");
		     articleNOInput.setAttribute("type","hidden");
		     articleNOInput.setAttribute("name","path");
		     articleNOInput.setAttribute("value", link);
		     document.getElementById('regBOM').appendChild(articleNOInput);
           document.getElementById('regBOM').action = "${contextPath}/member/updateBOM.do";
  			document.getElementById('regBOM').submit();  
           document.getElementByName('updateTest').action = "${contextPath}/member/updateBOM.do";
  			document.getElementByName('updateTest').submit(); 
      }
      view_button.onclick = function(){
		  const URLSearch = new URLSearchParams(location.search);
		  URLSearch.set('submit', '1');
		  const newParam = URLSearch.toString();

		  window.open(location.pathname + '?' + newParam, '_self');
  	}
      
      function newRow(){
          // dao에서 저장
    	 
          const URLSearch = new URLSearchParams(location.search);
		  URLSearch.set('submit', '1');
		  const newParam = URLSearch.toString();
		 var link = location.pathname +'?'+newParam;
  			var articleNOInput = document.createElement("input");
  		     articleNOInput.setAttribute("type","hidden");
  		     articleNOInput.setAttribute("name","path");
  		     articleNOInput.setAttribute("value", link);
  		     
  		   var itemNumber = document.getElementById("itemNumber").value;
  	      var precisionQuantity = document.getElementById("precisionQuantity").value;
  	      var loss = document.getElementById("loss").value;
  	     	  var actualQuantity = document.getElementById('actualQuantity').value;
  		     
  		   if (isEmpty(itemNumber)){
	      		alert("품번값이 비어져있습니다. 값을 추가해주세요!");
	      		document.getElementById("itemNumber").focus();
	      		return false;

	  		}
  		   else 
  			   if (isEmpty(precisionQuantity)){
	      		alert("정미수량값이 비어져있습니다. 값을 추가해주세요!");
	      		document.getElementById("precisionQuantity").focus();
	      		return false;

 	  		}
		   else if(isEmpty(loss)){
	      		alert("loss값이 비어져있습니다. 값을 추가해주세요!");		            	
	      		document.getElementById("loss").focus();
	      		return false;
		   }
		   else if(isEmpty(actualQuantity)){
	      		alert("필요수량값이 비어져있습니다. 값을 추가해주세요!");		            	
	      		document.getElementById("actualQuantity").focus();
	      		return false;
		   }
		   else{
  		     document.getElementById('regBOM').appendChild(articleNOInput);
            document.getElementById('regBOM').action = "${contextPath}/member/addBOM.do";
  			document.getElementById('regBOM').submit();  
  
		   }
  		     
  		     
		
      }

      
     function deleteData() {
    	  var item = document.getElementsByName("content").length;
    	  var number = document.getElementById("factory");
    	  var name = document.getElementById("ckfactory");
    	  var no = "";
    	  var ary = [];
    	  for(var i=0; i<item;i++){
    		  if(document.getElementsByName("content")[i].checked==true){
    			  no = document.getElementsByName("content")[i].value;
    			  ary.push(no);
    		  }
    	  }
	      	if(ary.length === 0 || ary === null){ //체크박스가 아무것도 체크되지 않았을때
				alert('삭제할 목록의 체크박스를 선택해주세요');
				//window.history.back();
			}
	    	else {//컨트롤러로 해당목록의 no값을 보낸다
    			  window.location.href = "${contextPath}/member/delBOM.do?no="+ary+"&&itemNumber="+number.value+"&&itemName="+name.value;
	    		alert('삭제되었습니다');
	
	    	}
      }
     view_button.onclick = function(){
		  const URLSearch = new URLSearchParams(location.search);
		  URLSearch.set('submit', '1');
		  const newParam = URLSearch.toString();

		  window.open(location.pathname + '?' + newParam, '_self');
 	}
      </script>
      </form>
</body>
</html>