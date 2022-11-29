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
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> <!-- 제이쿼리사용을위한CDN -->
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
            width: 85%;
            height: 70%;
            border: 1px solid #ccc;
            z-index: 1;
        }
        .con1_search {
            margin: 10px;   
        }
       
        
        .con1_search {
            margin: 10px;   
        }
        #contents1 {
            border-bottom: none;
            
        }
        #contents2 {
            border-bottom: none;
            
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
            text-align: center;
        }
        #contents3 td {
            border-collapse: collapse;
            padding: 3px;
        }

        
        #contents1 input[type="text"] {
            text-align: center;
        }
        #contents1 input[disabled] {
            border: 2px inset rgb(148, 147, 150);
        }
        #contents2 input {
            text-align: center;
        }
        #contents3 input {
            text-align: center;
        }        
        
        #table1 {
            width: 70%;
            padding-top: 15px;
            padding-left: 25px;
            text-align: center;
            margin-top: 18px;
        }
        #table2 {
            width: 60%;
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
<form method="get" id="regItemg">
<container1 id = contents1>
            <table id="table1" align="center" style="color:brown">
            <tr>
            <td><strong>*품목군에 속해있는 품목이 있을경우 삭제를 할수 없습니다.<br>먼저 속한 품목을 모두 삭제후 품목군을 삭제 해주세요.*</strong></td>
            </tr>
            </table>
        </container1>
        <container2 id= contents2>
            <table id="table2" align="center">
                <tr>
                    <td>
                        <input type="checkbox" name="checkedContent" onclick="selectAll1(this)"/>
                    </td>
                    <td>품목군코드</td>
                    <td>품목군명</td>
                    <td>사용여부</td>
                    <td>품목군설명</td>
                </tr>
                <c:forEach var="itemg" items="${itemgView}" varStatus="status" >  
                <tr id = "updateTest" align="center">
                <td><input type="checkbox" id="checkedContent" name="checkedContent" value = '${itemg.item_Group_Code}' <c:if test="${itemg.div1 == 0}">disabled</c:if>/></td>
                    <td><input type="text" name="ListVO[${status.index }].item_Group_Code" value = '${itemg.item_Group_Code}'/></td>
                    <td><input type="text" name="ListVO[${status.index }].item_Group_Name" value = '${itemg.item_Group_Name}'/></td>
                    <td><select name="ListVO[${status.index }].use_Status">
    					<option value=0 <c:if test="${itemg.use_Status == 0}">selected</c:if>>0.부</option>
    					<option value=1 <c:if test="${itemg.use_Status == 1}">selected</c:if>>1.여</option>
    				</select></td>
                    <td><input type="text" name="ListVO[${status.index }].explanation" value = '${itemg.explanation}'/></td>
                 </tr>
                </c:forEach>
                <tbody>
                 <tr id ="insertTest" align="center" >
    <td></td>
    	<td><input type="text" name="ListVO[${fn:length(itemgView) }].item_Group_Code" id="item_Group_Code1" style="background-color: rgb(255, 255, 149);" maxlength="12"/></td>
    	<td><input type="text" name="ListVO[${fn:length(itemgView) }].item_Group_Name" id="item_Group_Name1" style="background-color: rgb(255, 255, 149);" maxlength="50"/></td>
    	<td>
    	<select name="ListVO[${fn:length(itemgView) }].use_Status" id="use_Status1" style="background-color: rgb(235,235,235);">
    	<option value=0 <c:if test="${itemg.use_Status == 0}">selected</c:if>>0.부</option>
    	<option value=1 <c:if test="${itemg.use_Status == 1}">selected</c:if>>1.여</option>
    	</select>
    	</td>
    	<td><input type="text" name="ListVO[${fn:length(itemgView) }].explanation" id="explanation1" style="background-color: rgb(235,235,235); border-style: none;" maxlength="200"/></td>
    </tr>
                 </tbody>
            </table>
        </container2>
        </form>
        <script>
        var department_Code1 = document.getElementById("item_Group_Code1");
        var department_Name1 = document.getElementById("item_Group_Name1");
        var workplace_Code1 = document.getElementById("use_Status1");
        var workplace_Name1 = document.getElementById("explanation1");
      //체크박스함수
    	function selectAll1(selectAll1){
        	const checkbox = document.getElementsByName('checkedContent');
        	checkbox.forEach((checkbox) => {
            	checkbox.checked = selectAll1.checked;
        	})
    	}
        
        //등록함수
        function newRow(){
        	if(item_Group_Code1.value == "" || item_Group_Name1.value == "" )
        		{
        		alert("필수 입력항목이 비어있습니다. 모두 입력해주세요.")
        		}
        	else{
    		const URLSearch = new URLSearchParams(location.search);
    		URLSearch.set('submit','1');
    		const newParam = URLSearch.toString();
    		var link = location.pathname +'?'+newParam;
    		var articleNOInput = document.createElement("input");
    		articleNOInput.setAttribute("type","hidden");
    		articleNOInput.setAttribute("name","path");
    		articleNOInput.setAttribute("value", link);
    		document.getElementById('regItemg').appendChild(articleNOInput);
    		document.getElementById('regItemg').action = "${contextPath}/member/additemg.do";
    		document.getElementById('regItemg').submit();
    			}
        	}
      //수정함수
        function updateRow() {
    var delConfirm = confirm('수정하실껀가요?');
   if(delConfirm){
      alert('수정 완료되셨습니다!');
       console.log('123')
        var table2 = document.getElementById('table2');
          var row = table2.insertRow(); 
          const URLSearch = new URLSearchParams(location.search);
          URLSearch.set('submit', '1');
         const newParam = URLSearch.toString();
         var link = location.pathname + '?' + newParam;
      document.getElementById("item_Group_Code1").disabled = true;      
      document.getElementById("item_Group_Name1").disabled = true;
      document.getElementById("use_Status1").disabled = true;
      document.getElementById("explanation1").disabled = true;
      var Input = document.createElement("input");
      Input.setAttribute("type", "hidden");
      Input.setAttribute("name", "path");
      Input.setAttribute("value", link);
      document.getElementById('regItemg').appendChild(Input);
      document.getElementById('regItemg').action = "${contextPath}/member/upditemg.do";
      document.getElementById('regItemg').submit(); 
      
   }else{
      alert('수정을 취소하셨습니다!');
      location.reload(true);
      location.href = location.href;

      history.go(0);
   }
   
}
      //삭제함수
      function deleteData() {//체크박스의 체크한곳의 값을 배열로만들어 컨트롤러로 넘겨 삭제하는 기능을 하는 함수
        	var item = document.getElementsByName("checkedContent").length;
        	var no = "";
        	var ary = [];
        	
        	for(var i=0; i<item; i++) { //체크된 체크박스들의 no값을 반복문을 통하여 배열로만든다
        		if(document.getElementsByName("checkedContent")[i].checked==true) {
        			no = document.getElementsByName("checkedContent")[i].value;
        			ary.push(no);
        		}       		
        	}
        	if(ary.length === 0 || ary === null){ //체크박스가 아무것도 체크되지 않았을때
    			alert('삭제할 목록의 체크박스를 선택해주세요')
    			window.location.href = "${contextPath}/member/regitemgroup.do";
    		}
        	else //컨트롤러로 해당목록의 no값을 보낸다
    			window.location.href = "${contextPath}/member/deleteItemg.do?no="+ary;       	
        }
      //체크박스 품목군을 참조하고 있는 품목이 있으면 disabled
       function check_form(){
    	  var checkedContent = document.getElementById('checkedContent');
    	  checkedContent.disabled = false;
      }
        </script>
</body>
</html>