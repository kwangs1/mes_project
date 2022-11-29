<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"    
    isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>
    <c:forEach var="wor" items="${worcom}" >
  	<c:set var="workplace_Code" value="${wor.workplace_Code }"/>
  	<c:set var="workplace_Name" value="${wor.workplace_Name }"/>
  	<c:set var="worcompany_Registration_Number" value="${wor.worcompany_Registration_Number }"/>
 	<c:set var="worcorporate_Registration_Number" value="${wor.worcorporate_Registration_Number }"/>
 	<c:set var="worrepresentatives_Name" value="${wor.worrepresentatives_Name }"/>
 	<c:set var="workplace_Zipcode" value="${wor.workplace_Zipcode }"/>
 	<c:set var="workplace_Address" value="${wor.workplace_Address }"/>
 	<c:set var="workplace_Number" value="${wor.workplace_Number }"/>
 	<c:set var="workplace_Tel" value="${wor.workplace_Tel }"/>
 	<c:set var="worupstate" value="${wor.worupstate }"/>
 	<c:set var="worindustry" value="${wor.worindustry }"/>
 	<c:set var="main_Store_Status" value="${wor.main_Store_Status }"/>
    </c:forEach>
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
            width: 25%;
            height: 80%;
            border: 1px solid black;
            z-index: 1;
        }
        #contents2{
            position: absolute;
            left: 40%;
            top: 15%;
            width: 60%;
            height: 80%;
            z-index: 1;
            border: 1px solid black;
        }
	 #table1 {
            text-align: center; width: 100%; padding-top: 20px;
            padding-right: 10%; padding-left: 2px;
            overflow: hidden;
        }
        #table2 {
            width: 100%; padding-top: 20px; padding-left: 50px; text-align: left;
            border-collapse: separate; border-spacing: 0 15px;
        }
        #reqInput {
           	background-color: rgb(255, 255, 149);
            text-align: center;
        }
        
        #address1 {
           	background-color: rgb(255, 255, 149);
            text-align: center;
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
<form method="get" id="regworkplace">
<container id = contents1>
            <table id="table1">
                <tr>
                	<td></td>
                    <p><td colspan = "2" span style="color:black" align="center">기초정보등록</td></p>
                </tr>
                <tr>
                	<td><input type="checkbox" name="checkedContent" onclick="selectAll1(this)"/></td>
                    <td align="center">코드</td>
                    <td align="center">사업장명</td>
                </tr>
                <c:forEach var="wor" items="${worView }" >
                <tr>
                <td><input type="checkbox" name="checkedContent" value='${wor.workplace_Code}'/></td>
                    <td>
                        <input type="text" onfocus="searchView(this.value)"  value='${wor.workplace_Code}'
                        style="background-color: rgb(235, 235, 235);
                        border-style: none; vertical-align: 1px; width: 80px; 
                        text-align: center;" pattern="[0-9]{4}" maxlength="12"
                        />
                    </td>
                    <td>
                        <input type=text  value='${wor.workplace_Name }'
                        style="background-color: rgb(235, 235, 235); 
                        border-style: none; vertical-align: 1px; width: 160px;
                        text-align: center;"  />
                    </td>
                </tr>
                </c:forEach>
                <td colspan="3">
                        <button onclick="searchView(this.value)"
                        style="background-color: rgb(235, 235, 235); 
                        border-style: none; 
                        text-align: center; width:99%">새로등록</button>
                    </td>
            </table>
        </container>
        <container id="contents2">
            <table id="table2">
                <tr>
                    <p><td colspan = "2" span style="color:black" align="center">기본등록사항</td></p>
                </tr>
                <tr>
                    <td align="center">사업장코드</td>
                    <td colspan="2" >
                        <input type="text" name="workplace_Code" id="workplace_Code"
                        value='${workplace_Code }' 
                        style="width: 240px; background-color: rgb(255, 255, 149);" pattern="[0-9]{10}" maxlength="12"/>
                    </td>
                </tr>
                <tr>
                    <td align="center" >사업장명</td>
                    <td colspan="2" >
                        <input type="text"  name="workplace_Name" id="workplace_Name"
                        value='${workplace_Name }' 
                        style="width: 240px; background-color: rgb(255, 255, 149);" pattern="[0-9]{10}" maxlength="50"/>
                    </td>
                </tr>
                <tr>
                    <td align="center">사업자등록번호</td>
                    <td colspan="2">
                        <input type="text" name="worcompany_Registration_Number" id="worcompany_Registration_Number"
                        value='${worcompany_Registration_Number }' 
                        style="width: 240px; background-color: rgb(255, 255, 149);" pattern="[0-9]{10}" maxlength="13"/>
                    </td>
                </tr>
                <tr>
                    <td align="center">법인등록번호</td>
                    <td colspan="2">
                        <input type="text" name="worcorporate_Registration_Number"
                        value="${worcorporate_Registration_Number }"
                        style="background-color: rgb(235,235,235);
                        border-style: none; width: 240px;
                        text-align: center;" pattern="[0-9]{13}" maxlength="15"/>
                    </td>
                </tr>
                <tr>
                    <td align="center">대표자명</td>
                    <td colspan="2">
                        <input type="text" name="worrepresentatives_Name" id="worrepresentatives_Name" value="${worrepresentatives_Name }"
                        style="width: 240px; background-color: rgb(255, 255, 149);" maxlength="50"/>
                    </td>
                </tr>
                <tr>
                    <td align="center">사업장우편번호</td>
                    <td>
                        <input type="text" name="workplace_Zipcode" value="${workplace_Zipcode }" id="zipcode" readonly
                        style="background-color: rgb(255, 255, 149);
                        width: 205px;
                        text-align: center;" pattern="[0-9]{5}" maxlength="12"/>
                        <a href="javascript:searchzip()"><i class="fas fa-search" style="color: blue;"></i></a>
                    </td>
                </tr>
                <tr>
                    <td align="center">사업장주소</td>
                    <td colspan="2">
                        <input type="text" name="workplace_Address" id="address1" value="${workplace_Address}" readonly
                        style="width: 240px;" maxlength="60"/>
                    </td>
                </tr>
                <tr>
                    <td align="center">사업장번지</td>
                    <td colspan="2">
                        <input type="text" name="workplace_Number"  value="${workplace_Number}" id="address2"
                        style="background-color: rgb(235,235,235);
                        border-style: none; width: 240px;
                        text-align: center;" maxlength="60"/>
                    </td>
                </tr>
                <tr>
                    <td align="center">전화번호</td>
                    <td colspan="2">
                        <input type="text" name="workplace_Tel" value="${workplace_Tel }" 
                            style="background-color: rgb(235,235,235);
                            border-style: none; width: 240px;
                            text-align: center;" pattern="[0-9]{10}" maxlength="13"/>
                    </td>
                </tr>
                <tr>
                    <td align="center">업태</td>
                    <td colspan="2">
                        <input type="text" name="worupstate" id="worupstate" value="${worupstate }"
                        style="width: 240px; background-color: rgb(255, 255, 149);" maxlength="20"/>
                    </td>
                </tr>
                <tr>
                    <td align="center">종목</td>
                    <td colspan="2">
                        <input type="text" name="worindustry" id="worindustry" value="${worindustry }"
                        style="width: 240px; background-color: rgb(255, 255, 149);" maxlength="20"/>
                    </td>
                </tr>
                <tr>
                    <td align="center">본점여부</td>
                    <td>
                        <select name="main_Store_Status"
                        style="background-color:rgb(235, 235, 235); 
                        border-style: none; width: 100px;
                        text-align: center;" >
                            <option value=0 <c:if test="${main_Store_Status == 0}">selected</c:if>>0.부</option>
                            <option value=1 <c:if test="${main_Store_Status == 1}">selected</c:if>>1.여</option>
                        </select>
                    </td>
                </tr>
            </table>
        </container>
        </form>
            <script>
            
            var workplace_Code = document.getElementById("workplace_Code");
            var workplace_Name = document.getElementById("workplace_Name");
            var worcompany_Registration_Number = document.getElementById("worcompany_Registration_Number");
            var worrepresentatives_Name = document.getElementById("worrepresentatives_Name");
            var zipcode = document.getElementById("zipcode");
            var address1 = document.getElementById("address1");
            var worupstate = document.getElementById("worupstate");
            var worindustry = document.getElementById("worindustry");
            
    	//체크박스함수
    	function selectAll1(selectAll1){
            const checkbox = document.getElementsByName('checkedContent');
            checkbox.forEach((checkbox) => {
                checkbox.checked = selectAll1.checked;
            })
        }
    	
        function openWindowPop1(url, name){
            var options = 'top=330, left=400, width=1130, height=420, status=no, menubar=no, toolbar=no, resizable=no';
            window.open(url, name, options);
        }
        function searchView(name) {
        	console.log('확인');
         	window.location.href = "${contextPath}/member/regbusiness.do?submit=1&&wor_code=" + name; 
        }
        //등록함수
        function newRow(){
        	if (workplace_Code.value == "" || workplace_Name.value == "" || worcompany_Registration_Number.value == "" || worrepresentatives_Name.value == "" || zipcode.value == "" || address1.value == "" || worupstate.value == "" || worindustry == "")
        	{
        		alert("필수 입력항목이 비어있습니다. 모두 입력해주세요.")	
        	}
        	else {
    		document.getElementsByName("workplace_Code").disabled = true;
    		document.getElementsByName("workplace_Name").disabled = true;
    		const URLSearch = new URLSearchParams(location.search);
    		URLSearch.set('submit','1');
    		const newParam = URLSearch.toString();
    		var link = location.pathname +'?'+newParam;
    		var articleNOInput = document.createElement("input");
    		articleNOInput.setAttribute("type","hidden");
    		articleNOInput.setAttribute("name","path");
    		articleNOInput.setAttribute("value", link);
    		document.getElementById('regworkplace').appendChild(articleNOInput);
    		document.getElementById('regworkplace').action = "${contextPath}/member/addbusiness.do";
    		document.getElementById('regworkplace').submit();
        	}
        }
        //수정함수
        function updateRow() {  //목록을 수정한 내용을 컨트롤러로 넘기는 함수
        	if (workplace_Code.value == "" || workplace_Name.value == "" || worcompany_Registration_Number.value == "" || worrepresentatives_Name.value == "" || zipcode.value == "" || address1.value == "" || worupstate.value == "" || worindustry == "")
        	{
        		alert("필수 입력항목이 비어있습니다. 모두 입력해주세요.")	
        	}
           	else{
    	        	document.getElementById('regworkplace').action = "${contextPath}/member/updbusiness.do";
    	    		document.getElementById('regworkplace').submit(); //폼태그*의 목록들을 컨트롤러로 전송함
    	    		alert('수정되었습니다'); 
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
      			window.location.href = "${contextPath}/member/regbusiness.do";
      		}
          	else //컨트롤러로 해당목록의 no값을 보낸다
      			window.location.href = "${contextPath}/member/deletbusiness.do?no="+ary;       	
          }
    	
    	function searchzip(){
    		
    		openWindowPop1('http://localhost:8090/webERP/member/zippopup.do','zippopup');
    	}
        </script>
</body>
</html>