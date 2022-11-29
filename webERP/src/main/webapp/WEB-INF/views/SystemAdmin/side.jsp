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
                    <li><a href="#"  id="side1">회사등록정보</a>
                        <ul id="l_sub1">
                            <li><a href="${contextPath }/member/regcompany.do">회사등록</a></li>
                            <li><a href="${contextPath }/member/regbusiness.do">사업장등록</a></li>
                            <li><a href="${contextPath }/member/regdepartment.do">부서등록</a></li>
                            <li><a href="${contextPath }/member/inquiryemployees.do">사원조회</a></li>
                        </ul></li>
                    <li><a href="#" id="side2">기초정보관리</a>
                        <ul id="l_sub2">
                            <li><a href="${contextPath }/member/regbasicacc.do">일반거래처등록</a></li>
                            <li><a href="${contextPath }/member/regitemgroup.do">품목군등록</a></li>
                            <li><a href="${contextPath }/member/regitem.do">품목등록</a></li>
                            <li><a href="${contextPath }/member/outware.do">창고/공정/외주공정현황</a></li>
                            <li><a href="${contextPath }/member/logistics_manage.do">물류관리내역등록</a></li>
                            <%-- <li><a href="${contextPath }/member/logperbusi.do">물류실적담당자등록(거래차)</a></li>
                            <li><a href="${contextPath }/member/logperitem.do">물류실적담당자등록(품목)</a></li> --%>
                            <li><a href="${contextPath }/member/reginspection.do">검사유형등록</a></li>
                            <li><a href="${contextPath }/member/regsetcom.do">SET구성품등록</a></li>
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