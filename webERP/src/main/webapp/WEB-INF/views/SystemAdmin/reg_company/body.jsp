<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"    
    isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>    
<c:forEach var="com" items="${comcom}" >     
 	<c:set var="company_Code" value="${com.company_Code }"/>
 	<c:set var="company_Name" value="${com.company_Name }"/>
 	<c:set var="sortation" value="${com.sortation }"/>
 	<c:set var="fiscal_Year_Number" value="${com.fiscal_Year_Number }"/>
 	<c:set var="fiscal_Year_Dates" value="${com.fiscal_Year_Dates }"/>
 	<c:set var="fiscal_Year_Datee" value="${com.fiscal_Year_Datee }"/>
 	<c:set var="company_Registration_Number" value="${com.company_Registration_Number }"/>
 	<c:set var="corporate_Registration_Number" value="${com.corporate_Registration_Number }"/>
 	<c:set var="resident_Registration_Number" value="${com.resident_Registration_Number }"/>
 	<c:set var="representatives_Name" value="${com.representatives_Name }"/>
 	<c:set var="main_Store_Postal_Code" value="${com.main_Store_Postal_Code }"/>
 	<c:set var="main_Store_Address" value="${com.main_Store_Address }"/>
 	<c:set var="main_Branch_Number" value="${com.main_Branch_Number }"/>
 	<c:set var="main_Store_Tel" value="${com.main_Store_Tel }"/>
 	<c:set var="upstate" value="${com.upstate }"/>
 	<c:set var="industry" value="${com.industry }"/>
 	<c:set var="date_Of_Establishment" value="${com.date_Of_Establishment }"/>
 	<c:set var="whether_To_Use_Status" value="${com.whether_To_Use_Status }"/>

 </c:forEach>
 <c:forEach var="zip" items='${zipInsert }'>
 	<c:set var="zipcode" value="${zip.zipcode }"/>
 	<c:set var="road_address" value="${zip.road_address }"/>
 	<c:set var="lot_address" value="${zip.lot_address }"/> 	
 </c:forEach>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회사등록</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> <!-- 제이쿼리사용을위한CDN -->
<style>
#contents1{
            position: absolute;
            left: 15%;
            top: 15%;
            width: 35%;
            height: 80%;
            border: 1px solid black;
            z-index: 1;
        }
        #contents2{
            position: absolute;
            left: 50%;
            top: 15%;
            width: 50%;
            height: 80%;
            z-index: 1;
            border: 1px solid black;
        }
	#table1 {
            text-align: center; width: 100%; padding-top: 20px;
            padding-right: 10%; padding-left: 2px;
            overflow: hidden;
            border: 1px solid #ccc; 
        }
        #table1 td{
            width: 100%;
        }
        #contents2{
            position: absolute;
            left: 50%;
            top: 15%;
            width: 50%;
            height: 80%;
            z-index: 1;
            border: 1px solid black;
        }
        #table2 {
            width: 100%; padding-top: 20px; padding-left: 50px; text-align: left;
            border-collapse: separate; border-spacing: 0 15px; 
        }
        .reqInput {
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
<form  method="get" id="regcompany">
<container id = contents1 style="overflow: auto;">

            <table id="table1">
                <tr>
                	<td>
                        <input type="checkbox" name="checkedContent" onclick="selectAll1(this)"/>
                    </td>
                    <td align="center">회사코드</td>
                    <td align="center">회사명</td>
                    <td align="center">구분</td>
                </tr>
   
                <c:forEach var="com" items="${comView}" >     
                <tr>
                <td><input type="checkbox" name="checkedContent" value='${com.company_Code}'/></td>
                    <td>
                        <input type="text"  onfocus="searchView(this.value)" value='${com.company_Code }'
                        style="background-color: rgb(235, 235, 235); 
                        border-style: none;
                        text-align: center;" readonly />
                    </td>
                    <td>
                        <input type="text" value='${com.company_Name }'
                        style="background-color: rgb(235, 235, 235); 
                        border-style: none;
                        text-align: center;" readonly/>
                    </td>
                    <td>
                        <select id="sortation1" name="sortation1"
                        style="background-color:rgb(235, 235, 235); 
                        border-style: none; 
                        text-align: center;" >
                            <option value=0 <c:if test="${com.sortation == 0}">selected</c:if>>법인</option>
                            <option value=1 <c:if test="${com.sortation == 1}">selected</c:if>>개인</option>
                        </select>
                    </td>
                </tr>
		</c:forEach>
		            <tr>
                    <td colspan="3">
                        <button onclick="searchView(this.value)"
                        style="background-color: rgb(235, 235, 235); 
                        border-style: none; 
                        text-align: center; width:125%">새로등록</button>
                    </td>
                	</tr>
            </table>
        </container>
        <container id="contents2">
            <table id="table2">
                <tr>
                    <p><td colspan = "3" span style="color:black" align="center">기본정보등록</td></p>
                </tr>
                <tr>
                    <td align="center">코드</td>
                    <td colspan="2">
                        <input type="text" name="company_Code" id="company_Code" class= "reqInput"
                        value='${company_Code }'
                        style="width: 240px;" pattern="[0-9]{13}" maxlength="12"/>
                    </td>
                </tr>
                <tr>
                    <td align="center">회사명</td>
                    <td colspan="2">
                        <input type="text" name="company_Name" id="company_Name" class= "reqInput"
                        value='${company_Name }'
                        style="width: 240px;" pattern="[0-9]{13}" maxlength="50"/>
                    </td>
                        
                </tr>
                <tr align="center">
                    <td>구분</td>
                 <td>
                <select name="sortation" id="sortation"
                        style="background-color:rgb(235, 235, 235); 
                        border-style: none;
                        text-align: center;">
                            <option value=0>법인</option>
                            <option value=1>개인</option>
                        </select>
                        
                        </td>
                </tr>
                
                <tr>
                    <td align="center">회계연도</td>
                    <td>
                        제
                        <input type="text" name="fiscal_Year_Number" id="fiscal_Year_Number" class= "reqInput"
                        value='${fiscal_Year_Number }'
                        style="width: 60px" pattern="[0-9]{3}" maxlength="3"/>
                        기
                    </td>
                    <td>
                        <input type="date" name="fiscal_Year_Dates" id="fiscal_Year_Dates" style="background-color: rgb(255, 255, 149);" value='${fiscal_Year_Dates }'/>
                        ~
                        <input type="date" name="fiscal_Year_Datee" id="fiscal_Year_Datee" style="background-color: rgb(255, 255, 149);" value='${fiscal_Year_Datee }'/>
                    </td>
                </tr>
                <tr>
                    <td align="center">사업자등록번호</td>
                    <td colspan="2">
                        <input type="text" name="company_Registration_Number" id="company_Registration_Number" class= "reqInput"
                        value='${company_Registration_Number }'
                        style="width: 240px;" pattern="[0-9]{13}" maxlength="13"/>
                    </td>
                </tr>
                <tr>
                    <td align="center">법인등록번호</td>
                    <td colspan="2">
                        <input type="text" name="corporate_Registration_Number" 
                        style="background-color: rgb(235,235,235);  
                        border-style: none; width: 240px;
                        text-align: center;" pattern="[0-9]{13}" maxlength="13" 
                        value='${corporate_Registration_Number }' />
                        법인의 경우 필수입력항목
                    </td>
                </tr>
                <tr>
                    <td align="center">대표자성명</td>
                    <td colspan="2">
                        <input type="text" name="representatives_Name" id="representatives_Name" class= "reqInput"
                        style="width: 240px;"
                        value='${representatives_Name }' maxlength="50"/>
                    </td>
                </tr>
                <tr>
                    <td align="center">주민등록번호</td>
                    <td colspan="2">
                        <input type="text" name="resident_Registration_Number" 
                        value='${resident_Registration_Number }'
                        style="background-color: rgb(235,235,235);
                        border-style: none; width: 240px;
                        text-align: center;" maxlength="15"
                         />
                        개인의 경우 필수입력항목
                    </td>
                </tr>
                <tr>
                    <td align="center">본점우편번호</td>
                    <td colspan="2">
                        <input type="text" name="main_Store_Postal_Code" id="zipcode" readonly
                        style="background-color: rgb(255, 255, 149);
                        width: 205px;
                        text-align: center;" pattern="[0-9]{5}" maxlength="12"
                        value='${main_Store_Postal_Code }' />
                        <a href="javascript:searchzip()"><i class="fas fa-search" style="color: blue;"></i></a>
                    </td>
                </tr>
                <tr>
                    <td align="center">본점주소</td>
                    <td colspan="2">
                        <input type="text" name="main_Store_Address" id="address1" class= "reqInput" readonly
						value='${main_Store_Address }'
                        style="width: 240px;" maxlength="60" />
                    </td>
                </tr>
                <tr>
                    <td align="center">본점번지</td>
                    <td colspan="2">
                        <input type="text" name="main_Branch_Number" id="address2"
                        style="background-color: rgb(235,235,235);
                        border-style: none; width: 240px;
                        text-align: center;"	
                        value='${main_Branch_Number }' maxlength="60"/>
                    </td>
                </tr>
                <tr>
                    <td align="center">본점전화번호</td>
                    <td colspan="2">
                        <input type="text" name="main_Store_Tel"
                            style="background-color: rgb(235,235,235);
                            border-style: none; width: 240px;
                            text-align: center;" pattern="[0-9]{12}" maxlength="13"
                            value='${main_Store_Tel }' />
                    </td>
                </tr>
                <tr>
                    <td align="center">업태</td>
                    <td colspan="2">
                        <input type="text" name="upstate" id="upstate" class= "reqInput" 
                        value='${upstate }'
                        style="width: 240px;" maxlength="20"/>
                    </td>
                </tr>
                <tr>
                    <td align="center">종목</td>
                    <td colspan="2">
                        <input type="text" name="industry" id="industry" class= "reqInput"
                        value='${industry }'
                        style="width: 240px;" maxlength="20"/>
                    </td>
                </tr>
                <tr>
                    <td align="center">설립연월일</td>
                    <td colspan="2">
                        <input type="date" name="date_Of_Establishment" id="date_Of_Establishment"
                        value='${date_Of_Establishment }'
                        style="background-color: rgb(255, 255, 149);
                        text-align: center;" 
                        
                        />
                    </td>
                </tr>
                <tr>
                    <td align="center">사용여부</td>
                    <td>
                        <select name="whether_To_Use_Status" id="whether_To_Use_Status">
                            <option value="1">1.사용</option>
                            <option value="0">0.미사용</option>
                        </select>
                    </td>
                </tr>
            </table>
        </container>
</form>
<script>

	var company_Code = document.getElementById("company_Code");
	var company_Name = document.getElementById("company_Name");
	var fiscal_Year_Number = document.getElementById("fiscal_Year_Number");
	var fiscal_Year_Dates = document.getElementById("fiscal_Year_Dates");
	var fiscal_Year_Datee = document.getElementById("fiscal_Year_Datee");
	var company_Registration_Number = document.getElementById("company_Registration_Number");
	var representatives_Name = document.getElementById("representatives_Name");
	var zipcode = document.getElementById("zipcode");
	var address1 = document.getElementById("address1");
	var upstate = document.getElementById("upstate");
	var industry = document.getElementById("industry");
	var date_Of_Establishment = document.getElementById("date_Of_Establishment");

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
 		window.location.href = "${contextPath}/member/regcompany.do?submit=1&&com_code=" + name; 
	}
	
	//등록함수
	function newRow(){
		if(company_Code.value == "" || company_Name.value == "" || fiscal_Year_Number.value == "" || fiscal_Year_Dates.value == "" || fiscal_Year_Datee.value == "" || company_Registration_Number.value == "" || representatives_Name.value == "" || zipcode.value == "" || address1.value == "" || upstate.value == "" || industry.value == "" || date_Of_Establishment.value == "" )
		{
			alert("필수 입력항목이 비어있습니다. 모두 입력해주세요.");
		}
		else {
		const URLSearch = new URLSearchParams(location.search);
		URLSearch.set('submit','1');
		const newParam = URLSearch.toString();
		var link = location.pathname +'?'+newParam;
		var articleNOInput = document.createElement("input");
		articleNOInput.setAttribute("type","hidden");
		articleNOInput.setAttribute("name","path");
		articleNOInput.setAttribute("value", link);
		document.getElementById('regcompany').appendChild(articleNOInput);
		document.getElementById('regcompany').action = "${contextPath}/member/addcompany.do";
		document.getElementById('regcompany').submit();
		}
	}
	//수정함수
	   function updateRow() {  //목록을 수정한 내용을 컨트롤러로 넘기는 함수
		   if(company_Code.value == "" || company_Name.value == "" || fiscal_Year_Number.value == "" || fiscal_Year_Dates.value == "" || fiscal_Year_Datee.value == "" || company_Registration_Number.value == "" || representatives_Name.value == "" || zipcode.value == "" || address1.value == "" || upstate.value == "" || industry.value == "" || date_Of_Establishment.value == "" )
			{
				alert("필수 입력항목이 비어있습니다. 모두 입력해주세요.");
			}
       	else{
	        	document.getElementById('regcompany').action = "${contextPath}/member/updcompany.do";
	    		document.getElementById('regcompany').submit(); //폼태그*의 목록들을 컨트롤러로 전송함
	    		alert('수정되었습니다'); 
       	}      	
	}
	function searchzip(){
		
		openWindowPop1('http://localhost:8090/webERP/member/zippopup.do','zippopup');
	}
	
	function setChildValue(name){
  	  document.getElementById('zipcode').value="";
  	  document.getElementById('address1').value="";
  	  document.getElementById('address2').value="";
  	  const URLSearch = new URLSearchParams(location.search);
		  URLSearch.set('submit', '2');
		  const newParam = URLSearch.toString();
      if(URLSearch.get('zipCode') == null){
		window.location.href = location.pathname +'?'+newParam + '&zipCode=' + name;
      }
      else{
      	URLSearch.set('zipCode', name);
      	const newParam = URLSearch.toString();
      	window.location.href = location.pathname +'?'+newParam;
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
  			window.location.href = "${contextPath}/member/regcompany.do";
  		}
      	else //컨트롤러로 해당목록의 no값을 보낸다
  			window.location.href = "${contextPath}/member/deletecompany.do?no="+ary;       	
      }
</script>
</body>
</html>