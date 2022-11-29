<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"    
    isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>Insert title here</title>
<style>
#contents1{
            position: absolute;
            padding: 10px;
            right: 0;
            top: 15%;
            width: 85%;
            height: 10%;
            border: 1px solid black;
            z-index: 1;
        }
        #contents2{
            position: absolute;
            right: 0;
            top: 25%;
            width: 85%;
            height: 35%;
            border: 1px solid black;
            z-index: 1;
        }
        #contents3{
            position: absolute;
            right: 0;
            top:60%;
            width: 85%;
            height: 35%;
            border: 1px solid black;
            z-index: 1;
        }
        .con1_search{
            padding:0;
            text-align: center;
            /* position: absolute; ĭ ���߶� ����*/
            top: 25%;
            left: 5%;
        }
          #searchForm {
            height: 100%;
            margin: 10px 20px;
            padding:0;
            text-align: center;
        }

        #workOrderDetail{
            height: 100%;
            overflow: scroll;
        }
        #workOrderInfo {
            height: 100%;
            width: 100%;
            overflow: scroll;
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
<container1 id = contents1>
            <form id="searchForm">
                <table class="con1_search">
                    <tr>
                        <td>�����</td>
                        <td style="width: 80px;"><input type="text" value="${param.factoryNumber }" style="width: 100%; background-color: yellow;"/></td>
                        <td colspan="3"><input type="text" value="${param.factoryName }" disabled style="width: 100%;"/></td>
                        <td><a href="javascript:search1()"><i class="fas fa-search" style="color: blue;"></i></td> 
    
                        <td colspan="5" style="width: 80px;">�μ�</td>
                        <td style="width: 80px;"><input type="text" value="${param.departmentCode }" style="width: 100%; background-color: yellow;"/></td>
                        <td><input type="text" value="${param.departmentName }" disabled/></td>
                        <td><a href="javascript:search2()"><i class="fas fa-search" style="color: blue;"></i></td>
                        
                    </tr>
                    
                    <tr>
                        <td>������</td>
                        <td colspan="2" style="width: 50px;"><input type="date"  id='searchStartDate' style="width: 100%;"/></td>
                        <td>~</td>
                        <td ><input type="date" id='searchEndDate' style="width: 100%;"/></td>
                        <td></td>
    
                        <td colspan="5" style="width: 80px;">���</td>
                        <td style="width: 80px;"><input type="text" style="width: 100%; background-color: yellow;"/></td>
                        <td><input type="text" name="" disabled/></td>
                        <td > <i class="fas fa-search" style="color: blue;"></i></td>

                        <td>
                            <input type="button" value="����ó��" onClick="closing();" style="padding: 5px; margin-left: 30px;"></input>
                        </td>
                        <td>
                            <input type="button" value="�������" onClick="closingCancle();" style="padding: 5px;"></input>
                        </td>
                    </tr>
                </table>
                </form>
        </container1>
        <container2 id="contents2">
           <!-- �����Ϻ� -->
           <div id="workOrderDetail">
             <form id="dataForm" mehtod="get" commandName="ListVO">
            <table id="workOrderDetailTable">
                <thead>
                    <td><input type="checkbox" name="content" onclick="selectAll(this)"/></td>
                    <td>�۾����ù�ȣ</td>
                    <td>������</td>
                    <td>�Ϸ���</td>
                    <td>ǰ��</td>
                    <td>ǰ��</td>
                    <td>�԰�</td>
                    <td>����</td>
                    <td>���ü���</td>
                    <td>����</td>
                    <td>����</td>
                </thead>
                <!-- �׽�Ʈ�� ������, ���� ǥ�������� �����ʿ� -->
                <tbody>
                     <c:forEach var="info" items="${infoList}" varStatus="status">   
                     <tr id="updateData" align="center">
                     	<td><input type="checkbox" name="content" value="${info.workOrderNumber }" /></td>
                     	<td><input type="text" name="ListVO[${status.index }].workOrderNumber" value="${info.workOrderNumber}" readonly /></td>
                     	<td><input type="date" name="ListVO[${status.index }].instructiondate" value="${info.instructionDate}" readonly /></td>
                     	<td><input type="date" name="ListVO[${status.index }].dueDate" value="${info.dueDate}" readonly/></td>
                     	<td><input tpye="text" name="ListVO[${status.index }].itemCode" value="${info.itemCode }" readonly /></td>
                     	<td><input type="text" name="ListVO[${status.index }].itemName" value="${info.itemName}" readonly /></td>
                     	<td><input type="text" name="ListVO[${status.index }].standard" value="${info.standard}" readonly /></td>
                     	<td><input type="text" name="ListVO[${status.index }].inventoryUnit" value="${info.inventoryUnit}" readonly /></td>
                     	<td><input type="text" name="ListVO[${status.index }].indicated" value="${info.indicated}" readonly/></td>
                     	<td style="width:13px;"><input type="text" name="ListVO[${status.index }].status" value="${info.status}" readonly /></td>
                     	<td style="width:20px;"><input type="text" name="ListVO[${status.index }].workplaceCode" value="${info.workplaceCode}" readonly /></td>
                     </tr>
                     </c:forEach>                   
                </tbody>
            </table>
            </form>
        </div>
        <!-- �����Ϻ� ���� -->
        </container2>
        <container3 id="contents3">
            <div id="workOrderInfo">
                <table id="workOrderTable">
                    <thead>
                        <td> </td>
                        <td>NO</td>
                        <td>������</td>
                        <td>�Ϸ���</td>
                        <td>����</td>
                        <td>�۾���</td>
                        <td>���ü���</td>
                        <td>��������</td>
                        <td>�����ܷ�</td>
                        <td>�ܰ�</td>
                        <td>�ݾ�</td>
                        <td>�˻�</td>
                        <td>���</td>
                    </thead>
                    <!-- �׽�Ʈ�� ������, ���� ǥ�������� �����ʿ� -->
                    <tbody>
                    
 					<c:forEach var="detail" items="${detailList}" varStatus="status">
 					    <tr>
                        <td><input type="checkbox" value="${detail.OPNumber }" name="content2"/></td>
 						<td><input type="text" name="DetailVO[${status.index }].OPNumber" value="${detail.OPNumber }" readonly/></td>
                        <td><input type="date" name="DetailVO[${status.index }].instructionDate" value="${detail.instructionDate }" readonly /></td>
                        <td><input type="date" name="DetailVO[${status.index }].dueDate" value="${detail.dueDate }" readonly /></td>
                        <td><input type="text" name="DetailVO[${status.index }].processCode" value="${detail.processCode }" readonly/></td>
                        <td><input type="text" name="DetailVO[${status.index }].workplaceCode" value="${detail.workplaceCode}" readonly/></td>
                        <td><input type="text" name="DetailVO[${status.index }].indicatedQuantity" value="${detail.indicatedQuantity}" readonly/></td>
                        <td><input type="text" name="DetailVO[${status.index }].sumPerformanceQuantity" value="${detail.sumPerformanceQuantity}" readonly/></td>
                        <td><input type="text" name="DetailVO[${status.index }].remainingPerformance" value="${detail.remainingPerformance}" readonly/></td>
                        <td><input type="text" name="DetailVO[${status.index }].unitPrice" value="${detail.unitPrice}" readonly/></td>
                        <td><input type="text" value="${detail.indicatedQuantity*detail.unitPrice}" readonly/></td>                        
                        <td><input type="text" name="DetailVO[${status.index }].inspection" value="${detail.inspection}" readonly/></td>                        
                        <td><input type="text" name="DetailVO[${status.index }].note" value="${detail.note}" readonly/></td>
                        </tr>
                        </c:forEach>                  
                    </tbody>
                </table>
            </div>
        </container3>
      
</body>
</html>
<script>
 /* �˻��� date onChange �Լ� ���� */
 		 		var startDate = "";
    	var endDate = "";
    	
    	$('#searchStartDate').change(function (){
            var date = $('#searchStartDate').val();
            startDate = date;
        });
    	$('#searchEndDate').change(function (){
            var date = $('#searchEndDate').val();
            endDate = date;
        });
    	
      function search1(){  
    	  openWindowPop('http://localhost:8090/webERP/member/factorySearch.do','factorySearch');  	  
      }
      function search2(){  
	      openWindowPop('http://localhost:8090/webERP/member/departmentSearch.do','departmentSearch');  	  
		}
      
      /* ��ȸ��ư Ŭ���� ��� ���� */
      view_button.onclick = function(){
		 if(startDate>endDate){
			  alert("���ñⰣ �������� �����Ϻ��� ������ �����ϴ�.");
		  } else{
			  
		var item = document.getElementsByName("content").length;
	    var no = "";
	    var ary = [];
	    for(var i=0; i<item;i++){
	    	if(document.getElementsByName("content")[i].checked==true){
	      		no = document.getElementsByName("content")[i].value;
	      		ary.push(no);
	      	  }
	     }
	      
    	  const URLSearch = new URLSearchParams(location.search);
		  URLSearch.set('startDate', startDate);
		  URLSearch.set('endDate', endDate);
		  URLSearch.set('searchNumber', ary);
		  const newParam = URLSearch.toString();

		  window.open(location.pathname + '?' + newParam, '_self');
		  }
  	}
      
      /* ���� ��ư ��� ���� */
      
        function newRow(){
          // dao���� ����
    	 
        	//var row = workOrderTable.insertRow(); 
          	//const URLSearch = new URLSearchParams(location.search);
		 	//const newParam = URLSearch.toString();
			//var link = location.pathname +'?'+newParam;
  			//var linkPath = document.createElement("input");
  		    //linkPath.setAttribute("type","hidden");
  		    //linkPath.setAttribute("name","path");
  		    //linkPath.setAttribute("value", link);
  		    //document.getElementById('dataForm').appendChild(linkPath);
            //document.getElementById('dataForm').action = "${contextPath}/member/addOperationInstruction.do";
  			//document.getElementById('dataForm').submit();  
        	alert("Ȯ��, ������ ���´� ������ �� �����ϴ�!");
      }
      
        function updateRow() {
        	/*
        	var row = workOrderTable.insertRow(); 
        	const URLSearch = new URLSearchParams(location.search);
        	const newParam = URLSearch.toString();
  		 	var link = location.pathname +'?'+newParam;
  		 	document.getElementById("dueDate").disabled = true;
		    document.getElementById("indicated").disabled = true;
		    document.getElementById("instructionDate").disabled = true;
    		var linkPath = document.createElement("input");
    		linkPath.setAttribute("type","hidden");
    		linkPath.setAttribute("name","path");
    		linkPath.setAttribute("value", link);
  		    document.getElementById('dataForm').appendChild(linkPath);
            document.getElementById('dataForm').action = "${contextPath}/member/updateOperationInstruction.do";
    		document.getElementById('dataForm').submit();  
    		*/
        	alert("Ȯ��, ������ ���´� ������ �� �����ϴ�!");
        }
        
      
        function deleteData() {
        	/*
      	  var item = document.getElementsByName("content").length;
      	  var no = "";
      	  var ary = [];
      	  for(var i=0; i<item;i++){
      		  if(document.getElementsByName("content")[i].checked==true){
      			  no = document.getElementsByName("content")[i].value;
      			  ary.push(no);
      		  }
      			  window.location.href = "${contextPath}/member/delOperationInstruction.do?workOrderNumber="+ary;
      	  }
      	  */
        	alert("Ȯ��, ������ ���´� ������ �� �����ϴ�!");
        }
        
        function closing() {
        	var item = document.getElementsByName("content").length;
        	  var no = "";
        	  var ary = [];
        	  for(var i=0; i<item;i++){
        		  if(document.getElementsByName("content")[i].checked==true){
        			  no = document.getElementsByName("content")[i].value;
        			  ary.push(no);
        		  }
        	  }
        	  if(ary.length === 0 || ary === null){ //üũ�ڽ��� �ƹ��͵� üũ���� �ʾ�����
      			alert('üũ�ڽ��� �������� �ʾҽ��ϴ�!');
      			window.location.href = "${contextPath}/member/operinsclo.do";
      		}
          	else {//��Ʈ�ѷ��� �ش����� no���� ������
          		alert('����ó�� �Ǿ����ϴ�!');
        			window.location.href = "${contextPath}/member/closingDetail.do?workOrderNumber="+ary;

          	}
        }
        
        function closingCancle() {
        	var item = document.getElementsByName("content").length;
        	  var no = "";
        	  var ary = [];
        	  for(var i=0; i<item;i++){
        		  if(document.getElementsByName("content")[i].checked==true){
        			  no = document.getElementsByName("content")[i].value;
        			  ary.push(no);
        		  }
        	  }
        	  
        	  if(ary.length === 0 || ary === null){ //üũ�ڽ��� �ƹ��͵� üũ���� �ʾ�����
        			alert('üũ�ڽ��� �������� �ʾҽ��ϴ�!');
        			window.location.href = "${contextPath}/member/operinsclo.do";
        		}
            	else {//��Ʈ�ѷ��� �ش����� no���� ������
            		alert('����ó���� ��� �Ǿ����ϴ�!');
        			window.location.href = "${contextPath}/member/closingCancleDetail.do?workOrderNumber="+ary;
          			
            	}
        }

      </script>