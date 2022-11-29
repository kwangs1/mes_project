<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>
<%
	String emp_code = (String)session.getAttribute("emp_code");
	String emp_name = (String)session.getAttribute("emp_name");
	String dep_code = (String)session.getAttribute("dep_code");
	String dep_name = (String)session.getAttribute("dep_name");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<title>Document</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

a {
	text-decoration: none;
	color: black;
}

#wrap {
	margin: 0 auto;
	border: 1px solid black;
	width: 1400px;
	height: 1000px;
	position: relative;
}

#header {
	margin: 0px;
	position: relative;
	left: 0;
	width: 100%;
	height: 10%;
	background-color: rgb(100, 161, 246);
}

#nav1 {
	position: absolute;
	text-align: center;
	left: 0;
	top: 10%;
	width: 60%;
	height: 5%;
}

#nav2 {
	position: absolute;
	left: 60%;
	width: 40%;
	height: 5%;
}

#footer {
	position: absolute;
	bottom: 0;
	width: 100%;
	height: 5%;
	border: 1px solid #ccc;
	background-color: #f5f5f5;
}

.logo {
	position: absolute;
	display: inline-block;
	height: 100%;
	width: 100px;
	left: 20px;
}

#info {
	position: absolute;
	left: 160px;
	display: inline-block;
	top: 8px;
	font-size: 15px;
}

#search {
	display: inline-block;
	position: absolute;
	font-size: 24px;
	color: gray;
	top: 40px;
	left: 160px;
	width: 80%;
	height: 35px;
	margin-bottom: 10px;
}
#suggest{
display:inline-block; 
position: absolute; 
font-size: 24px;
width: 80%;
top: 75px;
left: 160px;
margin-bottom: 10px;
border: 0.1px  solid #87cb42;
 z-index:3;
 font-weight: bold;
 background-color:#ffffff; 	
	}

.btn1 {
	position: absolute;
	width: 50px;
	height: 35px;
	top: 40px;
	right: 4%;
}

#nav1 ul {
	width: 100%;
	margin: auto 0;
	z-index: 2;
	list-style: none;

	/* overflow: hidden; */
}

#nav #gnb {
	float: left;
}

#nav1 #gnb>li {
	float: left;
	width: 209.2px;
	height: 50px;
	text-align: center;
	list-style: none;
	position: relative;
	border: 1px solid #cccccc;
	background-color: #f5f5f5;
}

#nav1 #gnb>li>a {
	display: inline-block;
	margin-top: 12px;
}

#sub>li {
	list-style: none;
	float: left;
	/* display: block; */
	width: 20%;
	height: 100%;
	border: 1px solid #cccccc;
}

#nav1 #gnb #sub {
	position: absolute;
	top: 50px;
	background-color: #f5f5f5;
	width: 1398px;
	height: 28px;
	z-index: 4;
	display: none;
	text-align: center;
}

#sub>li a {
	display: inline-block;
	width: 100%;
}

#nav1 #gnb>li:hover #sub {
	display: block;
}

#nav2 {
	background-color: #f5f5f5;
	border: #ccc;
}

#nav2 button {
	background-color: #f5f5f5;
	width: 24%;
	height: 50px;
	margin-left: 1px;
	padding: 0;
	border: 1px solid #ccc;
}

#nav2 button:hover {
	background-color: gray;
}

#etc_menu {
	position: absolute;
	right: 10px;
	top: 0;
}

#etc_menu li {
	list-style: none;
	display: inline-block;
	font-size: 5px;
	padding: 0;
}

#etc_menu li a {
	text-decoration: none;
}

.con1_search {
	padding: 0;
	position: absolute;
	top: 25%;
	text-align: center;
	left: 17%;
}

#view1, #view2 {
	width: 100%;
	text-align: center;
	border: 1px solid #ccc;
}

#view2 td {
	width: 5%;
}

#view2 td input {
	width: 100%;
}

#header li a, p {
	color: white;
}

#reqInput {
	background-color: rgb(255, 255, 149);
	text-align: center;
}

input {
	text-align: center;
}


</style>
</head>
<body>
	<div id=wrap>
		<header id=header>
			<a href="${contextPath }/main.do"><p><img src="${contextPath }/resources/img/kingdomlogo(3).png" class="logo"/></p></a>
			<p id=info>부서정보: <%=dep_name %> (<%=dep_code %>) 사원: <%=emp_name %> (<%=emp_code %>)</p>
			<ul id="etc_menu">
				<li><a href="${contextPath }/member/logout.do">로그아웃</a></li>
				<!-- <li><a href="#">기타메뉴1</a></li>
				<li><a href="#">기타메뉴2</a></li>
				<li><a href="#">기타메뉴3</a></li> -->
			</ul>
			<div id="search1">
				<form name="frmSearch" action="${contextPath}/member/searchmenu.do">
					<input name="searchWord" class="main_input" id="search" type="text"
						style="text-align: left" value = ' 메뉴 검색'> <input type="submit"
						name="search" class="btn1" value="검 색">
				</form>
			</div>
			<div id="suggest">
				<div id="suggestList"></div>
			</div>
		</header>
		<nav id=nav1>
			<ul id="gnb">
				<li><a href="${contextPath }/member/systemmain.do">시스템관리</a>
					<ul id="sub">
						<li><a href="#">회사등록정보</a></li>
						<li><a href="#">기초정보관리</a></li>
					</ul></li>
				<li><a
					href="${contextPath }/member/businessmain.do">영업관리</a>
					<ul id="sub" style="left: -101%;">
						<li><a href="#">영업관리</a></li>
						<li><a href="#">영업현황</a></li>
					</ul></li>
				<li><a
					href="${contextPath }/member/purchasemain.do">구매/자재관리</a>
					<ul id="sub" style="left: -202%;">
						<li><a href="#">구매관리</a></li>
						<li><a href="#">재고관리</a></li>
						<li><a href="#">재고수불현황</a></li>
						<li><a href="#">기초정보관리</a></li>
					</ul></li>
				<li><a
					href="${contextPath }/member/productionmain.do">생산관리공통</a>
					<ul id="sub" style="left: -303%;">
						<li><a href="#">생산관리</a></li>
						<li><a href="#">외주관리</a></li>
						<li><a href="#">기초정보관리</a></li>
					</ul></li>
			</ul>
		</nav>
		<nav id="nav2">
			<button id="delete" onclick="deleteData()">삭제</button>
			<button id="view_button" onclick="searchData()">조회</button>
			<button id="save" onclick="newRow()">저장</button>
			<button id="update" onclick="updateRow()">수정</button>
		</nav>
		<div>
			<tiles:insertAttribute name="side" />
		</div>
		<div>
			<tiles:insertAttribute name="body" />
		</div>
		<footer id=footer> footer </footer>
	</div>
    <script>
        var side_button1 = document.getElementById('side1');
        var side_button2 = document.getElementById('side2');
        var side_button3 = document.getElementById('side3');
        var side_button4 = document.getElementById('side4');
        var search_box = document.getElementById('search');
        var num_box = document.getElementById('num');
        var save_button = document.getElementById('save');
        var delete_button = document.getElementById('delete');
        var update_button = document.getElementById('update');
        var view_button = document.getElementById('view_button');
        var itemcode = document.getElementById('itemcode');
        
        search_box.onfocus = function(){
        	if(document.getElementById("search").value == ' 메뉴 검색'){
            document.getElementById("search").value = '';
        	}
        }
        search_box.onblur = function(){
        	if(document.getElementById("search").value == ''){
            document.getElementById("search").value = ' 메뉴 검색';
        	}
        }
        
        function selectAll(selectAll){
            const checkbox = document.getElementsByName('content');
            checkbox.forEach((checkbox) => {
                checkbox.checked = selectAll.checked;
            })
        }
		</script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
	var loopSearch=true;
		$('#search').keyup(function(){
			if(loopSearch==false)
				return;
		var value=$('#search').val();
		$.ajax({
			type : 'GET',
			async : true, //false인 경우 동기식으로 처리한다.
			url : '/webERP/member/keywordSearch.do',
			data : { "keyword" : value },
			success : function(data, textStatus) {
				
				var jsonInfo = data.keywordList;
			    //var jsonInfo = JSON.parse(data);
				//displayResult(jsonInfo);
				$("#suggestList").empty();
				for(var i = 0 ; i<jsonInfo.length ; i++){
					var str = '';
						str += 	'<tr align="center" id = "yahoo">';
						str +=  '<td><a href = "#">'+ jsonInfo[i].menu + '</a></td>';  
						str +=  '<td><input type = "hidden" id="iCode" name ="iCode" value = "'+jsonInfo[i].menu+'"></td>';  
						str +=	'</tr>';
						//반복문을 사용하여 searchItem table에 추가
					$("#suggestList").append(str);
					}
				show('suggest');
				
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
				
			}
		}); //end ajax	
	});
	
	$(document).on("click", "#yahoo", function (e){
		var initCode = 	$(this).find('input[id=iCode]').val();	
		$('input[name=searchWord]').val(initCode);
		 hide('suggest');
	});
		
	function show(elementId) {
		 var element = document.getElementById(elementId);
		 if(element) {
		  element.style.display = 'block';
		 }
		}
	
	function hide(elementId){
	   var element = document.getElementById(elementId);
	   if(element){
		  element.style.display = 'none'; 
	   }
	}
	
        
    </script>
</body>
</html>