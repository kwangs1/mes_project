 <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>â��/����/���ְ�����Ȳ</title>
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
            top: 25%;
            width: 85%;
            height: 35%;
            border: 1px solid black;
            z-index: 1;
        }
        #contents3{
            position: absolute;
            right: 0;
            top:60%;
            width: 85%;
            height: 35%;
            border: 1px solid black;
            z-index: 1;
        }
        .con1_search{
            padding:0;
            text-align: center;
            position: absolute;
            top: 25%;
            left: 18%;
        }
        #view1,#view2{
            width: 100%;
            text-align: center;
            border: 1px solid black;
        }
      
        /* ----------------��ư-------------------- */
        #view2 td:not(.ch){
            width: 8%;
            font-size: 15px;
            font-weight: bold;
        }
        #view2 td input{
            width: 100%;
        }
        #view1 td:not(#non){
            width: 14.5%;
        }
        #view1 td input{
            width: 100%;
        }
        #view1 th{
            width: 4%;
        }

        ul.tabs{
            margin: 0px;
            padding: 0px;
            list-style: none;
        }
        ul.tabs li{
            background: none;
            color: black;
            display: inline-block;
            padding: 5px 5px;
            cursor: pointer;
            width: 80px;
            text-align: center;
            font-size: 12px;
        }
        ul.tabs li.current{
            border-top: 2px solid skyblue;			
            background-color: #ddd;        
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
        }
        .tab-content{
            display: none;
        }
        .tab-content.current{
            display: inherit;
        }
        input{
        	text-align:center;
        }
        .non {
			width: 5%;
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
		<container1 id = contents1>
			<form method="get" id="searchForm" class="tab-1 tab-content current">
	            <table class="con1_search" style="margin-left:15%;">
	                <tr>
	                </tr>
	            </table>
            </form>
            <form method="get" id="searchForm" class="tab-2 tab-content">
	            <table class="con1_search" style="margin-left:15%;">
	                <tr>
	                </tr>
	            </table>
	        </form>
            <form method="get" id="searchForm" class="tab-3 tab-content">
	            <table class="con1_search" style="margin-left:15%;">
	                <tr>
	                </tr>
	            </table>
	        </form>
            <div>
                <ul class="tabs" style="left:0px; bottom:0px; position: absolute;" >
                    <li class="tab-link current" data-tab="tab-1">â��/���</li>
                    <li class="tab-link" data-tab="tab-2">�������/<br>�۾���</li>
                    <li class="tab-link" data-tab="tab-3">���ְ���/<br>�۾���</li>
                </ul>
            </div>
        </container1>
        <container2 id="contents2">
        <div class="tab-1 tab-content current">     	
            <table id="view1"><!-- â��/��� ��1 -->    
                <thead>             
                    <th>â���ڵ�</th>
                    <th>â���</th>
                    <th>�԰�⺻��ġ</th>
                    <th>���⺻��ġ</th>
                    <th>â����</th>
                    <th>��뿩��</th>
                </thead>
                <c:forEach var="out" items="${houOutwareList}">
                <tbody>                
                    <td><input type="text" value="${out.house_Code }" readonly/></td>
                    <td><input type="text" value="${out.house_Name }" readonly/></td>
                    <td><input type="text" value="${out.house_Location_In }" readonly/></td>
                    <td><input type="text" value="${out.house_Location_Out }" readonly/></td>
                    <td><input type="text" value="${out.house_Explanation }" readonly/></td>
                    <td><input type="text" value="${out.house_Status }" readonly/></td>
                </tbody>
                </c:forEach>
                
            </table>
        </div>
        <div class="tab-2 tab-content">
            <table id="view1"><!-- �������/�۾��� ��2-->
                <thead>
                    <th>��������ڵ�</th>
                    <th>���������</th>
                    <th>�԰�⺻��ġ</th>
                    <th>���⺻��ġ</th>
                    <th>��������</th>
                    <th>��뿩��</th>
                </thead>
                <c:forEach var="out" items="${proOutwareList}">
                <tbody>
                    <td><input type="text" value="${out.process_Code }" readonly/></td>
                    <td><input type="text" value="${out.process_Name }" readonly/></td>
                    <td><input type="text" value="${out.process_Location_In }" readonly/></td>
                    <td><input type="text" value="${out.process_Location_Out }" readonly/></td>
                    <td><input type="text" value="${out.process_Explanation }" readonly/></td>
                    <td><input type="text" value="${out.process_Status }" readonly/></td>
                </tbody>
                </c:forEach>
            </table>
        </div>
        <div class="tab-3 tab-content">  
            <table id="view1"><!-- ���ְ���/�۾��� ��3 -->
                <thead>
                    <th>���ְ����ڵ�</th>
                    <th>���ְ�����</th>
                    <th>�԰�⺻��ġ</th>
                    <th>���⺻��ġ</th>
                    <th>���ְ�������</th>
                    <th>��뿩��</th>
                </thead>
                <c:forEach var="out" items="${outOutwareList}">
                <tbody>
                    <td><input type="text" value="${out.outsourcing_Code }" readonly/></td>
                    <td><input type="text" value="${out.outsourcing_Name }" readonly/></td>
                    <td><input type="text" value="${out.outsourcing_Location_In }" readonly/></td>
                    <td><input type="text" value="${out.outsourcing_Location_Out }" readonly/></td>
                    <td><input type="text" value="${out.outsourcing_Explanation }" readonly/></td>
                    <td><input type="text" value="${out.outsourcing_Status }" readonly/></td>
                </tbody>
                </c:forEach>
            </table>
        </div>
        </container2>
        <container3 id="contents3">
        <div class="tab-1 tab-content current">
            <table id="view2">
                <thead>
                    <th>��ġ�ڵ�</th>
                    <th>��ġ��</th>
                    <th>��ġ����</th>
                    <th>����� �ڵ�</th>
                    <th>����� �ŷ�ó��</th>
                    <th>���տ���</th>
                    <th>���������</th>
                    <th>��뿩��</th>
                </thead>
                <c:forEach var="houWor" items="${houWorOutwareList}">
                <tbody>
                    <td><input type="text" value="${houWor.location_Code }" readonly/></td>
                    <td><input type="text" value="${houWor.location_Name }" readonly/></td>
                    <td><input type="text" value="${houWor.location_Explanation }" readonly/></td>
                    <td><input type="text" value="${houWor.release_Code }" readonly/></td>
                    <td><input type="text" value="${houWor.release_Customer }" readonly/></td>
                    <td><input type="text" value="${houWor.suitability }" readonly/></td>
                    <td><input type="text" value="${houWor.availability }" readonly/></td>
                    <td><input type="text" value="${houWor.status }" readonly/></td>
                </tbody>
                </c:forEach>
            </table>
        </div>
        <div class="tab-2 tab-content">
            <table id="view2">
                <thead>
                    <th>�۾����ڵ�</th>
                    <th>�۾����</th>
                    <th>�۾��弳��</th>
                    <th>���տ���</th>
                    <th>��������</th>
                    <th>��뿩��</th>
                </thead>
                <c:forEach var="proWor" items="${proWorOutwareList}">
                <tbody>
                    <td><input type="text" value="${proWor.workplace_Code }" readonly/></td>
                    <td><input type="text" value="${proWor.workplace_Name }" readonly/></td>
                    <td><input type="text" value="${proWor.workplace_Explanation }" readonly/></td>
                    <td><input type="text" value="${proWor.process_Explanation }" readonly/></td>
                    <td><input type="text" value="${proWor.release_Customer }" readonly/></td>
                    <td><input type="text" value="${proWor.status }" readonly/></td>
                </tbody>
                </c:forEach>
            </table>
        </div>
        <div class="tab-3 tab-content">
            <table id="view2">
                <thead>
                    <th>�۾����ڵ�</th>
                    <th>���ְŷ�ó�ڵ�</th>
                    <th>�۾����</th>
                    <th>���ְŷ�ó��</th>
                    <th>�۾��弳��</th>
                    <th>���տ���</th>
                    <th>��뿩��</th>
                </thead>
                <c:forEach var="outWor" items="${outWorOutwareList}">
                <tbody>
                    <td><input type="text" value="${outWor.workplace_Code }" readonly/></td>
                    <td><input type="text" value="${outWor.outcustomer }" readonly/></td>
                    <td><input type="text" value="${outWor.workplace_Name }" readonly/></td>
                    <td><input type="text" value="${outWor.outcustomer_Name }" readonly/></td>
                    <td><input type="text" value="${outWor.workplace_Explanation }" readonly/></td>
                    <td><input type="text" value="${outWor.suitability }" readonly/></td>
                    <td><input type="text" value="${outWor.status }" readonly/></td>
                </tbody>
                </c:forEach>
            </table>
        </div>
        </container3>
        <script src="http://code.jquery.com/jquery-latest.js"></script> <!--���������ֽŹ���������-->
    	<script>
        	$(document).ready(function(){
        
	        	$('ul.tabs li').click(function(){
	            	var tab_id = $(this).attr('data-tab');
	    
	            	$('ul.tabs li').removeClass('current');
	            	$('.tab-content').removeClass('current');
	    
	            	$(this).addClass('current');
	            	$("."+tab_id).addClass('current');
	       	 	})
    
    		})
    		
    		document.getElementById("delete").removeEventListener();
    		document.getElementById("view_button").removeEventListener();
    		document.getElementById("save").removeEventListener();
    		document.getElementById("update").removeEventListener();
    		
    		
        	
    </script>
</body>
</html>