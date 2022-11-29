<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
  request.setCharacterEncoding("UTF-8");
%>    
    <c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
	String div = (String)request.getAttribute("div");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <style>
    	a{
    		text-decoration:none;
    	}
        #wrap{
            width: 300px;
            height: 400px;
            border: 1px solid black;
        }
        #searchBox{
            width: 100%;
            height: 23%;
            border: 1px solid black;
        }
        #button{
            margin-top: 3%;
            margin-right: 3%;
            text-align: right;
        }
        #search{
            margin-left: 30px;
        }
        #view{
        	width:100%;
        	height:77%;
        	overflow:scroll;
        }
    </style>
</head>
<body>
    <div id="wrap">
        <div id="searchBox">
            <table id="search">
                <tr>
                    <td>검색1</td>
                    <td><input type="text" id="code" /></td>
                </tr>
                <tr>
                    <td>검색2</td>
                    <td><input type="text" id="name"/></td>
                </tr>
            </table>
            <div id="button">
                <button id="search">조회</button>
                <button id="submit" onclick="submitClick(this.form)">적용</button>
				<button id="delete_pop">삭제</button>                 
                <button id="save_pop">저장</button>
            </div>
        </div>
        <div id="view">
		<form id="popForm" method="get" commandName = "defList">
            <table style="width: 100%;">
                <tr align="center">
			    	<td><input type="checkbox" name="content" onclick="selectAll(this)"/></td>
                    <td>불량군코드</td>
                    <td>불량군이름</td>
                </tr>
                <c:forEach var="group" items='${defGroupList }' varStatus="status">
   <tr align="center">
   <td><input type="checkbox" name="content" value='${group.defectiveItemGroupCode }'/></td>
      <td><a href="javascript:popFunction('${group.defectiveItemGroupCode }','${group.defectiveItemGroup }')">${group.defectiveItemGroupCode }</a></td>
      <td><a href="">${group.defectiveItemGroup }</a></td>
      <input type="hidden" name="defList[${status.index }].defectiveItemGroupCode" value='${group.defectiveItemGroupCode }'/>
      <input type="hidden" name="defList[${status.index }].defectiveItemGroup" value='${group.defectiveItemGroup }'/>
    </tr>
    </c:forEach>
    	<tr>
    	<td></td>
    		<td ><input type="text" name="defList[${fn:length(defGroupList) }].defectiveItemGroupCode"/></td>
    		<td><input type="text" name="defList[${fn:length(defGroupList) }].defectiveItemGroup"/></td>
    	</tr>
            </table>
            
    </form>
        </div>
    </div>
    
    <script>
   		var submit_button = document.getElementById("submit");
    	var text_code = document.getElementById("code");
    	var text_name = document.getElementById("name");
    	var save_pop = document.getElementById("save_pop");
    	var delete_pop = document.getElementById("delete_pop");
    	function popFunction(code,name){
    			text_code.value = code;
    			text_name.value = name;
    			
    	}
		submit_button.onclick = function(){
				var url = window.opener.document.location.href;
				var url_arr = url.split('?');
    			opener.parent.location=url_arr[0] + '?defGroupCode='+text_code.value+'&&defGroup='+text_name.value+'&&submit='+0;
    			window.close();
    		}
    		
    	save_pop.onclick = function(){
  		 		var link = location.pathname;
    			var articleNOInput = document.createElement("input");
    		     articleNOInput.setAttribute("type","hidden");
    		     articleNOInput.setAttribute("name","path");
    		     articleNOInput.setAttribute("value", link);
    		     document.getElementById('popForm').appendChild(articleNOInput);
                document.getElementById('popForm').action = "${contextPath}/member/adddefpop.do";
    			document.getElementById('popForm').submit();  
    	}
    	function selectAll(selectAll){
            const checkbox = document.getElementsByName('content');
            checkbox.forEach((checkbox) => {
                checkbox.checked = selectAll.checked;
            })
        }
    	delete_pop.onclick = function(){
			 var item = document.getElementsByName("content").length;
	    	  var no = "";
	    	  var ary = [];
	    	  for(var i=0; i<item;i++){
	    		  if(document.getElementsByName("content")[i].checked==true){
	    			  no = document.getElementsByName("content")[i].value;
	    			  ary.push(no);
	    		  }
	    			    window.location.href = "${contextPath}/member/deldefPop.do?no="+ary; 
	    	  }
		}
    </script>
</body>
</html>