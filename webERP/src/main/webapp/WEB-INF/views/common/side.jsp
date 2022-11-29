<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>

<html>
<head>
 <style>
   #sidemenu{
   			margin-top:30px;
            position: absolute;
            top: 15%;
            height: 80%;
            width: 14.9%;
            background-color: #f5f5f5;
            z-index: 3;
        }
         #s_nav #lnb li{
            list-style: none;
        }
        #s_nav #lnb li #side1,#side2,#side3,#side4{
        	
            display: block;
            border: 1px solid #cccccc;
            background-color: #f5f5f5;
        }
        #s_nav #lnb #l_sub1,#l_sub2,#l_sub3,#l_sub4{
            border-style: none;
            display: none;
            
        }
 </style>
  <meta charset="UTF-8">
  <title>사이드 메뉴</title>
</head>
<body>
<aside id = sidemenu>
            <div id="s_nav">
                <ul id="lnb">
                    <li ><a href="#"  id="side1" >영업관리</a>
                        <ul id="l_sub1">
                            <li><a href="#">판매계획등록</a></li>
                            <li><a href="#">견적등록</a></li>
                            <li><a href="#">수주등록</a></li>
                            <li><a href="#">출고의뢰등록</a></li>
                            <li><a href="#">출고처리</a></li>
                            <li><a href="#">거래명세서발행</a></li>
                        </ul></li>
                    <li><a href="#" id="side2">영업현황</a>
                        <ul id="l_sub2">
                            <li><a href="#">견적현황</a></li>
                            <li><a href="#">판매계획현황</a></li>
                            <li><a href="#">판매계획대비출고현황</a></li>
                            <li><a href="#">견적대비수주현황</a></li>
                            <li><a href="#">수주현황</a></li>
                            <li><a href="#">수주대비출고현황</a></li>
                            <li><a href="#">출고현황</a></li>
                            <li><a href="#">출고반품현황</a></li>
                        </ul></li>
                </ul>
            </div>
        </aside>
		<script type="text/javascript">
		var side_button1 = document.getElementById('side1');
        var side_button2 = document.getElementById('side2');
		side_button1.onclick = function(){
            var l_sub1 = document.getElementById('l_sub1');
            if(l_sub1.style.display == 'none' || l_sub1.style.display==''){
            l_sub1.style.display = "block";
            l_sub1.style.position = "relative";
            l_sub1.style.marginLeft = "10px";
            }
            else{
                l_sub1.style.display = "none";
            }
        }
        side_button2.onclick = function(){
            var l_sub2 = document.getElementById('l_sub2');
            if(l_sub2.style.display == 'none' || l_sub2.style.display==''){
            l_sub2.style.display = "block";
            l_sub2.style.position = "relative";
            l_sub2.style.marginLeft = "10px";
            }
            else{
                l_sub2.style.display = "none";
            }
        }
		</script>
</body>
</html>