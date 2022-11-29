<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    isELIgnored="false"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>
<c:forEach var="sel" items="${logisticsSelectedView}" >     
 	<c:set var="logistics_In_Code" value="${sel.logistics_In_Code }"/>
 	<c:set var="logistics_In_Name" value="${sel.logistics_In_Name }"/>
 	<c:set var="explanation" value="${sel.explanation }"/>
 	<c:set var="remarks" value="${sel.remarks }"/>
</c:forEach>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>물류관리내역등록</title>
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
            text-align: center; width: 100%; padding-top: 10px;
            padding-right: 2%; padding-left: 2px;
        }
        #table2 {
            width: 100%; text-align: center;
            border-collapse: separate; border-spacing: 0 15px; border: 1px solid black;
            padding-right: 15%;
        }
        #table3 {
            width: 100%; padding-top: 10px; padding-left: 10px; text-align: center;
            border-collapse: separate; border-spacing: 0 15px;
        }      
        
        #contents1 input {
        	text-align:center;
        	width:100%;
        }        
        #contents2 input {
        	text-align:center;
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
<container id = contents1>
            <table id="table1">            	
                <tr>
                	<td></td>
                    <td style="width:47.5%;">코드</td>
                    <td style="width:47.5%;">관리항목명</td>
                </tr>
                <c:forEach var="logis" items="${logisticsView}" >
	                <tr>
	                    <td>
	                    	<input type="checkbox"  name="checkedContent" value="${logis.logistics_In_Code}"/>
	                    </td>                   
	                    <td>
	                        <input type="text" id="codeList" name="codeList" onfocus = "searchView(this.value)" value="${logis.logistics_In_Code}" style="cursor:pointer; background-color:#eee" readonly/>
	                    </td>     
	                    <td>
	                        <input type="text" id="nameList" name="nameList" value="${logis.logistics_In_Name}"  maxlength="50" readonly/>
	                    </td>                    	                    
	                </tr>
	               
                </c:forEach>     
                <tr>
                    <td colspan="3">
                        <button onclick="searchView(this.value)"
                        style="background-color: rgb(235, 235, 235); 
                        border-style: none; 
                        text-align: center; width:99%; cursor:pointer;">새로등록</button>
                    </td>
                </tr>           
            </table>
        </container>

        <container id="contents2">
        	<form method="get" id="searchForm">
	            <table id="table2">
	                <tr>
	                    <td align="center" style="width:25%; text-align:right;">코드</td>
	                    <td style="width:25%;">
	                        <input type="text" id="logisSearchBox" name="logisSearchBox" value="${param.itemNumber }"  readonly>
	                    </td>    
	                    <td style="width:2%;"><div style="text-align:center; width:100%;" id=searchCodeButton><a href="javascript:searchCode()"><i class="fas fa-search" style="color :blue;"></i></a></div></td>
	                    <td style="width:25%;">
	                        <input type="text" id="logisSearchBox2" value="${param.itemName }" disabled >
	                    </td>
	                </tr>
	            </table>
            </form>
            <form method="get" id="logisticsUpdateForm">
	            <table id="table3">
	                <thead>
	                    <td align="center">관리내역코드</td>
	                    <td align="center">관리항목명</td>
	                    <td align="center">품목군설명</td>
	                    <td align="center">비고</td>
	                </thead>
	                <tbody>
	                	<tr>
		                    <td>
		                        <input type="text" name="logistics_In_Code" id="logistics_In_Code" style="background-color: rgb(255, 255, 149);" value="${logistics_In_Code }" maxlength="12">
		                    </td>
		                    <td>
		                        <input type="text" name="logistics_In_Name" id="logistics_In_Name" style="background-color: rgb(255, 255, 149);" value="${logistics_In_Name }" maxlength="50">
		                    </td>
		                    <td>
		                        <input type="text" name="explanation" id="explanation" style="background-color: rgb(235,235,235);
                            border-style: none;" value="${explanation }" maxlength="200">
		                    </td>
		                    <td>
		                        <input type="text" name="remarks" id="remarks" style="background-color: rgb(235,235,235);
                            border-style: none;" value="${remarks }" maxlength="200">
		                    </td>
	                    </tr>
	                </tbody>
	            </table>
            </form>
        </container>
        <script>
        var logistics_In_Code = document.getElementById("logistics_In_Code");
        var logistics_In_Name = document.getElementById("logistics_In_Name");
        var codeList = document.getElementsByName("codeList");
        
	        function searchView(name) { //조회를 담당하는 자바스크립트임
	            window.location.href = "${contextPath}/member/logistics_manage.do?submit=1&&com_code=" + name; 
	        }
	        
	        function searchData() {
	        	var searchForm = $('#searchForm');
	        	var is_empty = false; //변수 is_empty로 조건문의 분기를 만듬
	        	$('#searchForm').find('input[type!="hidden"]').each(function(){//값이 비어있는지 체크하는 제이쿼리
	        	    if(!$(this).val()) { //#reg_gen_account는 form태그의 id값임
	        	    	is_empty = true;      	    	
	        	    }      	 
	        	});       	 
	        	if(is_empty) { //비어있는내용이 있는지 체크함
	        	    alert('검색내용이 비어있습니다');
	        	}
	        	else{	        	
		    		searchForm.submit();
	        	} 
	        }
	        
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
	    			alert('삭제할 목록의 체크박스를 선택해주세요');
	    			window.location.href = "${contextPath}/member/logistics_manage.do";
	    		}
	        	else {//컨트롤러로 해당목록의 no값을 보낸다
	        		alert('삭제 되었습니다');
	    			window.location.href = "${contextPath}/member/deleteLogistics_manage.do?no="+ary;
	        	}
	        }
	        //등록
	        function newRow(){
				var checker = false;
	        	
	        	for(var i=0; i<codeList.length; i++){
	        		if(codeList[i].value==logistics_In_Code.value){
	        			checker = true;
	        		}
	        	}
	        	
	        	if(logistics_In_Code.value == "" || logistics_In_Name == ""){
       				alert("필수 입력항목이 비어있습니다. 모두 입력해주세요.");
       				
	        	}else if(checker){
	        		alert("이미 존재하는 관리내역코드입니다");
	        		
	        	}else {
	    		const URLSearch = new URLSearchParams(location.search);
	    		URLSearch.set('submit','1');
	    		const newParam = URLSearch.toString();
	    		var link = location.pathname +'?'+newParam;
	    		var articleNOInput = document.createElement("input");
	    		articleNOInput.setAttribute("type","hidden");
	    		articleNOInput.setAttribute("name","path");
	    		articleNOInput.setAttribute("value", link);
	    		document.getElementById('logisticsUpdateForm').appendChild(articleNOInput);
	    		document.getElementById('logisticsUpdateForm').action = "${contextPath}/member/addLogistics_manage.do";
	    		document.getElementById('logisticsUpdateForm').submit();
	    		}
	        }
	        //수정
	        function updateRow() {  //목록을 수정한 내용을 컨트롤러로 넘기는 함수
	        	if(logistics_In_Code.value == "" || logistics_In_Name == "")
        		{
        			alert("필수 입력항목이 비어있습니다. 모두 입력해주세요.");
        		}
	        	else{
		        	document.getElementById('logisticsUpdateForm').action = "${contextPath}/member/updateLogistics_manage.do";
		    		document.getElementById('logisticsUpdateForm').submit(); //폼태그*의 목록들을 컨트롤러로 전송함
		    		alert('수정되었습니다'); 
	        	}      	
	        } 
        

	        function searchCode() { //돋보기버튼을 클릭하면 컨트롤러로 팝업에 대한 정보를 호출함       	
	        	openWindowPop("${contextPath}/member/logisticsPopup.do", "logisticsPopup");
	        }

	        
        </script>
</body>
</html>