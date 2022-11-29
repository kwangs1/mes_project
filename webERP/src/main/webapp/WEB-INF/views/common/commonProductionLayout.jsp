<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"
 %>
 <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <c:set var="contextPath"  value="${pageContext.request.contextPath}" />
 <%@ page session="true" %>
<%
	String emp_code = (String)session.getAttribute("emp_code");
	String emp_name = (String)session.getAttribute("emp_name");
	String dep_code = (String)session.getAttribute("dep_code");
	String dep_name = (String)session.getAttribute("dep_name");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <title>Document</title>
    <style>
         *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        a{
            text-decoration: none;
            color: black;
        }
        #wrap{
            margin: 0 auto;
            border: 1px solid black;
            width: 1400px;
            height: 1000px;
            position: relative;
        }
        #header{
            margin: 0px;
            position: relative;
            left: 0;
            width: 100%;
            height: 10%;
            background-color:rgb(100, 161, 246);
        }
        #nav1{
            position: absolute;
            text-align: center;
            left: 0;
            top: 10%;
            width: 60%;
            height: 5%;
            
        }
        #nav2{
            position: absolute;
            left: 60%;
            width: 40%;
            height: 5%;
           
        }
        
        #footer{
            position: absolute;
            bottom: 0;
            width: 100%;
            height: 5%;
            border: 1px solid #ccc;
            background-color: #f5f5f5;
        }
        .logo{
            position: absolute;
            display: inline-block;
            height: 100%;
            width: 100px;
            left: 20px;
        }
        #info{
            position: absolute;
            left: 160px;
            display: inline-block;
            top: 8px;
            font-size: 15px;

        }
        #search{
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
        .search_button{
            position: absolute;
            width: 50px;
            height: 35px;
            top: 40px;
            right: 4%;
        }
        
        #nav1 ul{
            width: 100%; 
            margin: auto 0;
            z-index: 2;
            list-style: none;
            
            /* overflow: hidden; */
            
        }
        #nav #gnb{
            float: left;
            
        }
        #nav1 #gnb>li{
            float: left;
            width: 209.2px;
            height: 50px;
            text-align: center;
            list-style: none;
            
            position: relative;
            border: 1px solid #cccccc;
            background-color: #f5f5f5;
        }
        #nav1 #gnb>li>a{
            display: inline-block;
            margin-top: 12px;
        }
        #sub>li{
            list-style: none;
            float: left;
            /* display: block; */
            
            width: 20%;
            height: 100%;
            border: 1px solid #cccccc;
        }

        #nav1 #gnb #sub{
            position: absolute;
            top: 50px;
            background-color:#f5f5f5;
 
            width: 1398px;
            height: 28px;
            z-index: 4;
            display: none;
            text-align: center;
        }
        #sub>li a{
            display: inline-block;
            width: 100%;
 
        }

        #nav1 #gnb>li:hover #sub{
            display: block;
        }
        
        

        #nav2{
            background-color: #f5f5f5;
            border: #ccc;
        }
        #nav2 button{
            background-color: #f5f5f5;
            width: 24%;
            height: 50px;

            margin-left: 1px;
            padding: 0;
            border: 1px solid #ccc;
        }
        #nav2 button:hover{
            background-color: gray;
        }
        #etc_menu{
            position: absolute;
            right: 10px;
            top: 0;
        }
        #etc_menu li{
            list-style: none;
            display: inline-block;
            font-size: 5px;
            padding: 0;
        }
        #etc_menu li a{
            text-decoration: none;
        }
        .con1_search{
            padding:0;
            position: absolute;
            top: 25%;
            text-align: center;
            left: 17%;
        }
        #view1,#view2{
            width: 100%;
            text-align: center;
            border: 1px solid #ccc;
            
        }

        #view2 td{
            width: 5%;
        }
        #view2 td input{
            width: 100%;
        }
        #header li a, p{
            color: white;
        }
		#reqInput {
            background-color: rgb(255, 255, 149);
            text-align: center;
        }
        .btn1 {
	position: absolute;
	width: 50px;
	height: 35px;
	top: 40px;
	right: 4%;
}

    </style>    
</head>
<body>
    <div id=wrap>
        <header id = header>
            <a href="${contextPath }/main.do"><p><img src="${contextPath }/resources/img/kingdomlogo(3).png" class="logo"/></p></a>
			<p id=info>부서정보: <%=dep_name %> (<%=dep_code %>) 사원: <%=emp_name %> (<%=emp_code %>)</p>
            <ul id="etc_menu">
                <li><a href="${contextPath }/member/logout.do">로그아웃</a></li>
               <!--  <li><a href="#">기타메뉴1</a></li>
                <li><a href="#">기타메뉴2</a></li>
                <li><a href="#">기타메뉴3</a></li> -->
            </ul>
            <div id="search1" >
           <form name="frmSearch" action="${contextPath}/goods/searchGoods.do">
            <input name="searchWord" class="main_input" type="text" id="search"  onKeyUp="keywordSearch()"value = '메뉴 검색' style="text-align: left" />
            <input type="submit" name="search" class="btn1"  value="검 색" >
            </form>
            </div>
            <div id="suggest">
        <div id="suggestList"></div>
        </header>
        <nav id = nav1>
            <ul id="gnb">
                <li><a href="${contextPath }/member/systemmain.do">시스템관리</a>
                    <ul id="sub" >
                        <li><a href="#">회사등록정보</a></li>
                        <li><a href="#">기초정보관리</a></li>
                    </ul></li>
                <li><a href="${contextPath }/member/businessmain.do">영업관리</a>
                    <ul id="sub" style="left: -101%;">
                        <li><a href="#">영업관리</a></li>
                        <li><a href="#">영업현황</a></li>
                    </ul></li>
                <li><a href="${contextPath }/member/purchasemain.do">구매/자재관리</a>
                    <ul id="sub" style="left: -202%;">
                        <li><a href="#">구매관리</a></li>
                        <li><a href="#">재고관리</a></li>
                        <li><a href="#">재고수불현황</a></li>
                        <li><a href="#">기초정보관리</a></li>
                    </ul></li>
                <li><a href="${contextPath }/member/productionmain.do">생산관리공통</a>
                    <ul id="sub" style="left: -303%;">
                        <li><a href="#">생산관리</a></li>
                        <li><a href="#">외주관리</a></li>
                        <li><a href="#">기초정보관리</a></li>
                    </ul></li>
            </ul>
        </nav>
        <nav id="nav2">
            <button id="delete" onclick="deleteData()">삭제</button>
            <button id="view_button">조회</button>
            <button id="save" onClick="newRow();">저장</button>
            <button id="update" onClick="updateRow()">수정</button>
        </nav>
        <div>
            <tiles:insertAttribute name="side"/>
        </div>
        <div>
        	<tiles:insertAttribute name="body"/>
        </div>
        <footer id= footer>
            footer
        </footer>
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
            document.getElementById("search").value = '';
        }
        search_box.onblur = function(){
            document.getElementById("search").value = ' 메뉴 검색';
        }
        
        function selectAll(selectAll){
            const checkbox = document.getElementsByName('content');
            checkbox.forEach((checkbox) => {
                checkbox.checked = selectAll.checked;
            })
        }
        function openWindowPop(url, name){
            var options = 'top=0, left=0, width=320, height=420, status=no, menubar=no, toolbar=no, resizable=no';
            window.open(url, name, options);
        }
        
        function openWindowBroadPop(url, name){
            var options = 'top=0, left=0, width=1100, height=900, status=no, menubar=no, toolbar=no, resizable=no';
            window.open(url, name, options);
        }
 
    </script>
</body>
</html>