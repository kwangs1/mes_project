<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"    
    isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>
<c:forEach var="item1" items="${comitem}" >     
 	<c:set var="item_Group_Code" value="${item1.item_Group_Code}"/>
 	<c:set var="item_Code" value="${item1.item_Code  }"/>
 	<c:set var="item_Name" value="${item1.item_Name }"/>
 	<c:set var="standard" value="${item1.standard }"/>
 	<c:set var="inventory_Unit" value="${item1.inventory_Unit }"/>
 	<c:set var="whether_LOT" value="${item1.whether_LOT }"/>
 	<c:set var="sET_Item" value="${item1.sET_Item }"/>
 	<c:set var="inspection_Status" value="${item1.inspection_Status }"/>
 	<c:set var="use_Status" value="${item1.use_Status }"/>
 	<c:set var="lOT_Quantity" value="${item1.lOT_Quantity }"/>
 	<c:set var="drawing_Number" value="${item1.drawing_Number}"/>
 	<c:set var="hs_Code" value="${item1.hs_Code }"/>
 	<c:set var="width" value="${item1.width }"/>
 	<c:set var="length" value="${item1.length }"/>
 	<c:set var="height" value="${item1.height }"/>
 	<c:set var="cost" value="${item1.cost }"/>
 	<c:set var="division" value="${item1.division }"/> 	
 	<c:set var="notes" value="${item1.notes }"/>
 	<c:set var="daily_production" value="${item1.daily_production }"/>

 </c:forEach>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
            width: 25%;
            height: 70%;
            border: 1px solid #ccc;
            z-index: 1;
        }
        #contents3{
            position: absolute;
            left: 40%;
            top: 25%;
            width: 60%;
            height: 70%;
            z-index: 1;
            border: 1px solid #ccc;
        }
        .con1_search {
            margin: 10px;   
        }
        
        
        #contents1 td {
            text-align: center;
            letter-spacing: 1px;
            padding: 1px;
            font-family: 'Hanna';
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
        #contents2, #contents3 {
            overflow: auto;   
        }
      
        #table1 {
            width: 70%;
            padding-top: 20px;
            padding-left: 30px;
        }
        #table2 {
            width: 91%;
            text-align: center;
        }
        #table3 {
            padding-left: 30px;
            padding-top: 15px;
            width: 100%; 
        }
        #bottom1 {
			position:fixed;
			bottom:0px;
        }
        
        .reqInput {
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
<form  method="get" id="regitem">
<container1 id = contents1>
            <table id="table1">
                <tr>
                    <td>ǰ��</td>
                    <td>
                        <input type=text name = "type_code" style="width:80px;" value="${param.itemgNumber}" />
                        <a href="javascript:searchitemg()"><i class="fas fa-search" style="color: blue;"></i></a>
                    </td>
                    <td>
                        <input type=text name = "type_name" value='${param.itemg_name}' />
                    </td>
                </tr>
               
            </table>
        </container1>
        <container2 id= contents2>
            <table id="table2">
                <thead>
                    <td><input type="checkbox" name="checkedContent" onclick="selectAll1(this)" id="focus1" /></td>
                    <td>ǰ��</td>
                    <td>ǰ��</td>
                    <td>�԰�</td>
                </thead>
                <c:set var="cnt" value="0" />
                <c:forEach var="item" items="${itemView}" > 
                <tbody>
                    <td><input type="checkbox" value='${item.item_Code }' id="chec-k" name="checkedContent"/></td>
                    <td>
                        <input type="text" value='${item.item_Code }' onfocus="searchView(this.value)">
                    </td>
                    <td>
                        <input type="text" value='${item.item_Name }'>
                    </td>
                    <td>
                        <input type="text" value='${item.standard }'>
                    </td>
                </tbody>
                <c:set var="cnt" value="${cnt +1}" />
                </c:forEach>
                <tr>
                    <td colspan="3">
                        <button onclick="searchView(this.value)"
                        style="background-color: rgb(235, 235, 235); 
                        border-style: none; 
                        text-align: center; width:150%">���ε��</button>
                    </td>
                </tr>
            </table>
            <div id=bottom1>
                <table>
                    <td>��ȸǰ���</td>
                    <td><input type="text" style="width: 50px;" value=<c:out value="${cnt }" /> />��</td>
                </table>
            </div>
        </container2>
        <container3 id="contents3">
            <table id="table3">
                <tr>
                    <td align="center">ǰ��</td>
                    <td>
                        <input type="text" name="item_Group_Code" id="item_Group_Code" style="background-color: rgb(235,235,235); border-style: none;" value="${item_Group_Code}" onclick="searchitemg()" maxlength="12" readonly>
                    </td>
                </tr>
                <tr>
                    <td align="center">ǰ��</td>
                    <td>
                        <input type="text" name="item_Code" id=item_Code class="reqInput" value='${item_Code }' maxlength="12">
                    </td>
                </tr>
                <tr>
                    <td align="center">ǰ��</td>
                    <td>
                        <input type="text" name="item_Name" id=item_Name class="reqInput" value='${item_Name }' maxlength="50">
                    </td>
                </tr>
                <tr>
                    <td align="center">�԰�</td>
                    <td>
                        <input type="text" name="standard" id=standard style="background-color: rgb(235,235,235); border-style: none;" value='${standard }' maxlength="20">
                    </td>
                </tr>
                <tr>
                    <td align="center">������</td>
                    <td>
                        <input type="text" name="inventory_Unit" id=inventory_Unit style="background-color: rgb(235,235,235); border-style: none;" value='${inventory_Unit }' maxlength="5">
                    </td>
                </tr>
                <tr>
                    <td align="center">LOT����</td>
                    <td>
                        <select name="whether_LOT" id="whether_LOT">
                            <option value=0 <c:if test="${whether_LOT == 0}">selected</c:if>>0.�̻��</option>
                            <option value=1 <c:if test="${whether_LOT == 1}">selected</c:if>>1.���</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td align="center">SETǰ��</td>
                    <td>
                        <select name="sET_Item" id="sET_Item">
                            <option value=0 <c:if test="${sET_Item == 0}">selected</c:if>>0.��</option>
                            <option value=1 <c:if test="${sET_Item == 1}">selected</c:if>>1.��</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td align="center">�˻翩��</td>
                    <td>
                        <select name="inspection_Status" id="inspection_Status">
                            <option value=0 <c:if test="${inspection_Status == 0}">selected</c:if>>0.���˻�</option>
                            <option value=1 <c:if test="${inspection_Status == 1}">selected</c:if>>1.�˻�</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td align="center">��뿩��</td>
                    <td>
                        <select name="use_Status" id="use_Status">
                            <option value=0 <c:if test="${use_Status == 0}">selected</c:if>>0.��</option>
                            <option value=1 <c:if test="${use_Status == 1}">selected</c:if>>1.��</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td align="center">LOT����</td>
                    <td>
                        <input type="text" name="lOT_Quantity" id="lOT_Quantity" style="background-color: rgb(235,235,235); border-style: none;" value='${lOT_Quantity }' maxlength="5">
                    </td>
                </tr>
                <tr>
                    <td align="center">�����ȣ</td>
                    <td>
                        <input type="text" name="drawing_Number" id="drawing_Number" style="background-color: rgb(235,235,235); border-style: none;" value='${drawing_Number }' maxlength="12">
                    </td>
                </tr>
                <tr>
                    <td align="center">HS CODE</td>
                    <td>
                        <input type="text" name="hs_Code" id="hs_Code" style="background-color: rgb(235,235,235); border-style: none;" value='${hs_Code }' maxlength="12">
                    </td>
                </tr>
                <tr>
                    <td align="center">��</td>
                    <td>
                        <input type="text" name="width" id="width" style="background-color: rgb(235,235,235); border-style: none;" value='${width }' maxlength="100">
                    </td>
                </tr>
                <tr>
                    <td align="center">����</td>
                    <td>
                        <input type="text" name="length" id="length" style="background-color: rgb(235,235,235); border-style: none;" value='${length }' maxlength="100">
                    </td>
                </tr>
                <tr>
                    <td align="center">����</td>
                    <td>
                        <input type="text" name="height" id="height" style="background-color: rgb(235,235,235); border-style: none;" value='${height }' maxlength="100">
                    </td>
                </tr>
                <tr>
                    <td align="center">����</td>
                    <td>
                        <input type="text" name="cost" id="cost" style="background-color: rgb(235,235,235); border-style: none;" value='${cost }' maxlength="15">
                    </td>
                </tr>
                <tr>
                    <td align="center">�ϻ��귮</td>
                    <td>
                        <input type="text" name="daily_production" id="daily_production" style="background-color: rgb(255, 255, 149);" value='${daily_production }' maxlength="5">
                    </td>
                </tr>
                <tr>
                    <td align="center">��/����ǰ</td>
                    <td>
                        <input type="text" style="background-color: rgb(255, 255, 149);" name="division"  id="division" value='${division }' maxlength="20">
                    </td>
                </tr>
                <tr>
                    <td align="center">���</td>
                    <td>
                        <input type="text" name="notes" id="notes" style="background-color: rgb(235,235,235); border-style: none;" value='${notes }' maxlength="200">
                    </td>
                </tr>
            </table>
        </container3>
        </form>
        <script>
        
        var item_Code = document.getElementById("item_Code");
        var item_Name = document.getElementById("item_Name");
        var daily_production = document.getElementById("daily_production");
        var division = document.getElementById("division");
        
      //üũ�ڽ��Լ�
    	function selectAll1(selectAll1){
        	const checkbox = document.getElementsByName('checkedContent');
        	checkbox.forEach((checkbox) => {
            	checkbox.checked = selectAll1.checked;
        	})
    	}
        
            function searchView(name) {
            	console.log('Ȯ��');
             	window.location.href = "${contextPath}/member/regitem.do?submit=1&&item_code=" + name; 
            }
            //����Լ�
            function newRow(){
            	if(item_Code.value == "" || item_Name.value == "" || daily_production.value == "" || division.value == "")
            		{
            		alert("�ʼ� �Է��׸��� ����ֽ��ϴ�. ����� �ڽ��� ��� ä���ּ���.");
            		}
            	else{
            	
        		document.getElementById('lOT_Quantity').value = "0";
        		document.getElementById('cost').value = "0";
        		const URLSearch = new URLSearchParams(location.search);
        		URLSearch.set('submit','1');
        		const newParam = URLSearch.toString();
        		var link = location.pathname +'?'+newParam;
        		var articleNOInput = document.createElement("input");
        		articleNOInput.setAttribute("type","hidden");
        		articleNOInput.setAttribute("name","path");
        		articleNOInput.setAttribute("value", link);
        		document.getElementById('regitem').appendChild(articleNOInput);
        		document.getElementById('regitem').action = "${contextPath}/member/additem.do";
        		document.getElementById('regitem').submit();
        			}
            	}
          //�����Լ�
     	   function updateRow() {  //����� ������ ������ ��Ʈ�ѷ��� �ѱ�� �Լ�
     		  if(item_Code.value == "" || item_Name.value == "" || daily_production.value == "" || division.value == "")
      		{
      		alert("�ʼ� �Է��׸��� ����ֽ��ϴ�. ��� �Է����ּ���.");
      		}
            	else{ 
     	        	document.getElementById('regitem').action = "${contextPath}/member/upditem.do";
     	    		document.getElementById('regitem').submit(); //���±�*�� ��ϵ��� ��Ʈ�ѷ��� ������
     	    		alert('�����Ǿ����ϴ�'); 
            	 }     	
            }
     	  view_button.onclick = function(){
     		  console.log('Ȯ��');
			  const URLSearch = new URLSearchParams(location.search);
			  URLSearch.set('submit', '2');
			  const newParam = URLSearch.toString();

			  window.open(location.pathname + '?' + newParam, '_self');
    	}

     	//�����Լ�
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
     	  			alert('������ ����� üũ�ڽ��� �������ּ���')
     	  			window.location.href = "${contextPath}/member/regitem.do";
     	  		}
     	      	else //��Ʈ�ѷ��� �ش����� no���� ������
     	  			window.location.href = "${contextPath}/member/deleteitem.do?no="+ary;       	
     	      }
     	//�˾�
     	function searchitemg(){
		
		openWindowPop('${contextPath}/member/itemgpop.do','itemgpopup');
	}
     	 function setChildValue(code, name) {
             $('input[name=type_code]').val(code);
             $('input[name=type_name]').val(name);
            
          }

	
        </script>
        
</body>
</html>