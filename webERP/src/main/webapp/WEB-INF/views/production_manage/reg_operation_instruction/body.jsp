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
<title>Insert title here</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
#contents1{
            position: absolute;
            left: 15%;
            top: 15%;
            width: 85%;
            height: 10%;
            border: 1px solid black;
            z-index: 1;
        }
        #contents2{
            position: absolute;
            left: 15%;
            top: 25%;
            width: 85%;
            height: 70%;
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
            margin: 0;
            padding:0;
            text-align: center;
        }
        /* �����̳� ��Ÿ�Ϻ� */
        #workOrderInfo {
            overflow: scroll;
            height: 100%;
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
                        <td>���ñⰣ</td>
                        <td colspan="2" style="width: 50px;"><input type="date"  id='searchStartDate' style="width: 100%;"/></td>
                        <td>~</td>
                        <td ><input type="date" id='searchEndDate' style="width: 100%;"/></td>
                        <td></td>
    
                        <td colspan="5" style="width: 80px;">���</td>
                        <td style="width: 80px;"><input type="text" style="width: 100%; background-color: yellow;"/></td>
                        <td><input type="text" name="" disabled/></td>
                        <td > <i class="fas fa-search" style="color: blue;"></i></td>
                        <td>
                            <input type="button" value="�����ȹ��ȸ" style="padding: 5px;" onClick="searchPlan()"></input>
                        </td>
                    </tr>
                </table>
                </form>
        </container1>
        <container2 id= contents2>
            <div id="workOrderInfo">
	         <form id="dataForm" mehtod="get" commandName="ListVO">
                <table id="workOrderTable">
                    <thead>
                        <td><input type="checkbox" name="content" onclick="selectAll(this)"/></td>
                        <td>�۾����ù�ȣ</td>
                        <td>������</td>
                        <td>������</td>
                        <td>ǰ��</td>
                        <td>ǰ��</td>
                        <td>�԰�</td>
                        <td>����</td>
                        <td>���ü���</td>
                        <td>����</td>
                        <td>�˻�</td>
                        <td>����</td>
                        <td>�۾���</td>
                        <td>���꼳��</td>
                        <td>�۾���</td>
                        <td>���</td>
                    </thead>
                    <!-- �׽�Ʈ�� ������, ���� ǥ�������� �����ʿ� -->
                    <tbody>
                    <c:forEach var="info" items="${infoList}" varStatus="status">   
                     <tr id="updateData" align="center">
                     	<td><input type="checkbox" name="content" value="${info.workOrderNumber }" /></td>
                     	<td><input type="text" name="ListVO[${status.index }].workOrderNumber" value="${info.workOrderNumber}" readonly /></td>
                     	<td><input type="date" name="ListVO[${status.index }].instructiondate" value="${info.instructionDate}" readonly /></td>
                     	<td><input type="date" name="ListVO[${status.index }].dueDate" value="${info.dueDate}" /></td>
                     	<td><input tpye="text" name="ListVO[${status.index }].itemCode" value="${info.itemCode }" readonly /></td>
                     	<td><input type="text" name="ListVO[${status.index }].itemName" value="${info.itemName}" readonly /></td>
                     	<td><input type="text" name="ListVO[${status.index }].standard" value="${info.standard}" readonly /></td>
                     	<td><input type="text" name="ListVO[${status.index }].inventoryUnit" value="${info.inventoryUnit}" readonly /></td>
                     	<td><input type="text" name="ListVO[${status.index }].indicated" value="${info.indicated}" /></td>
                     	<td style="width:13px;"><input type="text" name="ListVO[${status.index }].status" value="${info.status}" readonly /></td>
                     	<td style="width:20px;"><input type="text" name="ListVO[${status.index }].inspection value="${info.inspection}" readonly /></td>
                     	<td><input type="text" name="ListVO[${status.index }].processCode" value="${info.processCode }" /></td>
                        <td><input type="text" name="ListVO[${status.index }].workplaceCode" value="${info.workplaceCode }" /></td>
                     	<td><input type="text" name="ListVO[${status.index }].productionFacility" value="${info.productionFacility}" /></td>
                     	<td><input type="text" name="ListVO[${status.index }].taskTeam" value="${info.taskTeam}" /></td>
                     	<td><input type="text" name="ListVO[${status.index }].note" value="${info.note}" readonly /></td>
                     	<td><input type="hidden" name="ListVO[${status.index }].productionPlanCode" value="${info.productionPlanCode }" /></td>
                     </tr>
                     </c:forEach>
                     <tr>
                        <td><input type="checkbox" value = "check1" name="content"/></td>
                        <td><input type="text" id="workOrderNumber" name="ListVO[${fn:length(infoList)}].workOrderNumber" readonly /></td>
                        <td><input type="date" id="instructionDate" name="ListVO[${fn:length(infoList)}].instructionDate" value="${param.workDate }"/></td>
                        <td><input type="date" id="dueDate" name="ListVO[${fn:length(infoList)}].dueDate" value="${param.workDate }"/></td>
                        <td><input type="text" name="ListVO[${fn:length(infoList)}].itemCode" value="${param.itemCode }"/></td>
                        <td><input type="text" name="ListVO[${fn:length(infoList)}].itemName" value="${param.itemName }"/></td>
                        <td><input type="text" name="ListVO[${fn:length(infoList)}].standard" value="${param.standard }"/></td>
                        <td><input type="text" name="ListVO[${fn:length(infoList)}].inventoryUnit" value="${param.inventoryUnit }"/></td>
                        <td><input type="text" id="indicated" name="ListVO[${fn:length(infoList)}].indicated" value="${param.quantity }"/></td>
                        <td style="width:13px;"><input type="text" name="ListVO[${fn:length(infoList)}].status" readonly/></td>
                        <td style="width:20px;"><input type="text" name="ListVO[${fn:length(infoList)}].inspection" readonly/></td>
                        <td style="width:20px;"><input type="text" name="ListVO[${fn:length(infoList)}].processCode" ondblclick="processCodeSearch()" value="${param.processCode }" readonly/></td>
                        <td style="width:20px;"><input type="text" name="ListVO[${fn:length(infoList)}].workplaceCode" ondblclick="workplaceCodeSearch()" value="${param.workplaceCode }" readonly/></td>
                        <td><input type="text" name="ListVO[${fn:length(infoList)}].productionFacility" value="${param.facility }" ondblclick="facilitySearch()"/></td>
                        <td><input type="text" name="ListVO[${fn:length(infoList)}].taskTeam" value="${param.taskTeam }"/></td>
                        <td><input type="text" name="ListVO[${fn:length(infoList)}].note" value="${param.note }"/></td>
                        <td><input type="hidden" name="ListVO[${fn:length(infoList)}].productionPlanCode" value="${param.productionPlanCode }" /></td>
                     </tr>
                    </tbody>
                </table>
                </form>
            </div>
        </container2>
      
</body>
</html>
 <script>
 var dueDate = document.getElementById("dueDate").value;
 var indicated = document.getElementById("indicated").value;
 var instructionDate = document.getElementById("instructionDate").value;


 function isEmpty(str){
     
     if(typeof str == "undefined" || str == null || str == "")
         return true;
     
     else
         return false ;
     
 	}
  
   	
 /* input date�� ���� ��¥ �⺻�� ����*/
 document.getElementById('searchStartDate').value = new Date().toISOString().substring(0,10);;
 document.getElementById('searchEndDate').value = new Date().toISOString().substring(0,10);;
 
 /* �˻��� date onChange �Լ� ���� */
 		var startDate = new Date().toISOString().substring(0,10);;
    	var endDate = new Date().toISOString().substring(0,10);;
    	
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
      function searchPlan(){
    	  openWindowBroadPop('http://localhost:8090/webERP/member/productionPlanSearch.do','productionPlanSearch');
      }
      
      /* ��ȸ��ư Ŭ���� ��� ���� */
      view_button.onclick = function(){
		  if(startDate>endDate){
			  alert("���ñⰣ �������� �����Ϻ��� ������ �����ϴ�.");
		  } else{
			  
    	  const URLSearch = new URLSearchParams(location.search);
		  URLSearch.set('startDate', startDate);
		  URLSearch.set('endDate', endDate);
		  const newParam = URLSearch.toString();

		  window.open(location.pathname + '?' + newParam, '_self');
		  }
  	}
      
      /* ���� ��ư ��� ���� */
      
        function newRow(){
          // dao���� ����
    	 
        	var row = workOrderTable.insertRow(); 
          	const URLSearch = new URLSearchParams(location.search);
		 	const newParam = URLSearch.toString();
			var link = location.pathname +'?'+newParam;
  			var linkPath = document.createElement("input");
  		    linkPath.setAttribute("type","hidden");
  		    linkPath.setAttribute("name","path");
  		    linkPath.setAttribute("value", link);

  		   if (isEmpty(dueDate)||isEmpty(indicated)||isEmpty(instructionDate)){
	  		      		alert("���� ������ֽ��ϴ�. ���� �߰����ּ���!");
	  		            document.getElementById('dataForm').action = "${contextPath}/member/regoperins.do";
  		  }else{
			  		    document.getElementById('dataForm').appendChild(linkPath);
			            document.getElementById('dataForm').action = "${contextPath}/member/addOperationInstruction.do";
			  			document.getElementById('dataForm').submit();  
			  			alert("���� ����Ǿ����ϴ�!");
  		  }
      }
      
        function updateRow() {
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
      			  //window.location.href = "${contextPath}/member/delOperationInstruction.do?workOrderNumber="+ary;
      	  }
      	  
	      	if(ary.length === 0 || ary === null){ //üũ�ڽ��� �ƹ��͵� üũ���� �ʾ�����
				alert('������ ����� üũ�ڽ��� �������ּ���');
				window.location.href = "${contextPath}/member/regoperins.do";
			}
	    	else {//��Ʈ�ѷ��� �ش����� no���� ������
	    		alert('�����Ǿ����ϴ�');
	    		  window.location.href = "${contextPath}/member/delOperationInstruction.do?workOrderNumber="+ary;
	
	    	}
        }
        
        function facilitySearch(){
			openWindowPop('http://localhost:8090/webERP/member/facilitySearchPop.do','facilitySearch');
			}
        
        function setChildProcessCodeValue(name){
        	  
        	  const URLSearch = new URLSearchParams(location.search);  		  
    		  const newParam = URLSearch.toString();
            if(URLSearch.get('processCode') == null){
    		window.location.href = location.pathname +'?'+newParam + '&processCode=' + name;
            }
            else{
            	URLSearch.set('processCode', name);
            	const newParam = URLSearch.toString();
            	window.location.href = location.pathname +'?'+newParam;
            }
            
        }
          
          function setChildWorkplaceCodeValue(name){
        	  
        	  const URLSearch = new URLSearchParams(location.search);  		  
    		  const newParam = URLSearch.toString();
            if(URLSearch.get('workplaceCode') == null){
    		window.location.href = location.pathname +'?'+newParam + '&workplaceCode=' + name;
            }
            else{
            	URLSearch.set('workplaceCode', name);
            	const newParam = URLSearch.toString();
            	window.location.href = location.pathname +'?'+newParam;
            }
            
        }
          
    function processCodeSearch(){
  			openWindowPop('http://localhost:8090/webERP/member/processCodeSearchPop.do','processCodeSearch');
  	}
   	
   	function workplaceCodeSearch(){
  		openWindowPop('http://localhost:8090/webERP/member/workplaceCodeSearchPop.do','workplaceCodeSearch');
  	}
      </script>