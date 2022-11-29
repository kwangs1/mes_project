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
        
        /* �����̳� ��Ÿ�Ϻ� */
        #workOrderDetail{
            overflow: scroll;
            height: 100%;
        }
        #workOrderInfo {
            width: 100%;
            overflow: scroll;
            height: 100%;
        }
        /* �����̳� ��Ÿ�Ϻ� ���� */
        

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
                            <input type="button" value="������" onClick="materialUse();" style="padding: 5px; margin-left: 30px;"></input>
                        </td>
                    </tr>
                </table>
                </form>
        </container1>
        <container2 id="contents2">
             <div id="workOrderDetail">
              <form id="dataForm" mehtod="get" commandName="ListVO">
                <table id="workOrderDetailTable">
                    <thead> 
                        <td><input type="checkbox" name="content" onclick="selectAll(this)"/></td>
                        <td>�۾����ù�ȣ</td>
                        <td>����������</td>
                        <td>�۾���</td>
                        <td>������</td>
                        <td>������</td>
                        <td>ǰ��</td>
                        <td>ǰ��</td>
                        <td>�԰�</td>
                        <td>����</td>
                        <td>���ü���</td>
                        <td>��������</td>
                        <td>�����ܷ�</td>
                        <td>����</td>
                        <td>�۾�����</td>
                        <td>�˻�</td>
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
                     	<td><input type="text" name="ListVO[${status.index }].materialstatus" value="${info.materialstatus}" readonly /></td>
                     	<td><input type="text" name="ListVO[${status.index }].workplaceCode" value="${info.workplaceCode}" readonly /></td>
                     	<td><input type="date" name="ListVO[${status.index }].instructiondate" value="${info.instructionDate}" readonly /></td>
                     	<td><input type="date" name="ListVO[${status.index }].dueDate" value="${info.dueDate}" readonly/></td>
                     	<td><input type="text" name="ListVO[${status.index }].itemCode" value="${info.itemCode }" readonly /></td>
                     	<td><input type="text" name="ListVO[${status.index }].itemName" value="${info.itemName}" readonly /></td>
                     	<td><input type="text" name="ListVO[${status.index }].standard" value="${info.standard}" readonly /></td>
                     	<td><input type="text" name="ListVO[${status.index }].inventoryUnit" value="${info.inventoryUnit}" readonly /></td>
                     	<td><input type="text" name="ListVO[${status.index }].indicated" value="${info.indicated}" readonly/></td>
                     	<td><input type="text" name="ListVO[${status.index }].sumPerformanceQuantity" value="${info.sumPerformanceQuantity}" readonly/></td>
                     	<td><input type="text" name="ListVO[${status.index }].remainingPerformance" value="${info.remainingPerformance}" readonly/></td>
                     	<td style="width:13px;"><input type="text" name="ListVO[${status.index }].status" value="${info.status}" readonly /></td>
                     	<td><input type="text" name="ListVO[${status.index }].workSortation" value="${info.workSortation}" readonly/></td>
                     	<td style="width:20px;"><input type="text" name="ListVO[${status.index }].inspection" value="${info.inspection}" readonly /></td>
                     	<td><input type="text" name="ListVO[${status.index }].productionFacility" value="${info.productionFacility}" readonly/></td>
                        <td><input type="text" name="ListVO[${status.index }].taskTeam" value="${info.taskTeam}" readonly/></td>
                     	<td><input type="text" name="ListVO[${status.index }].note" value="${info.note}" readonly /></td>
                     </tr>
                     </c:forEach>
                    </tbody>
                </table>
                </form>
             </div>
        </container2>
        
        <container3 id="contents3">
            <div id="workOrderInfo">
            <form id="detailForm" mehtod="get" commandName="DetailVO">
                <table id="workOrderTable">
                    <thead>
                        <td> </td>
                        <td>�۾�������ȣ</td>
                        <td>����������</td>
                        <td>�԰�â��</td>
                        <td>������</td>
                        <td>����</td>
                        <td>��������</td>
                        <td>�˻�</td>
                        <td>���</td>
                        <td>�۾����ù�ȣ</td>
                    </thead>
                    <!-- �׽�Ʈ�� ������, ���� ǥ�������� �����ʿ� -->
                    <tbody>
                        <c:forEach var="detail" items="${detailList}" varStatus="status">
  					 <tr>
  					 	<td><input type="checkbox" value="${detail.opNumber }" name="content2"/></td>
                        <td><input type="text" name="DetailVO[${status.index }].OPNumber" value="${detail.opNumber }" readonly /></td>
                        <td><input type="text" name="DetailVO[${status.index }].materialUseStatus" value="${detail.materialUseStatus }" readonly /></td>
                        <td><input type="text" name="DetailVO[${status.index }].houseCode" value="${detail.houseCode}"/></td>
                        <td><input type="date" name="DetailVO[${status.index }].performanceDate" value="${detail.performanceDate }" /></td>
                        <td><input type="text" name="DetailVO[${status.index }].sortation" value="${detail.sortation}"/></td>
                        <td><input type="text" name="DetailVO[${status.index }].performanceQuantity" value="${detail.performanceQuantity}"/></td>
                        <td><input type="text" name="DetailVO[${status.index }].inspection" value="${detail.inspection}"/></td>                      
                        <td><input type="text" name="DetailVO[${status.index }].note" value="${detail.note}"/></td>
                        <td><input type="text" name="DetailVO[${status.index }].workOrderNumber" value="${param.searchNumber}" /></td>
  					 </tr>
                    </c:forEach>
                    <tr>
                        <td><input type="checkbox" value = "check" id="check" name="content2"/></td>
                        <td><input type="text" id="opNumber" name="DetailVO[${fn:length(detailList)}].opNumber" value="${param.opNumber }" readonly /></td>
                        <td><input type="text" id="materialUseStatus" name="DetailVO[${fn:length(detailList)}].materialUseStatus" value="${param.materialUseStatus }" readonly /></td>
                        <td><input type="text" id="houseCode" name="DetailVO[${fn:length(detailList)}].houseCode" ondblclick="houseCodeSearch()" value="${param.houseCode }" /></td>
                        <td><input type="date" id="performanceDate" name="DetailVO[${fn:length(detailList)}].performanceDate" value="${param.performanceDate }"/></td>
                        <td><input type="text" id="sortation" name="DetailVO[${fn:length(detailList)}].sortation" value="${param.sortation }"/></td>
                        <td><input type="text" id="performanceQuantity" name="DetailVO[${fn:length(detailList)}].performanceQuantity" value="${param.performanceQuantity }"/></td>
                        <td><input type="text" id="inspection" name="DetailVO[${fn:length(detailList)}].inspection" value="${param.inspection }"/></td>
                        <td><input type="text" id="note" name="DetailVO[${fn:length(detailList)}].note" value="${param.note }"/></td>
                        <td><input type="text" id="workOrderNumber" name="DetailVO[${fn:length(detailList)}].workOrderNumber" value="${param.searchNumber }"/></td>
                    </tr>
                    </tbody>
                </table>
                </form>
            </div>
            <!-- �����̳� ��� ���� -->
            
        </container3>
      
</body>
</html>

<script>
var sortation = document.getElementById("sortation").value;
var inspection = document.getElementById("inspection").value;
var note = document.getElementById("note").value;
var performanceDate = document.getElementById("performanceDate").value;


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
      
  		  $('#performanceDate').change(function (){
              var date = $('#performanceDate').val();
              performanceDate = date;
          });
      /* ���� ��ư ��� ���� */
      
        function newRow(){//��� ����
          // dao���� ����
    	 
        	var row = workOrderTable.insertRow(); 
          	const URLSearch = new URLSearchParams(location.search);
		 	const newParam = URLSearch.toString();
			var link = location.pathname +'?'+newParam;
  			var linkPath = document.createElement("input");
  		    linkPath.setAttribute("type","hidden");
  		    linkPath.setAttribute("name","path");
  		    linkPath.setAttribute("value", link);
  		  var performanceQuantity = document.getElementById("performanceQuantity").value;
  		if(URLSearch.has('searchNumber')===true){
   		   if (isEmpty(performanceDate)){
		      		alert("��¥���� ������ֽ��ϴ�. ���� �߰����ּ���!");
		      		document.getElementById("performanceDate").focus();
	
	  	  }
   		   else if(isEmpty(performanceQuantity)){
		      		alert("�������� ������ֽ��ϴ�. ���� �߰����ּ���!");		            	
		      		document.getElementById("performanceQuantity").focus();
		   }else{
  		    document.getElementById('detailForm').appendChild(linkPath);
            document.getElementById('detailForm').action = "${contextPath}/member/addRegistOperationPerformanceInfoDetail.do";
  			document.getElementById('detailForm').submit();    
	  		alert("���� ����Ǿ����ϴ�!");          	
		    }
  		}else{
  			alert("�۾����ù�ȣ�� üũ���� �ʾ� ���� ȭ������ ���ư��ϴ�! �۾����ù�ȣ�� üũ�� �� ���� ��ȸ�� �����ּ���!!");
  			window.history.back();
  		}
  		    
      }
      
        function updateRow() {
        	//var row = workOrderTable.insertRow(); 
        	//const URLSearch = new URLSearchParams(location.search);
        	//const newParam = URLSearch.toString();
  		 	//var link = location.pathname +'?'+newParam;
  		 	//document.getElementById("dueDate").disabled = true;
		    //document.getElementById("indicated").disabled = true;
		    //document.getElementById("instructionDate").disabled = true;
    		//var linkPath = document.createElement("input");
    		//linkPath.setAttribute("type","hidden");
    		//linkPath.setAttribute("name","path");
    		//linkPath.setAttribute("value", link);
  		    //document.getElementById('dataForm').appendChild(linkPath);
            //document.getElementById('dataForm').action = "${contextPath}/member/updateOperationInstruction.do";
    		//document.getElementById('dataForm').submit();  
    		alert("Ȯ��, ������ ���´� ������ �� �����ϴ�!");
        }
        
      
        function deleteData() {
    		alert('������������ ���� "��"�϶��� ������ �����մϴ�!');
      	  var item = document.getElementsByName("content2").length;
      	  var no = "";
      	  var ary = [];
      	  for(var i=0; i<item;i++){
      		  if(document.getElementsByName("content2")[i].checked==true){
      			  no = document.getElementsByName("content2")[i].value;
      			  ary.push(no);
      		  }
      	  }
      	  
      	if(ary.length === 0 || ary === null){ //üũ�ڽ��� �ƹ��͵� üũ���� �ʾ�����
			alert('üũ�ڽ��� �������� �ʾҰų� ������ �� ���� ���Դϴ�!');
			window.location.href = "${contextPath}/member/regoperperf.do";
		}
    	else {//��Ʈ�ѷ��� �ش����� no���� ������
    		//alert('���� �Ǿ����ϴ�!');
		  window.location.href = "${contextPath}/member/deleteRegistOperationPerformanceInfoDetail.do?opNumber="+ary;

    	}
        }
        
        
        
        function materialUse() {
        	var item = document.getElementsByName("content2").length;
        	  var no = "";
        	  var ary = [];
        	  for(var i=0; i<item;i++){
        		  if(document.getElementsByName("content2")[i].checked==true){
        			  no = document.getElementsByName("content2")[i].value;
        			  ary.push(no);
        		  	}
        		  }
        	  if(ary.length === 0 || ary === null){ //üũ�ڽ��� �ƹ��͵� üũ���� �ʾ�����
      			alert('üũ�ڽ��� �������� �ʾҽ��ϴ�!');
      			window.location.href = "${contextPath}/member/regoperperf.do";
	      		}
	          	else {//��Ʈ�ѷ��� �ش����� no���� ������
	          		alert('�������� �Ϸ�Ǿ����ϴ�!');
        		window.location.href = "${contextPath}/member/materialUse.do?opNumber="+ary;
	
	          	}

        
        }
        
        
        
        function setChildHouseCodeValue(name){
        	  
        	  const URLSearch = new URLSearchParams(location.search);  		  
    		  const newParam = URLSearch.toString();
            if(URLSearch.get('houseCode') == null){
    		window.location.href = location.pathname +'?'+newParam + '&houseCode=' + name;
            }
            else{
            	URLSearch.set('houseCode', name);
            	const newParam = URLSearch.toString();
            	window.location.href = location.pathname +'?'+newParam;
            }
            
        }
	/*  �˾� ��ȸ��*/
  
 	function houseCodeSearch(){
 			openWindowPop('http://localhost:8090/webERP/member/houseCodeSearchPop.do','houseCodeSearch');
		}
	
 	
      </script>