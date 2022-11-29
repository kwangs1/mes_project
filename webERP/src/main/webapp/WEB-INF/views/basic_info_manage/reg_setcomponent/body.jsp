<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>
<c:forEach var="set" items="${setset}" >     
 	<c:set var="set_Code" value="${set.set_Code }"/>
 	<c:set var="set_Name" value="${set.set_Name }"/>
 	<c:set var="set_Standard" value="${set.set_Standard }"/>
 	<c:set var="set_Unit" value="${set.set_Unit }"/>
</c:forEach>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>SET����ǰ���</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> <!-- �����������������CDN -->
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
            border-bottom:none;
        }
        #contents2{
            position: absolute;
            right: 0;
            top: 25%;
            width: 85%;
            height: 35%;
            border: 1px solid black;
            z-index: 1;
            overflow:auto;
        }
        #contents3{
            position: absolute;
            right: 0;
            top:60%;
            width: 85%;
            height: 35%;
            border: 1px solid black;
            border-top: 1px solid white;
            z-index: 1;
            overflow:auto;
        }
        #view{
            width: 100%;
            text-align: center;
        }
        #view2{
            width: 100%;
            text-align: center;
        }

        #view td input:not(#check){
            width: 100%;
        }
        #view2 td input:not(#check){
            width: 100%;
        }
        
        .con1_search{
            padding:0;
            text-align: center;
            position: absolute;
            top: 25%;
            left: 30%;
        }
        .cck {
			width:5%;        
        }
        .cck2{
        	width:2%;
        }
        
		#subView1{
            width: 100%;
            text-align: center;
        }
        #subView1 td input:not(#check){
            width: 100%;
        }
        #subView2{
            width: 100%;
            text-align: center;
        }
        #subView2 td input:not(#check){
            width: 100%;
        }
</style>
<script>
   window.onload = function(){
	   l_sub2.style.display = "block";
	   l_sub2.style.position = "relative";
	   l_sub2.style.marginLeft = "10px";
   }
</script>
</head>
<body>
		<container1 id = contents1>
		<form method="get" id="searchForm">
            <table class="con1_search">
                <tr>
                    <td>��Ʈǰ</td>
                    <td>
                        <input type="text" name="setSearchBox1" id="setSearchBox1" readonly>
                        <a href="javascript:viewPopupSet()"><i class="fas fa-search" style="color: blue;"></i></a>
                    </td>
                    <td><input type="text" name="setSearchBox2" id="setSearchBox2" disabled></td>
                </tr>
                <tr>
                    <td>����ǰ</td>
                    <td>
                        <input type="text" name="specSearchBox1" id="specSearchBox1" readonly>
                        <a href="javascript:viewPopupSpec()"><i class="fas fa-search" style="color: blue;"></i></a>
                    </td>
                    <td><input type="text" name="specSearchBox2" id="specSearchBox2" disabled></td>
                </tr>
            </table>
        </form>
        
        </container1>
        <container2 id="contents2">
        <form  method="get" id="reg_setcom1">
           <table id="view">
                <thead>
                    <td colspan="5">��Ʈǰ ���</td>
                </thead>
                <thead style="font-weight: bold;">
                    <td class="cck"></td>
                    <td>ǰ��</td>
                    <td>ǰ��</td>
                    <td>�԰�</td>
                    <td>����(����)</td>
                </thead>
                <c:forEach var="set" items="${setView}" >
	                <tbody>
	                    <td class="cck"><input type="checkbox" name="topBox" value = "${set.set_Code }"/></td>
	                    <td><input type="text" id="set_Code" name="set_Code" value="${set.set_Code }" onfocus="searchView(this.value)" style="background-color: rgb(255, 255, 149); cursor:pointer;" maxlength="9"></td>
	                    <td><input type="text" id="set_Name" name="set_Name" value="${set.set_Name }" style="background-color: rgb(255, 255, 149);" maxlength="40"></td>
	                    <td><input type="text" id="set_Standard" name="set_Standard" value="${set.set_Standard }" style="background-color: rgb(235,235,235); border-style: none;" maxlength="15"></td>
	                    <td><input type="text" id="set_Unit" name="set_Unit" value="${set.set_Unit }" style="background-color: rgb(235,235,235); border-style: none;" maxlength="3"></td>
	                </tbody>
                </c:forEach>
           </table>
         </form>
         
         <form method="get" id="reg_setcom1_1">	
           <table id="subView1">
           </table>
         </form>
         
         <input type='button' onclick="addNewData1()" id="addRow1" value="�űԵ��"
         style="background-color: rgb(235, 235, 235); 
         border-style: none; 
         text-align: center; width:100%; cursor:pointer;"/>
         
         <input type='button' onclick="doAdd1()" id="addAction1" value="����ϱ�"
         style="background-color: rgb(235, 235, 235); 
         border-style: none; 
         text-align: center; width:100%; display:none; cursor:pointer;"/>
        
        </container2>
        <container3 id="contents3">
        <form  method="get" id="reg_setcom2">
            <table id="view2">
                <thead>
                    <td colspan="12">����ǰ ���</td>
                </thead>
                <thead style="font-weight: bold;" id="prTitle">
                <tr>
                    <td style="width:5%;"></td>
                    <td style="width:15%;">��Ʈǰ�ڵ�</td>
                    <td style="width:15%;">����ǰ�ڵ�</td>
                    <td>ǰ��</td>
                    <td>����</td>
                    <td>����</td>
                    <td>�԰�</td>
                </tr>
                </thead>
                <c:forEach var="compo" items="${compoView}" >
                <tbody>
                    <td style="width:5%;"><input type="checkbox" value = "${compo.components_Code }" name="bottomBox"/></td>
                    <td><input type="text" name="set_Code" id="set_Code2" value = "${compo.set_Code }" style="background-color: rgb(255, 255, 149);" readonly></td>
                    <td><input type="text" name="components_Code" id="components_Code" value = "${compo.components_Code }" style="background-color: rgb(255, 255, 149); cursor:pointer" onclick="searchCompoItem()" readonly></td>
                    <td><input type="text" name="components_Name" id="components_Name" value = "${compo.components_Name }" style="background-color: rgb(255, 255, 149); cursor:pointer" onclick="searchCompoItem()" readonly></td>
                    <td><input type="text" name="components_Standard" id="components_Standard" value = "${compo.components_Standard }" style="background-color: rgb(235,235,235); border-style: none;"></td>
                    <td><input type="text" name="components_Unit" id="components_Unit" value = "${compo.components_Unit }" style="background-color: rgb(235,235,235); border-style: none;"></td>
                    <td><input type="text" name="components_Stock" id="components_Stock" value = "${compo.components_Stock }" style="background-color: rgb(235,235,235); border-style: none;"></td>
                </tbody>
                </c:forEach>
            </table>
        </form>    
        <form method="get" id="reg_setcom2_1">	
	        <table id="subView2" style="width:100%">
	        </table>
        </form>
            
        <input type='button' onClick="addNewData2()"  id="addRow2" value="�űԵ��"
        style="background-color: rgb(235, 235, 235); 
        border-style: none;  display: none;
        text-align: center; width:100%; cursor:pointer;"/>
        
        <input type='button' onclick="doAdd2()" id="addAction2" value="����ϱ�"
        style="background-color: rgb(235, 235, 235); 
        border-style: none; 
        text-align: center; width:100%; display:none; cursor:pointer;"/>
            
        </container3>
        <script>
        var set_Code = document.getElementById("set_Code");
        var set_Name = document.getElementById("set_Name");
        var set_Standard = document.getElementById("set_Standard");
        var set_Unit = document.getElementById("set_Unit");
        var components_Code = document.getElementById("components_Code");
        var components_Name = document.getElementById("components_Name");
        var components_Standard = document.getElementById("components_Standard");
        var components_Unit = document.getElementById("components_Unit");
        var components_Stock = document.getElementById("components_Stock");        
        var addRow1 = document.getElementById("addRow1");
        var addRow2 = document.getElementById("addRow2");
        var addAction1 = document.getElementById("addAction1");
        var addAction2 = document.getElementById("addAction2");
        var curl = window.location.href;
        const URLSearch = new URLSearchParams(location.search);
 		
        function addNewData1() {
        	const table = document.getElementById('subView1');
        	const newRow = table.insertRow();
        	const newCell1 = newRow.insertCell(0);
        	const newCell2 = newRow.insertCell(1);
        	const newCell3 = newRow.insertCell(2);
        	const newCell4 = newRow.insertCell(3);
        	const newCell5 = newRow.insertCell(4);
        	
        	newCell1.outerHTML = '<td style="width:5%"></td>';
        	newCell2.outerHTML = '<td><input type="text" id="subSet_Code" name="subSet_Code" style="background-color: rgb(255, 255, 149);" maxlength="12"></td>';
        	newCell3.outerHTML = '<td><input type="text" id="subSet_Name" name="subSet_Name" style="background-color: rgb(255, 255, 149);" maxlength="50"></td>';
        	newCell4.outerHTML = '<td><input type="text" id="subSet_Standard" name="subSet_Standard" style="background-color: rgb(235,235,235); border-style: none;" maxlength="20"></td>';
        	newCell5.outerHTML = '<td><input type="text" id="subSet_Unit" name="subSet_Unit" style="background-color: rgb(235,235,235); border-style: none;" maxlength="5"></td>';
        	
        	if ( $('#addAction2').css('display') === 'block' ) {
        		$('#addAction2').hide();
        		$('#subView2').hide(); 
        	}
        	
        	addRow1.style.display = "none";
        	addAction1.style.display = "block";
        	
        }
        
        function addNewData2() {
        	const table = document.getElementById('subView2');
        	const newRow = table.insertRow();
        	const newCell1 = newRow.insertCell(0);
        	const newCell2 = newRow.insertCell(1);
        	const newCell3 = newRow.insertCell(2);
        	const newCell4 = newRow.insertCell(3);
        	const newCell5 = newRow.insertCell(4);
        	const newCell6 = newRow.insertCell(5);
        	const newCell7 = newRow.insertCell(6);
        	
        	var temp = URLSearch.get('com_code');
        	newCell1.outerHTML = '<td style="width:5%"></td>';
        	newCell2.outerHTML = '<td style="width:15%"><input type="text" name="set_Code" id="subSet_Code2" value="" style="background-color: rgb(255, 255, 149);" readonly></td>';
        	newCell3.outerHTML = '<td style="width:15%"><input type="text" name="subComponents_Code" id="subComponents_Code" style="background-color: rgb(255, 255, 149); cursor:pointer;" onclick="searchCompoItem()" readonly ></td>';
        	newCell4.outerHTML = '<td><input type="text" name="subComponents_Name" id="subComponents_Name" style="background-color: rgb(255, 255, 149); cursor:pointer;" onclick="searchCompoItem()" readonly></td>';
        	newCell5.outerHTML = '<td><input type="text" name="subComponents_Standard" id="subComponents_Standard" style="background-color: rgb(235,235,235); border-style: none;"></td>';
        	newCell6.outerHTML = '<td><input type="text" name="subComponents_Unit" id="subComponents_Unit" style="background-color: rgb(235,235,235); border-style: none;"></td>';
        	newCell7.outerHTML = '<td><input type="text" name="subComponents_Stock" id="subComponents_Stock" style="background-color: rgb(235,235,235); border-style: none;"></td>';
        	
        	$('#subSet_Code2').attr('value', temp);
        	
        	if ( $('#addAction1').css('display') === 'block' ) {
        		$('#addAction1').hide();
        		$('#subView1').hide(); 
        	}
       		addRow2.style.display = "none";
           	addAction2.style.display = "block";
        	
        }
        
        function doAdd1() {
        	var subSet_Code = document.getElementById("subSet_Code");
            var subSet_Name = document.getElementById("subSet_Name");
			var setCode = document.getElementsByName("set_Code");            
			var setName = document.getElementsByName("set_Name");            
            var firstChecker = false;
            var secondChecker = false;
			
			
            for(var i=0; i<setCode.length; i++){
        		if(setCode[i].value==subSet_Code.value){
        			firstChecker = true;
        		}
        	}
            for(var i=0; i<setName.length; i++){
        		if(setName[i].value==subSet_Name.value){
        			secondChecker = true;
        		}
        	}
            
            
        	if(subSet_Code.value == "" || subSet_Name.value == ""){
        		alert('�ʼ� �Է��׸��� ����ֽ��ϴ�. ��� �Է����ּ���');
        	}else if(firstChecker) {
        		alert('�̹� �����ϴ� ǰ���Դϴ�');
        	}else if(secondChecker) {
        		alert('�̹� �����ϴ� ǰ���Դϴ�');
        	}
        	else { 
        		alert('��ϵǾ����ϴ�');
	        	document.getElementById('reg_setcom1_1').action = "${contextPath}/member/addSetComponents.do";
	    		document.getElementById('reg_setcom1_1').submit(); //���±�*�� ��ϵ��� ��Ʈ�ѷ��� ������ */
        	}
        }
        function doAdd2() {
        	var subSet_Code2 = document.getElementById("subSet_Code2");
        	var subComponents_Code = document.getElementById("subComponents_Code");
        	var subComponents_Name = document.getElementById("subComponents_Name");
        	
        	var compoNode = document.getElementsByName("components_Code");
			var checker = false;
        	
        	for(var i=0; i<compoNode.length; i++){
        		if(compoNode[i].value==subComponents_Code.value){
        			checker = true;
        		}
        	}
		        	
        	if(subSet_Code2.value == "" || subComponents_Code.value == "" || subComponents_Name.value == ""){
        		alert('�ʼ� �Է��׸��� ����ֽ��ϴ�. ��� �Է����ּ���');
        	}else if(checker) {
        		alert('�̹� �����ϴ� ����ǰ�ڵ��Դϴ�');
        	}
        	else {
        		alert('��ϵǾ����ϴ�');
            	document.getElementById('reg_setcom2_1').action = "${contextPath}/member/addSpecComponents.do";
        		document.getElementById('reg_setcom2_1').submit(); //���±�*�� ��ϵ��� ��Ʈ�ѷ��� ������ */
        	}
        }
        
        function searchView(name) { //��ȸ�� ����ϴ� �ڹٽ�ũ��Ʈ��
            location.href = "${contextPath}/member/regsetcom.do?&submit=1&&com_code=" + name;
   			addRow2.style.display='block';
        }
        
        if(curl.indexOf('submit=1')!=-1){
        	addRow2.style.display = 'block';
        }
        
        function searchData() {
        	var searchForm = $('#searchForm');
        	var is_empty = false; //���� is_empty�� ���ǹ��� �б⸦ ����
        	$('#searchForm').find('input[type!="hidden"]').each(function(){//���� ����ִ��� üũ�ϴ� ��������
        	    if(!$(this).val()) { //#reg_gen_account�� form�±��� id����
        	    	is_empty = true;      	    	
        	    }      	 
        	});       	 
        	if(is_empty) { //����ִ³����� �ִ��� üũ��
        	    alert('�˻������� ����ֽ��ϴ�');
        	}
        	else{	        	
	    		searchForm.submit();
        	} 
        }
        
        function deleteData() {//üũ�ڽ��� üũ�Ѱ��� ���� �迭�θ���� ��Ʈ�ѷ��� �Ѱ� �����ϴ� ����� �ϴ� �Լ�
        	var item = document.getElementsByName("topBox").length;
        	var item2 = document.getElementsByName("bottomBox").length;
        	var compoArray = document.getElementsByName("components_Code").length;
        	var temp = URLSearch.get('com_code');
        	var no = "";
        	var no2 = "";
        	var ary = [];
        	var ary2 = [];
        	
        	for(var i=0; i<item; i++) { //üũ�� üũ�ڽ����� no���� �ݺ����� ���Ͽ� �迭�θ����
        		if(document.getElementsByName("topBox")[i].checked==true) {
        			no = document.getElementsByName("topBox")[i].value;
        			ary.push(no);
        		}       		
        	}
        	for(var i=0; i<item2; i++) { //üũ�� üũ�ڽ����� no���� �ݺ����� ���Ͽ� �迭�θ����
        		if(document.getElementsByName("bottomBox")[i].checked==true) {
        			no2 = document.getElementsByName("bottomBox")[i].value;
        			ary2.push(no2);
        		}       		
        	}
        	if(ary.length === 0 && ary2.length === 0){ //üũ�ڽ��� �ƹ��͵� üũ���� �ʾ�����
    			alert('������ ����� üũ�ڽ��� �������ּ���');
    		}else if(ary.length > 0 && ary2.length > 0){ //üũ�ڽ��� �ƹ��͵� üũ���� �ʾ�����
    			alert('�ϳ��� ���Ǿȿ��� �������ּ���');
    		}else if(compoArray > 0 && ary.length > 0) {
    			alert('�ش��ϴ� ����ǰ�� ���� ������ �ּ���')
    		}
        	else {//��Ʈ�ѷ��� �ش����� no���� ������
        		alert('���� �Ǿ����ϴ�');
        		if(ary.length>0)
    				window.location.href = "${contextPath}/member/deleteSetComponents.do?no="+ary+"&&com_code="+temp;
    			if(ary2.length>0)	
    				window.location.href = "${contextPath}/member/deleteSpecComponents.do?no2="+ary2+"&&com_code="+temp;
        	}
        }
        
/*         function updateRow() {  //����� ������ ������ ��Ʈ�ѷ��� �ѱ�� �Լ�
        	if(general_Customer_Code.value == "" || general_Customer_Name.value == "" || general_Customer_Division.value == "" || company_Registration_Number.value == "" || representativs_Name.value == "" || upstate.value == "" || industry.value == "" || zipCode.value == "" || workplace_Address.value == "" )
    		{
    		alert('�ʼ� �Է��׸��� ����ֽ��ϴ�. ��� �Է����ּ���.')
    		}
        	else{
	        	document.getElementById('reg_gen_account').action = "${contextPath}/member/updateSetComponents.do";
	    		document.getElementById('reg_gen_account').submit(); //���±�*�� ��ϵ��� ��Ʈ�ѷ��� ������
	    		alert('�����Ǿ����ϴ�'); 
        	}      	
        }  */
        
        function viewPopupSet() {
        	openWindowPop("${contextPath}/member/viewPopupSet.do", "viewPopupSet");
        }
        
        function viewPopupSpec() {
        	openWindowPop("${contextPath}/member/viewPopupSpec.do", "viewPopupSpec");
        }
        
        function searchCompoItem() { //�������ư�� Ŭ���ϸ� ��Ʈ�ѷ��� �˾��� ���� ������ ȣ����       	
        	openWindowPop("${contextPath}/member/searchPopCompoItemName.do", "setComPopup");
        }
        
        </script>
</body>
</html>