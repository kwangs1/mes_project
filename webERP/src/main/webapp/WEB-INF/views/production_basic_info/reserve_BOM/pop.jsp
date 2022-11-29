<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>    
    
<%
	String inputNo = (String)request.getAttribute("inputNo");
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
            margin-top: 3%;.
            margin-right: 3%;
            text-align: right;
        }
        #view{
        	width:100%;
        	height:77%;
        	overflow:scroll;
        }
    </style>
</head>
<body>
<form name="popForm" method="get" >
    <div id="wrap">
        <div id="searchBox">
            <table id="search" style="width:100%">
                <tr>
                    <td>품목코드</td>
                    <td><input type="text" id="code" /></td>
                </tr>
                <tr>
                    <td>품목명</td>
                    <td><input type="text" id="name" class="name"/></td>
                </tr>
            </table>
            <div id="button">
                <button id="submit" onclick="submitClick(this.form)">적용</button>
                <input type="hidden" name="inputNo" value=""/>
            </div>
        </div>
        <div id="view">
            <table style="width: 100%;">
                <tr align="center">
                    <td>품목코드</td>
                    <td>품명</td>
                </tr>
            </table>
           <table id="searchItem" style="width:100%">
                <c:forEach var="bom" items="${itemView}">
   				<tr align="center" >
      				<td><a href="javascript:popFunction('${bom.itemNumber }','${bom.itemName }')">${bom.itemNumber}</a></td>
     				 <td><a href="#">${bom.itemName}</a></td>
   				</tr>
    </c:forEach> 
            </table>
            
        </div>
    </div>
      <script>
    var submit_button = document.getElementById("submit");
    		var text_code = document.getElementById("code");
    		var text_name = document.getElementById("name");
    	function popFunction(code,name){
    		text_code.value = code;
    		text_name.value = name;
    	}
    	submit_button.onclick = function(){
    		
    		text_code.setAttribute("itemNumber",text_code.value);
			text_name.setAttribute("itemName",text_name.value);
			var url = window.opener.document.location.href;
			var url_arr = url.split('?');
    		opener.parent.location=url_arr[0] + '?itemNumber='+text_code.value+'&&itemName='+text_name.value+'&&submit='+0;
    		window.close();
    	}
    </script>
    </form>
    
   <script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>
	<script>
 
    		
    	$('.name').keyup(function(){
    		//변수 words에 id가 name인것의 값을 저장한다
    		var words = $('#name').val();
    			$.ajax({
    				type : 'GET',
    			url : '/webERP/member/searchbom2.do',
    					//words값을 "itemName"이라는 이름의 파라미터로 전송한다.
    				data : { "itemName" : words},
    				success : function(responseData){
    					var data = responseData.popName;
    					
    					//검색을 시작할시 원래 있던 데이터를 지운다.
    					$("#searchItem").empty();
    					
    						for(var i = 0 ; i<data.length ; i++){
    						var str = '';
    							str += 	'<tr align="center" id = "yahoo">';
    							str +=  '<td><a href = "#">'+ data[i].itemNumber + '</a></td>';  
    							str +=  '<td><a href = "#">'+ data[i].itemName + '</a></td>';  
    							str +=  '<td><input type = "hidden" id="iCode" name ="iCode" value = "'+data[i].itemNumber+'"></td>';  
    							str +=  '<td><input type = "hidden" id="iName" value = "'+data[i].itemName+'" ></td>';  
    							str +=	'</tr>';
    							//반복문을 사용하여 searchItem table에 추가
    						$("#searchItem").append(str);
    						}
    					
    						
    				},
    				error: function(request,status,error){
            	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
         	       }
    			});
    		
    	});
    	$(document).on("click", "#yahoo", function (e){
			
			var initCode = 	$(this).find('input[id=iCode]').val();	
			var initName = 	$(this).find('input[id=iName]').val();
			//var inputCode = document.getElementById('iCode').value;	
			$('input[id=code]').val(initCode);
			$('input[id=name]').val(initName);
		});
    </script>
</body>
</html>
  