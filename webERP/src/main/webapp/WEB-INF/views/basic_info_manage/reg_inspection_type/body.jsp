<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
	request.setCharacterEncoding("UTF-8");
%>
<c:forEach var="ins" items="${insins}" >     
 	<c:set var="inspection_Code" value="${ins.inspection_Code }"/>
 	<c:set var="inspection_Name" value="${ins.inspection_Name }"/>
 	<c:set var="inspection_Question" value="${ins.inspection_Question }"/>
 	<c:set var="remarks" value="${ins.remarks }"/>
</c:forEach>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�˻��������</title>
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
        }
        #contents2{
            position: absolute;
            right: 0;
            top: 15%;
            width: 85%;
            height: 35%;
            border: 1px solid black;
            z-index: 1;
        }
        #contents3{
            position: absolute;
            right: 0;
            top:50%;
            width: 85%;
            height: 45%;
            border: 1px solid black;
            z-index: 1;
        }
        #con1_search {
            width: 30%;
            padding-top: 10px;
            left: 5%;
        }
        #table1 input {
        	width:90%;
        }
        .input2 {
        	width:90%;
        }
        #view1 {
        	width:100%;
        }
        #view2 {
        	width:100%;
        }
        #view2 input {
        	width:100%;
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
        <container2 id="contents2">
            <table id="view1">
                <thead>
                    <td></td>
                    <td align="center">�˻��ڵ�</td>
                    <td align="center">�˻�������</td>
                    <td align="center">���</td>
                </thead>
                <tbody id="table1" align="center">
                <c:forEach var="ins" items="${insView}" >
	                
	                <tr class="repeatedRow">
	                    <td style="width:3%;">
	                    	<input type="checkbox" name="checkedContent" value="${ins.inspection_Code}"/>
	                    </td>                   
	                    <td>
	                        <input type="text" name="codeList" onfocus = "searchView(this.value)" value="${ins.inspection_Code}" style="background-color:#eee; cursor:pointer;" readonly/>
	                    </td>     
	                    <td>
	                        <input type="text" value="${ins.inspection_Name}" readonly/>
	                    </td>                    
	                    <td>
	                        <input type="text" value="${ins.remarks}" readonly/>
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
        <form method="get" id="reg_inspection_type">
            <table id="view2">
                <thead>
                    <td align="center">�˻��ڵ�</td>
                    <td align="center">�˻�������</td>
                    <td align="center">�˻���������</td>
                    <td align="center">���</td>
                </thead>
                <tbody id="table2" align="center">
                    <td align="center"><input type="text" name="inspection_Code" id="inspection_Code" value="${inspection_Code }" style="background-color: rgb(255, 255, 149);" maxlength="12"/></td>
                    <td align="center"><input type="text" name="inspection_Name" id="inspection_Name" value="${inspection_Name }" style="background-color: rgb(255, 255, 149);" maxlength="30"/></td>
                    <td align="center"><input type="text" name="inspection_Question" id="inspection_Question" value="${inspection_Question }" style="background-color: rgb(235,235,235); border-style: none;" maxlength="200"/></td>
                    <td align="center"><input type="text" name="remarks" id="remarks" value="${remarks }" style="background-color: rgb(235,235,235); border-style: none;" maxlength="200"/></td>
                </tbody>
            </table>
        </form>
        </container3>
        <script>
	        var inspection_Code = document.getElementById("inspection_Code");
	        var inspection_Name = document.getElementById("inspection_Name");
	        var codeList = document.getElementsByName("codeList");
	        
	        function searchView(name) { //��ȸ�� ����ϴ� �ڹٽ�ũ��Ʈ��
	            window.location.href = "${contextPath}/member/reginspection.do?submit=1&&com_code=" + name; 
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
	    			window.location.href = "${contextPath}/member/reginspection.do";
	    		}
	        	else {//��Ʈ�ѷ��� �ش����� no���� ������
	        		alert('���� �Ǿ����ϴ�');
	    			window.location.href = "${contextPath}/member/deleteInspection.do?no="+ary;
	        	}
	        }
	        
	        function newRow(){//�ִٰ� ������
	        	var checker = false;
	        	
	        	for(var i=0; i<codeList.length; i++){
	        		if(codeList[i].value==inspection_Code.value){
	        			checker = true;
	        		}
	        	}
	        	
	        	if(inspection_Code == "" || inspection_Name == ""){
	        		alert('�ʼ� �Է��׸��� ����ֽ��ϴ�. ��� �Է����ּ���.');
	        	}else if(checker) {
	        		alert('�̹� �����ϴ� �˻��ڵ��Դϴ�');
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
	    		document.getElementById('reg_inspection_type').appendChild(articleNOInput);
	    		document.getElementById('reg_inspection_type').action = "${contextPath}/member/addInspection.do";
	    		document.getElementById('reg_inspection_type').submit();
	    	}
	        }
	        
	        function updateRow() {  //����� ������ ������ ��Ʈ�ѷ��� �ѱ�� �Լ�
	        	if(inspection_Code.value == "" || inspection_Name.value == ""){
		    		alert('�ʼ� �Է��׸��� ����ֽ��ϴ�. ��� �Է����ּ���.');
	    		}
	        	else{
		        	document.getElementById('reg_inspection_type').action = "${contextPath}/member/updateInspection.do";
		    		document.getElementById('reg_inspection_type').submit(); //���±�*�� ��ϵ��� ��Ʈ�ѷ��� ������
		    		alert('�����Ǿ����ϴ�'); 
	        	}      	
	        }
        </script>
</body>
</html>