<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	#sidemenu{
			margin-top:2%;
            position: absolute;
            top: 14.2%;
            height: 80.8%;
            width: 15%;
            border: 1px solid black;
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
</head>
<body>
<aside id = sidemenu>
            <div id="s_nav">
                <ul id="lnb">
                    <li><a href="#"  id="side1">구매관리</a>
                        <ul id="l_sub1">
                            <li><a href="http://localhost:8090/webERP/member/mainplan.do#">주계획작성</a></li>
                            <li><a href="http://localhost:8090/webERP/member/requiredamount.do#">소요량전개</a></li>
                            <li><a href="http://localhost:8090/webERP/member/regbilling.do#">청구등록</a></li>
                            <li><a href="http://localhost:8090/webERP/member/regordering.do#">발주등록</a></li>
                            <li><a href="http://localhost:8090/webERP/member/regreceivereq.do#">입고의뢰등록</a></li>
                            <li><a href="http://localhost:8090/webERP/member/regreceiveins.do#">입고검사등록</a></li>
                            <li><a href="http://localhost:8090/webERP/member/receiveprocess.do#">입고처리</a></li>
                            <li><a href="http://localhost:8090/webERP/member/orderclosing.do#">발주마감처리</a></li>
                            <li><a href="http://localhost:8090/webERP/member/purchaseclosing.do#">매입마감</a></li>
                        </ul></li>
                    <li><a href="#" id="side2">재고관리</a>
                        <ul id="l_sub2">
                            <li><a href="http://localhost:8090/webERP/member/moveware.do#">재고이동등록(창고)</a></li>
                            <li><a href="http://localhost:8090/webERP/member/movebusiness.do#">재고이동등록(사업장)</a></li>
                            <li><a href="http://localhost:8090/webERP/member/baseinventory.do#">기초재고/재고조정등록</a></li>
                            <li><a href="http://localhost:8090/webERP/member/baseinventorystat.do#">기초재고/재고조정현황</a></li>
                            <li><a href="http://localhost:8090/webERP/member/supplyadj.do#">SET품수불조정등록</a></li>
                            <li><a href="http://localhost:8090/webERP/member/supplyadjstat.do#">SET품수불조정현황</a></li>
                        </ul></li>
                    <li><a href="#" id="side3">재고수불현황</a>
                        <ul id="l_sub3">
                            <li><a href="http://localhost:8090/webERP/member/curinvenstat.do#">현재고현황</a></li>
                            <li><a href="http://localhost:8090/webERP/member/supplystat.do#">재고수불현황(일자,유형별)</a></li>
                            <li><a href="http://localhost:8090/webERP/member/lotbusiness.do#">현재고(LOT)현황(전사,사업장)</a></li>
                            <li><a href="http://localhost:8090/webERP/member/lotware.do#">현재고(LOT)현황(창고,장소)</a></li>
                        </ul></li>
                    <li><a href="#" id="side4">기초정보관리</a>
                        <ul id="l_sub4">
                            <li><a href="http://localhost:8090/webERP/member/itemunitprice.do#">품목단가등록</a></li>
                        </ul></li>
                </ul>
            </div>
        </aside>
        <script>
        var side_button1 = document.getElementById('side1');
        var side_button2 = document.getElementById('side2');
        var side_button3 = document.getElementById('side3');
        var side_button4 = document.getElementById('side4');
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
        side_button3.onclick = function(){
            var l_sub3 = document.getElementById('l_sub3');
            if(l_sub3.style.display == 'none' || l_sub3.style.display==''){
            l_sub3.style.display = "block";
            l_sub3.style.position = "relative";
            l_sub3.style.marginLeft = "10px";
            }
            else{
                l_sub3.style.display = "none";
            }
        }
        side_button4.onclick = function(){
            var l_sub = document.getElementById('l_sub4');
            if(l_sub4.style.display == 'none' || l_sub4.style.display==''){
            l_sub4.style.display = "block";
            l_sub4.style.position = "relative";
            l_sub4.style.marginLeft = "10px";
            }
            else{
                l_sub4.style.display = "none";
            }
        }
        
    </script>
</body>
</html>