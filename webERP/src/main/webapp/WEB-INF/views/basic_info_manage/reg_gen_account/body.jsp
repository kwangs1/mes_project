<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>
<c:forEach var="com" items="${comcom}" >     
 	<c:set var="general_Customer_Code" value="${com.general_Customer_Code }"/>
 	<c:set var="general_Customer_Name" value="${com.general_Customer_Name }"/>
 	<c:set var="general_Customer_Division" value="${com.general_Customer_Division }"/>
 	<c:set var="company_Registration_Number" value="${com.company_Registration_Number }"/>
 	<c:set var="resident_Registration_Number" value="${com.resident_Registration_Number }"/>
 	<c:set var="representativs_Name" value="${com.representativs_Name }"/>>
 	<c:set var="upstate" value="${com.upstate }"/>
 	<c:set var="industry" value="${com.industry }"/>
 	<c:set var="zipCode" value="${com.zipCode }"/>
 	<c:set var="workplace_Address" value="${com.workplace_Address }"/>
 	<c:set var="generalCustomer_Tel" value="${com.generalCustomer_Tel }"/>
 	<c:set var="wholesale_Retail_Business_Code" value="${com.wholesale_Retail_Business_Code }"/>
</c:forEach>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Ϲݰŷ�ó���</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> <!-- �����������������CDN -->
<style>
 		#contents1{
            position: absolute;
            left: 15%;
            top: 15%;
            width: 85%;
            height: 10%;
            border: 1px solid #ccc;
            z-index: 1;
        }
        #contents2{
            position: absolute;
            left: 15%;
            top: 25%;
            width: 35%;
            height: 70%;
            border: 1px solid #ccc;
            z-index: 1;
        }
        #contents3{
            position: absolute;
            left: 50%;
            top: 25%;
            width: 50%;
            height: 70%;
            z-index: 1;
            border: 1px solid #cc;
        }
        .con1_search {
            margin: 10px;   
        }
       
        
        #contents1 td {
            text-align: right;
            letter-spacing: 1px;
            padding: 1px;
        }
        #contents2 td {
            border-collapse: collapse;
            padding: 3px;
        }
        #contents3 td {
            border-collapse: collapse;
            padding: 3px;
        }

        
        #contents2, #contents3 td{
            border-collapse: collapse;    
        }
        
        #contents1 input[type="text"] {
            text-align: center;
        }
        
        #contents2 input[type="text"] {
            text-align: center;
            width: 100%;
        }
        #contents3 input {
            text-align: center;
        }        
        
        #table1 {
        	margin-top:30px;
        	margin-right:5px;
            width: 80%;

        }
        #table2 {
            width: 100%;
            text-align: center;
        }
        #table3 {
            width: 100%; 
        }
        
        #reqInput {
            background-color: rgb(255, 255, 149);
            text-align: center;
        }
	 	#table1 {
            text-align: center; 
			overflow: hidden;
        }
        #table2 {
            width: 100%;  text-align: left;
            border-collapse: separate; border-spacing: 0 15px;
        }
        #reqInput {
           	background-color: rgb(255, 255, 149);
            text-align: center;
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
	            <table id="table1" align="center">
	                <tr align="center">
	                    <td align="center" style="width:80px;">�ŷ�ó�ڵ�</td>
	                    <td style="width:50px;">
	                        <input type=text name="customerCode" id="customerCode" style="width:100%;" value="${param.itemNumber }" pattern="[0-9]{4}" maxlength="12"/>
	                    </td>
	     				<td style="width:8px;">
	     					<div style="text-align:center; width:100%;" id=searchCodeButton><a href="javascript:searchCode()"><i class="fas fa-search" style="color :blue;"></i></a></div>
	     				</td>
	                    <td style="width:80px; text-align:left;">
	                    	<input type=text name="ckcustomerCode" id="ckcustomerCode" value="${param.itemName }" style="width:100%;" disabled/>	                    
	                    </td>	
	                </tr>
	            </table>
	        </form>
        </container1>
        
        <container2 id= contents2>
            <table id="table2" align="center">
                <thead>
                    <td></td>
                    <td align="center">�ڵ�</td>
                    <td align="center">�ŷ�ó��</td>
                    <td align="center">����ڵ�Ϲ�ȣ</td>
                </thead>
                    
                <tbody>
                <c:forEach var="com" items="${comView}" >
	                
	                <tr class="repeatedRow">
	                    <td>
	                    	<input type="checkbox" name="checkedContent" value="${com.general_Customer_Code}"/>
	                    </td>                   
	                    <td>
	                        <input type="text" name="codeList" onfocus = "searchView(this.value)" value="${com.general_Customer_Code}" style="background-color:#eee; cursor:pointer;" readonly/>
	                    </td>     
	                    <td>
	                        <input type="text" name="nameList" value="${com.general_Customer_Name}" readonly/>
	                    </td>                    
	                    <td>
	                    	<input type="text" name="numberList" value="${com.company_Registration_Number }" readonly/>
	                    </td>
	                </tr>
	               
                </c:forEach>
                <tr>
                    <td colspan="5">
                        <button onclick="searchView(this.value)"
                        style="background-color: rgb(235, 235, 235); 
                        border-style: none; 
                        text-align: center; width:99%; cursor:pointer;">�űԵ��</button>
                    </td>
                </tr>
                </tbody>
                
            </table>
        </container2>
        <container3 id="contents3">
        <form  method="get" id="reg_gen_account"> <!-- ****���±�**** -->
            <table id="table3" align="center" style="margin-top:10px;">
                <tr>
                    <p><td colspan = "4" style="color:black;" align="center">�⺻��ϻ���</td></p>
                </tr>
                <tr>
                    <td align="center">�ڵ�</td>
                    <td colspan="3">
                        <input type="text" name="general_Customer_Code" id="general_Customer_Code" value="${general_Customer_Code }"
                        	style="background-color: rgb(255, 255, 149);" maxlength="12">
                    </td>
                </tr>
                <tr>
                    <td align="center">�ŷ�ó��</td>
                    <td colspan="3">
                        <input type="text" name="general_Customer_Name" id="general_Customer_Name" style="background-color: rgb(255, 255, 149);" value="${general_Customer_Name }" maxlength="50">
                    </td>
                </tr>
                <tr>
                    <td align="center">����</td>
                    <td colspan="3">
                        <input type="text" name="general_Customer_Division" id="general_Customer_Division" style="background-color: rgb(255, 255, 149);" value="${general_Customer_Division }" maxlength="10">
                    </td>
                </tr>
                <tr>
                    <td align="center">����ڵ�Ϲ�ȣ</td>
                    <td colspan="3">
                        <input type="text" name="company_Registration_Number" id="company_Registration_Number" style="background-color: rgb(255, 255, 149);" value="${company_Registration_Number}"
                        pattern="[0-9]{10}" maxlength="13"/>
                    </td>
                </tr>
                <tr>
                    <td align="center">�ֹε�Ϲ�ȣ</td>
                    <td colspan="3">
                        <input type="text" name="resident_Registration_Number" id="resident_Registration_Number" pattern="[0-9]{13}" maxlength="15" style="background-color: rgb(235,235,235);
                            border-style: none;" value="${resident_Registration_Number}" maxlength="15"/>
                    </td>
                </tr>
                <tr>
                    <td align="center">��ǥ�ڼ���</td>
                    <td colspan="3">
                        <input type="text" name="representativs_Name" id="representativs_Name" style="background-color: rgb(255, 255, 149);" value="${representativs_Name }" maxlength="50">
                    </td>
                </tr>
                <tr>
                    <td align="center">����</td>
                    <td colspan="3">
                        <input type="text" name="upstate" id="upstate" style="background-color: rgb(255, 255, 149);" value="${upstate }" maxlength="20">
                    </td>
                </tr>
                <tr>
                    <td align="center">����</td>
                    <td colspan="3">
                        <input type="text" name="industry" id="industry" style="background-color: rgb(255, 255, 149);" value="${industry }" maxlength="20">
                    </td>
                </tr>
                <tr>
                    <td align="center">�����ȣ</td>
                    <td>
                        <input type="text" name="zipCode" id="zipCode" pattern="[0-9]{5}" maxlength="12" value="${zipCode }"
                        style="width:150px; background-color: rgb(255, 255, 149);" readonly/>
                        <a href="javascript:searchZip()"><i class="fas fa-search" style="color :blue;"></i></a>
                    </td>
                </tr>
                <tr>
                    <td align="center">������ּ�</td>
                    <td colspan="3">
                        <input type="text" name="workplace_Address" id="workplace_Address" value="${workplace_Address }" 
                        	style="background-color: rgb(255, 255, 149);" maxlength="60" readonly>
                    </td>
                </tr>
                <tr>
                    <td align="center">��ȭ��ȣ</td>
                    <td colspan="3">
                        <input type="text" name="generalCustomer_Tel" id="generalCustomer_Tel" pattern="[0-9]{10}" maxlength="13" style="background-color: rgb(235,235,235);
                            border-style: none;" value="${generalCustomer_Tel }"/>
                    </td>
                </tr>
                <tr>
                    <td align="center">�ַ��ڵ�</td>
                    <td>
                        <input type="text" name="wholesale_Retail_Business_Code" id="wholesale_Retail_Business_Code" style="background-color: rgb(235,235,235);
                            border-style: none;" value="${wholesale_Retail_Business_Code }" maxlength="12">
                    </td>
                </tr>
            </table>
        </form>
        </container3>
        <script>
        
        var general_Customer_Code = document.getElementById("general_Customer_Code");
        var general_Customer_Name = document.getElementById("general_Customer_Name");
        var general_Customer_Division = document.getElementById("general_Customer_Division");
        var company_Registration_Number = document.getElementById("company_Registration_Number");
        var representativs_Name = document.getElementById("representativs_Name");
        var upstate = document.getElementById("upstate");
        var industry = document.getElementById("industry");
        var zipCode = document.getElementById("zipCode");
        var workplace_Address = document.getElementById("workplace_Address");
        
        function searchView(name) { //��ȸ�� ����ϴ� �ڹٽ�ũ��Ʈ��
            window.location.href = "${contextPath}/member/regbasicacc.do?submit=1&&com_code=" + name; 
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
        	var item = document.getElementsByName("checkedContent").length;
        	var no = "";
        	var ary = [];
        	
        	for(var i=0; i<item; i++) { //üũ�� üũ�ڽ����� no���� �ݺ����� ���Ͽ� �迭�θ����
        		if(document.getElementsByName("checkedContent")[i].checked==true) {
        			no = document.getElementsByName("checkedContent")[i].value;
        			ary.push(no);
        		}       		
        	}
        	if(ary.length === 0 || ary === null){ //üũ�ڽ��� �ƹ��͵� üũ���� �ʾ�����
    			alert('������ ����� üũ�ڽ��� �������ּ���');
    			window.location.href = "${contextPath}/member/regbasicacc.do";
    		}
        	else {//��Ʈ�ѷ��� �ش����� no���� ������
        		alert('���� �Ǿ����ϴ�');
    			window.location.href = "${contextPath}/member/deleteBasicacc.do?no="+ary;
        	}
        }
        
        function newRow(){
        	var checker1 = false;
        	var checker2 = false;
        	var checker3 = false;
        	
        	var codeList = document.getElementsByName("codeList");
        	var nameList = document.getElementsByName("nameList");
        	var numberList = document.getElementsByName("numberList");
        	
        	for(var i=0; i<codeList.length; i++){
        		if(codeList[i].value==general_Customer_Code.value){
        			checker1 = true;
        		}
        	}
        	for(var i=0; i<nameList.length; i++){
        		if(nameList[i].value==general_Customer_Name.value){
        			checker2 = true;
        		}
        	}
        	for(var i=0; i<numberList.length; i++){
        		if(numberList[i].value==company_Registration_Number.value){
        			checker3 = true;
        		}
        	}
        	
        	if(general_Customer_Code.value == "" || general_Customer_Name.value == "" || general_Customer_Division.value == "" || company_Registration_Number.value == "" || representativs_Name.value == "" || upstate.value == "" || industry.value == "" || zipCode.value == "" || workplace_Address.value == "" ){
        		alert('�ʼ� �Է��׸��� ����ֽ��ϴ�. ��� �Է����ּ���.')
        	}else if(checker1){
        		alert('�̹� �����ϴ� �ŷ�ó�ڵ��Դϴ�');
        	}else if(checker2){
        		alert('�̹� �����ϴ� �ŷ�ó���Դϴ�');
        	}else if(checker3){
        		alert('�̹� �����ϴ� ����ڵ�Ϲ�ȣ�Դϴ�');
        	}else {
			alert('��ϵǾ����ϴ�');        	
    		const URLSearch = new URLSearchParams(location.search);
    		URLSearch.set('submit','1');
    		const newParam = URLSearch.toString();
    		var link = location.pathname +'?'+newParam;
    		var articleNOInput = document.createElement("input");
    		articleNOInput.setAttribute("type","hidden");
    		articleNOInput.setAttribute("name","path");
    		articleNOInput.setAttribute("value", link);
    		document.getElementById('reg_gen_account').appendChild(articleNOInput);
    		document.getElementById('reg_gen_account').action = "${contextPath}/member/addbasicacc.do";
    		document.getElementById('reg_gen_account').submit();
    		}
        }
        function updateRow() {  //����� ������ ������ ��Ʈ�ѷ��� �ѱ�� �Լ�
        	if(general_Customer_Code.value == "" || general_Customer_Name.value == "" || general_Customer_Division.value == "" || company_Registration_Number.value == "" || representativs_Name.value == "" || upstate.value == "" || industry.value == "" || zipCode.value == "" || workplace_Address.value == "" )
    		{
    		alert('�ʼ� �Է��׸��� ����ֽ��ϴ�. ��� �Է����ּ���.')
    		}
        	else{
	        	document.getElementById('reg_gen_account').action = "${contextPath}/member/updateBasicacc.do";
	    		document.getElementById('reg_gen_account').submit(); //���±�*�� ��ϵ��� ��Ʈ�ѷ��� ������
	    		alert('�����Ǿ����ϴ�'); 
        	}      	
        } 
         
        function searchCode() { //�������ư�� Ŭ���ϸ� ��Ʈ�ѷ��� �˾��� ���� ������ ȣ����       	
        	openWindowPop("${contextPath}/member/regbasicaccPopup.do", "regbasicaccPopup");
        }
        
        function searchZip() { //�����ȣ �˻� �˾��� ���� �Լ�
        	openWindowPop("${contextPath}/member/regbasicaccZipPopup.do", "regbasicaccZipPopup");
        } 
               
       
  
		</script>
        
</body>
</html>