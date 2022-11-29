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
<title>검사유형등록</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> <!-- 제이쿼리사용을위한CDN -->
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
                    <td align="center">검사코드</td>
                    <td align="center">검사유형명</td>
                    <td align="center">비고</td>
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
                        text-align: center; width:99%; cursor:pointer;">신규등록</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </container2>
        <container3 id="contents3">
        <form method="get" id="reg_inspection_type">
            <table id="view2">
                <thead>
                    <td align="center">검사코드</td>
                    <td align="center">검사유형명</td>
                    <td align="center">검사유형질문</td>
                    <td align="center">비고</td>
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
	        
	        function searchView(name) { //조회를 담당하는 자바스크립트임
	            window.location.href = "${contextPath}/member/reginspection.do?submit=1&&com_code=" + name; 
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
	    			window.location.href = "${contextPath}/member/reginspection.do";
	    		}
	        	else {//컨트롤러로 해당목록의 no값을 보낸다
	        		alert('삭제 되었습니다');
	    			window.location.href = "${contextPath}/member/deleteInspection.do?no="+ary;
	        	}
	        }
	        
	        function newRow(){//있다가 수정해
	        	var checker = false;
	        	
	        	for(var i=0; i<codeList.length; i++){
	        		if(codeList[i].value==inspection_Code.value){
	        			checker = true;
	        		}
	        	}
	        	
	        	if(inspection_Code == "" || inspection_Name == ""){
	        		alert('필수 입력항목이 비어있습니다. 모두 입력해주세요.');
	        	}else if(checker) {
	        		alert('이미 존재하는 검사코드입니다');
	        	}else {
	        			
				alert('등록되었습니다');        	
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
	        
	        function updateRow() {  //목록을 수정한 내용을 컨트롤러로 넘기는 함수
	        	if(inspection_Code.value == "" || inspection_Name.value == ""){
		    		alert('필수 입력항목이 비어있습니다. 모두 입력해주세요.');
	    		}
	        	else{
		        	document.getElementById('reg_inspection_type').action = "${contextPath}/member/updateInspection.do";
		    		document.getElementById('reg_inspection_type').submit(); //폼태그*의 목록들을 컨트롤러로 전송함
		    		alert('수정되었습니다'); 
	        	}      	
	        }
        </script>
</body>
</html>