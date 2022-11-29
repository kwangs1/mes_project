<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>    
<% 
	String custCode1 = request.getParameter("general_Customer_Code");
	String custCode = request.getParameter("custCode");
	String relCode = request.getParameter("relCode");
%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<c:forEach var="forward" items="${forwardInsert}">
	<c:set var="relCode" value="${forward.relCode}"/>
	<c:set var="relDate" value="${forward.relDate}"/>
	<c:set var="custCode" value="${forward.general_Customer_Code}"/>
	<c:set var="deadLine" value="${forward.deadLine}"/>
	<c:set var="note" value="${forward.note}"/>
	</c:forEach>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출고 처리 등록2</title>
<style>
        #contents2{
            position: absolute;
            right: 0;
            top: 25%;
            width: 85%;
            height: 35%;
            border: 1px solid black;
            z-index: 1;
        }
         #forwardingTable{
            width: 100%;
            text-align: center;
            border: 1px solid black;
        }
        #forwardingTable td:not(#no){
            width: 8%;
        }
        #forwardingTable td input{
            width: 100%;
        }
</style>
</head>
<body>
            <container2 id="contents2">
            <div id="forwardingInfo">
            <form id="dataForm" mehtod="get" commandName="ListVO">
           <table id="forwardingTable">
                <thead>
                    <td><input type="checkbox" id="check" name="content" onclick="selectAll(this)"/></td>
                    <td>출고번호</td>
                    <td>출고일자</td>
                    <td>고객</td>
                    <td>출고 구분</td>
                    <td>마감</td>
                    <td>비고</td>
                </thead>
                <c:forEach var="supForward" items="${submitCustList}" varStatus="status">
                <tbody id="updsupForward" align="center">
                    <td><input type="checkbox" value = "${supForward.relCode}" name="content" onclick='getCheckboxValue(event)'/></td>
                    <td><a href="javascript:popFunction1('${supForward.relCode}')">
                    	<input type="text" class = "relCode" name="ListVO[${status.index}].relCode" value="${supForward.relCode}" readonly/></a></td>
                    <td><input type="date"  name="ListVO[${status.index}].relDate" value="${supForward.relDate}" readonly style="background-color:rgb(255,255,149);"/></td>
                    <td><input type="text" class = "customerCode" name="ListVO[${status.index}].general_Customer_Code" value="${supForward.general_Customer_Code}" readonly style="background-color:rgb(255,255,149);"/>
                    <input type="hidden" value="${param.general_Customer_Name}"></td>
                    <td><input type="text" name="ListVO[${status.index}].releaseOX" value="${supForward.releaseOX}" style="background-color:rgb(255,255,149);"/></td>
                    <td><input type="text" name="ListVO[${status.index}].deadLine" value="${supForward.deadLine}"  /></td>
                    <td><input type="text" name="ListVO[${status.index}].note" value="${supForward.note}" /></td>
                </tbody>
                </c:forEach>
                
                <tbody id="insertsupForward" align="center">
                    <td><input type="checkbox"/></td>
                    <td><input type="text" id="relCode" name="ListVO[${fn:length(submitCustList)}].relCode"/></td>
                    <td><input type="date" id="relDate" name="ListVO[${fn:length(submitCustList)}].relDate"  style="background-color:rgb(255,255,149);"/></td>
                    <td><input type="text" id="custCode" name="ListVO[${fn:length(submitCustList)}].general_Customer_Code" value="${param.general_Customer_Code}"readonly style="background-color:rgb(255,255,149);"/></td>
                    <td><input type="text" id="releaseOX" name="ListVO[${fn:length(submitCustList)}].releaseOX" style="background-color:rgb(255,255,149);"/></td>
                    <td><input type="text" id="deadLine" name="ListVO[${fn:length(submitCustList)}].deadLine"/></td>
                    <td><input type="text" id="note" name="ListVO[${fn:length(submitCustList)}].note"/></td>
                </tbody>
           </table>
           </form>
           </div>
        </container2>
        <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
        <script type="text/javascript">
        var text_code = document.getElementById("code");
    	var text_name = document.getElementById("name");
    	var relCode = document.getElementById("relCode");
       	var relDate = document.getElementById("relDate");
        var custCode = document.getElementById("custCode");
        var deadLine = document.getElementById("deadLine");
        var releaseOX = document.getElementById("releaseOX");
        var note = document.getElementById("note");
        var itemCode = document.getElementById("item_code");
    	var itemName = document.getElementById("item_name");
    	var stand = document.getElementById("stand");
       	var unit = document.getElementById("unit");
        var orderQuant = document.getElementById("orderQuant");
        var price = document.getElementById("price");
        var dueDate = document.getElementById("dueDate");
        var expDate = document.getElementById("expDate");
        var orderOX = document.getElementById("orderOX");
        var inspection = document.getElementById("inspection");

        function popFunction1(relCode){
        	relCode.value = relCode;
        }
	
           	function openWindowPop(url, name){
			var options = 'top=0, left=0, width=320, height=420, status=no, menubar=no, toolbar=no, resizable=no';
			window.open(url, name, options);
		}
		function selectAll(selectAll){
            const checkbox = document.getElementsByName('content');
            checkbox.forEach((checkbox) => {
                checkbox.checked = selectAll.checked;
            });
        }
       	view_button.onclick = function(){
      	  const URLSearch = new URLSearchParams(location.search);
      	  URLSearch.set('submit', '1');
      	  const newParam = URLSearch.toString();
      	  window.open(location.pathname + '?' + newParam, '_self');
      }
       
    	function setChildValue(name){
			const URLSearch = new URLSearchParams(location.search);
			URLSearch.set('submit','2');
			const newParam = URLSearch.toString();
			if(URLSearch.get('general_Customer_Code') == null){
				window.location.href = location.pathname + '?' + newParam + '&general_Customer_Code=' + text_code;
			}
			else{
				URLSearch.set('general_Customer_Code',name);
				const newParam = URLSearch.toString();
				window.location.href = location.pathname + '?' + newParam;
			}
		}	
    	function deleteData() {
    	    
	  		var item = document.getElementsByName("content").length;
	  		var no = "";
	  		var ary = [];
	  		for(var i=0; i<item;i++){
		  		if(document.getElementsByName("content")[i].checked==true){
					no = document.getElementsByName("content")[i].value;
			
			   		ary.push(no); 
		  		}
		 	  	window.location.href = "${contextPath}/member/delforward.do?no="+ary;
	  		}
		}
       	
    	/* 저장 버튼 기능 구현 */
        
        function newRow(){
          // dao에서 저장
        	if(relDate.value == ""||custCode.value == ""||releaseOX.value =="" ){
        		alert ("필수입력사항을 입력하십시오.");
        	}
    			else{
        
           var row = forwardingTable.insertRow(); 
             const URLSearch = new URLSearchParams(location.search);
          const newParam = URLSearch.toString();
         var link = location.pathname +'?'+newParam;

           var linkPath = document.createElement("input");
            linkPath.setAttribute("type","hidden");
            linkPath.setAttribute("name","path");
            linkPath.setAttribute("value", link);
            
            document.getElementById('dataForm').appendChild(linkPath);
            document.getElementById('dataForm').action = "${contextPath}/member/addforward.do";
           document.getElementById('dataForm').submit();  
     		}    	
          }
    	   $('.relCode').dblclick(function(e) {           
           var code = $(this).val();
       	$.ajax({ type: "GET",
       		url: "/webERP/member/itemtableview.do",
       		data : {	"relCode" : code},
       		//dataType : 'text',
       		success: function(responseData){
       			var data = responseData.subForward;

       			// id=itemPop 안의 모든 요소 지우기
        			$("#itemPop").empty();
       			
       		/* 	var tbody4index = 0; */
        			for(var i =0; i<data.length; i++){
           				var html = '';
           				html += '<tr>';    
               			html += '<td style="width: 5%;"><input type = "checkbox" name = "contentItem"  value = "'+data[i].no+'"></td>';  	
               			html += '<td><input type = "text" name = "ListVO['+i+'].no"  value = "'+data[i].no+'" "></td>';
            			html += '<td><input type = "text" name = "ListVO['+i+'].relCode"  value = "'+data[i].relCode+'" "></td>';  	
               			html += '<td><input type = "text" name = "ListVO['+i+'].item_code"  value = "'+data[i].item_code +'" "></td>';  		
               			html += '<td><input type = "text" name = "ListVO['+i+'].item_name" value = "'+data[i].item_name +'"></td>';  			
               			html += '<td><input type = "text" name = "ListVO['+i+'].stand" value = "'+data[i].stand+'"></td>';  			
               			html += '<td><input type = "text" name = "ListVO['+i+'].orderQuant" value = "'+data[i].orderQuant+'"></td>';  			
               			html += '<td><input type = "text" name = "ListVO['+i+'].unit" value = "'+data[i].unit+'"></td>';  			
               			html += '<td><input type = "text" name = "ListVO['+i+'].price" value = "'+data[i].price+'"></td>'; 
               			html += '<td><input type = "text" name = "공급가" value = "'+(data[i].price*data[i].orderQuant)+'"></td>';
               			html += '<td><input type = "text" name = "부가세" value = "'+((data[i].price*data[i].orderQuant)*0.1)+'"></td>';
               			html += '<td><input type = "text" name = "합계액" value = "'+((data[i].price*data[i].orderQuant)*1.1)+'"></td>';
               			html += '<td><input type = "date" name = "ListVO['+i+'].dueDate" value = "'+data[i].dueDate+'"></td>';  			
               			html += '<td><input type = "date" name = "ListVO['+i+'].expDate" value = "'+data[i].expDate+'"></td>';  			
               			html += '<td><input type = "text" name = "ListVO['+i+'].orderOX" value = "'+data[i].orderOX+'"></td>';  			
               			html += '<td><input type = "text" name = "ListVO['+i+'].inspection" value = "'+data[i].inspection+'"></td>';  			
               			html += '</tr>';
               			//  id=itemPop 안에 넣기
               			$("#itemPop").append(html);
       			} 
       			 
       			/* addTbody3(); 
       			
   			} */
       		},
       		error: function(request,status,error){
       	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       	       }
       	});
       });
    	
		/*수정버튼*/
        function updateRow() {
        	  var updsupForward = document.getElementById('updsupForward');
              var row = updsupForward.insertRow(); 
              const URLSearch = new URLSearchParams(location.search);
              URLSearch.set('submit', '1');
    		  const newParam = URLSearch.toString();
    		 var link = location.pathname +'?'+newParam;
      			 document.getElementById("relCode").disabled = true;
      		     document.getElementById("relDate").disabled = true;
      		   	 var articleNOInput = document.createElement("input");
    		     articleNOInput.setAttribute("type","hidden");
    		     articleNOInput.setAttribute("name","path");
    		     articleNOInput.setAttribute("value", link);
    		     document.getElementById('dataForm').appendChild(articleNOInput);
               document.getElementById('dataForm').action = "${contextPath}/member/updForward.do";
      			document.getElementById('dataForm').submit();  
               document.getElementByName('updsupForward').action = "${contextPath}/member/updForward.do";
      			document.getElementByName('updsupForward').submit(); 
          }
        	
    	
        </script>
</body>
</html>