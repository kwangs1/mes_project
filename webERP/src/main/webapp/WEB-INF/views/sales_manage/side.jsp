<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"    
    isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	#sidemenu{
   			margin-top:2%;
            position: absolute;
            top: 15%;
            height: 77%;
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
</head>
<body>
<aside id = sidemenu>
            <div id="s_nav">
                <ul id="lnb">
                    <li><a href="#" id="side1">영업관리</a>
                        <ul id="l_sub1">
                            <li><a href="${contextPath }/member/regsalesplan.do">판매계획등록</a></li>
                            <%-- <li><a href="${contextPath }/member/regestimate.do">견적등록</a></li> --%>
                            <li><a href="${contextPath }/member/regorder.do#">수주등록</a></li>
                            <%-- <li><a href="${contextPath }/member/regforreq.do#">출고의뢰등록</a></li> --%>
                            <li><a href="${contextPath }/member/forwarding.do">출고처리</a></li>
                           <%--  <li><a href="${contextPath }/member/transactionissue.do">거래명세서발행</a></li> --%>
                        </ul></li>
                    <li><a href="#" id="side2">영업현황</a>
                        <ul id="l_sub2">
                            <%-- <li><a href="${contextPath }/member/quotationstatus.do">견적현황</a></li> --%>
                             <li><a href="${contextPath }/member/salesplanstat.do">판매계획현황</a></li>
                            <%--<li><a href="${contextPath }/member/salesplancont.do">판매계획대비출고현황</a></li>
                            <li><a href="${contextPath }/member/quotationcont.do">견적대비수주현황</a></li> --%>
                            <li><a href="${contextPath }/member/orderstat.do">수주현황</a></li>
                            <li><a href="${contextPath }/member/releasestat.do">출고현황</a></li>
                            <%-- <li><a href="${contextPath }/member/ordercontrast.do">수주대비출고현황</a></li>
                            <li><a href="${contextPath }/member/relreturnstat.do">출고반품현황</a></li> --%>
                        </ul></li>
                </ul>
            </div>
        </aside>
        <script>
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