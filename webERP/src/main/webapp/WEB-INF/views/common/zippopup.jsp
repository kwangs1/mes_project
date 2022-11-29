<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
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
            width: 1100px; 
            height: 500px;
            border: 1px solid black;
        }
        #searchBox{
            width: 100%;
            height: 18%;
            border: 1px solid black;
        }
        #button{
            margin-top: -4%;
            margin-right: 3%;
            text-align: right;
        }
        #search{
            margin-left: 30px;
        }
        #view{
        	width:100%;
        	height:82%;
        	overflow:scroll;
        }
        #test{
        	width:100px;
        }
    </style>
</head>
<body>
<form name="popForm" method="get" action="${contextPath }/member/zippopup" >
    <div id="wrap">
        <div id="searchBox">
            <table id="search">
                <tr>
                    <td>우편번호</td>
                    <td><input type="text" id="code" name="code" readonly/></td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td><input type="text" id="name" class="name" name="name"/></td>
                </tr>
                <tr>
                    <td>주소2</td>
                    <td><input type="text" id="name2" class="name2" name="name2"/></td>
                </tr>
            </table>
            <div id="button">
                <button id="submit">적용</button>
                <button id="close">닫기</button>
            </div>
        </div>
        <div id="view">
            <table id="searchItem" style="width: 100%;">
                <tr align="center">
                    <td id="test">우편번호</td>
                    <td>주소</td>
                    <td>주소2</td>
                </tr>
                <c:forEach var="zip" items="${zipView}" >     
				     <tr align="center">
				      <td><a href="javascript:popFunction('${zip.zipcode }','${zip.road_address }','${zip.lot_address }')">${zip.zipcode }</a></td>
				      <td><a href="javascript:popFunction('${zip.zipcode }','${zip.road_address }','${zip.lot_address }')">${zip.road_address}</a></td>
				      <td><a href="javascript:popFunction('${zip.zipcode }','${zip.road_address }','${zip.lot_address }')">${zip.lot_address}</a></td>
				     </tr>
   				</c:forEach> 
            </table>
        </div>
    </div>
    
    <script>
    /* var submit_button = document.getElementById("submit");
    		var text_zipcode = document.getElementById("zipcode");
    		var text_address1 = document.getElementById("address1");
    		var text_address2 = document.getElementById("address2");
    	function popFunction(zipcode,address1,address2){
    		text_zipcode.value = zipcode;
    		text_address1.value = address1;
    		text_address2.value = address2;
    	}
    	//팝업창
    	submit_button.onclick = function() { //적용버튼에 온클릭이벤트 부여함 (팝업창)
            $(opener.document).find("#zipcode").val($("#zipcode").val()); //#zipCode는 body.jsp의 텍스트박스임, #code는 팝업.jsp의 텍스트박스임
            $(opener.document).find("#address1").val($("#address1").val());
            $(opener.document).find("#address2").val($("#address2").val());
            window.close();
    	} */
    	
    	var submit_button = document.getElementById("submit");
	    var close_button = document.getElementById("close");
	    
		var text_code = document.getElementById("code");
		var text_name = document.getElementById("name");
		var text_name2 = document.getElementById("name2");
    
    	function popFunction(code,name,name2){
    			text_code.value = code;
    			text_name.value = name;
    			text_name2.value = name2;
    	}
    	
    	submit_button.onclick = function() { //적용버튼에 온클릭이벤트 부여함 (팝업창)
    		$(opener.document).find("#zipcode").val($("#code").val()); //#zipCode는 body.jsp의 텍스트박스임, #code는 팝업.jsp의 텍스트박스임
    		$(opener.document).find("#address1").val($("#name").val());
    		$(opener.document).find("#address2").val($("#name2").val());
    		window.close();
    	}
	
  
    	close_button.onclick = function(){
    		window.close();
    	}
    	
    	$('.name')
		.keyup(
				function() {
					//변수 words에 id가 name인것의 값을 저장한다
					var words = $('#name').val();
					$.ajax({
						type : 'GET',
						url : '/webERP/member/searchPopCompanyZipCode.do',
						//words값을 "itemName"이라는 이름의 파라미터로 전송한다.
						data : {
							"itemName" : words
						},
						success : function(responseData) {
							var data = responseData.popName;

							//검색을 시작할시 원래 있던 데이터를 지운다.
							$("#searchItem").empty();

							for (var i = 0; i < data.length; i++) {
								var str = '';
								str += '<tr align="center" id = "yahoo">';
								str += '<td><a href = "#">'
										+ data[i].zipCode
										+ '</a></td>';
								str += '<td><a href = "#">'
										+ data[i].road_Address
										+ '</a></td>';
								str += '<td><a href = "#">'
										+ data[i].lot_Address
										+ '</a></td>';
								str += '<td><input type = "hidden" id="iCode" name ="iCode" value = "'+data[i].zipCode+'"></td>';
								str += '<td><input type = "hidden" id="iName" value = "'+data[i].road_Address+'" ></td>';
								str += '<td><input type = "hidden" id="iName2" value = "'+data[i].lot_Address+'" ></td>';
								str += '</tr>';
								//반복문을 사용하여 searchItem table에 추가
								$("#searchItem")
										.append(str);
							}

						},
						error : function(request, status,
								error) {
							alert("code:" + request.status
									+ "\n" + "message:"
									+ request.responseText
									+ "\n" + "error:"
									+ error);
						}
					});

		});
							

		$(document).on("click", "#yahoo", function(e) {
		
			var initCode = $(this).find('input[id=iCode]').val();
			var initName = $(this).find('input[id=iName]').val();
			var initName2 = $(this).find('input[id=iName2]').val();
			//var inputCode = document.getElementById('iCode').value;	
			$('input[name=code]').val(initCode);
			$('input[name=name]').val(initName);
			$('input[name=name2]').val(initName2);
		});
    	
    </script>
    </form>
</body>
</html>