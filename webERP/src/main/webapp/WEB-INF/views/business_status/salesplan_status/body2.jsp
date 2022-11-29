<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%> 
<%
	String inputNo = (String)request.getAttribute("inputNo");
	
%>
<% String parent = request.getParameter("item_code");%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:forEach var="item" items="${salesplan}"> 
	<c:set var="code" value="${item.item_code}"/>
	<c:set var="name" value="${item.item_name}"/>
</c:forEach>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

        #contents2{
            position: absolute;
            right: 0;
            top: 25%;
            width: 85%;
            height: 60%;
            border: 1px solid black;
            z-index: 1;
            overflow-x: scroll;
        }
        #contents3{
            position: absolute;
            right: 0;
            top: 85%;
            width: 85%;
            height: 5%;
            border: 1px solid black;
        }
        #view1{
            width: 210%;
            text-align: center;
            border: 1px solid black; 
            
        }
        #v_total1{
        width: 100%;
            text-align: center;
            border: 1px solid black;
        }
        #total1{
            width: 100%;
            position: absolute;
            bottom: 0;
        }
        #view2 td:not(.ch){
            width: 8%;
            font-size: 15px;
            font-weight: bold;
        }
        #view2 td input{
            width: 100%;
        }
        #view1 td:not(#non){
            width: 10%;
        }
        #view1 td input{
            width: 80%;
        }
        #view1 th{
            width: 5%;
        }

        #tab_div ul.tabs{
			margin: 0px;
			padding: 0px;
			list-style: none;
            
		}
		#tab_div ul.tabs li{
			background: none;
			color: black;
			display: inline-block;
			padding: 0;
			cursor: pointer;
            width: 60px;
            text-align: center;
            font-size: 13px;
		}


		#tab_div ul.tabs{
            
			margin: 0px;
			padding: 0px;
			list-style: none;
		}
		#tab_div ul.tabs li{
            
			background: none;
			color: black;
			display: inline-block;
			padding: 5px 5px;
			cursor: pointer;
            width: 80px;
            text-align: center;
            font-size: 12px;
		}


		#tab_div ul.tabs li.current{
			border-top: 2px solid skyblue;			
            background-color: #ddd;        
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
		}

		#tab_div .tab-content{
			display: none;	
			
		}

		#tab_div .tab-content.current{
			display: inherit;
		}  

</style>
</head>
<body>

        <container2 id="contents2">            
            <table id="view1">
                <thead id="things">
                    <!-- 품목별 -->
                    <th id="non"><input type="checkbox" name="content" onclick="selectAll(this)"/></th>
                    <th>품번</th>
                    <th>품명</th>
                    <th>규격</th>
                    <th>단위</th>
                    <th>연초수량</th>
                    <th>수정수량</th>
                    <th>차이수량</th>
                    <th>연초단가</th>
                    <th>수정단가</th>
                    <th>차이단가</th>
                </thead> 
                <tbody align="center">
                      <c:forEach var="item" items="${salesplan}" varStatus="status" > 
                    <td  class="ch" style="width: 5%;"><input type="checkbox" name="content"/></td>
                    <td><input type="text" value="${item.item_code}"readonly/></td>
                    <td><input type="text" value="${item.item_name}" readonly/></td>
                    <td><input type="text" value="${item.standard}" readonly/></td>
                    <td><input type="text" value="${item.inventory_unit}" readonly/></td>
                    <td><input type="text" value="${item.planquantity}" readonly/></td>
                    <td><input type="text" value="${item.newquantity}" readonly/></td>
                    <td><input type="text" value="${item.planquantity-item.newquantity}" readonly/></td>
                    <td><input type="text" value="${item.planprice}" readonly/></td>
                    <td><input type="text" value="${item.newprice}" readonly/></td>
                    <td><input type="text" value="${item.planprice-item.newprice}" readonly/></td>
                    </c:forEach>
                </tbody>      
              </table>
        </container2>
        <container3 id="contents3">
                    <div id="total1">
                <table id="v_total1">
                    <tr>
                        <td>연초수량합계</td>
                        <td>수정수량합계</td>
                        <td>차이수량합계</td>
                        <td>연초 합계액</td>
                        <td>수정 합계액</td>
                        <td>차이 합계액</td>
                    </tr>
                    <tr>
                    <c:forEach var="item" items="${salesplan}" varStatus="status" > 
                        <td><input type="text" value="${item.planquantity}" readonly/></td>
                        <td><input type="text" value="${item.newquantity}" readonly/></td>
                        <td><input type="text" value="${item.planquantity-item.newquantity}" readonly/></td>
                        <td><input type="text" value="${item.planquantity*item.planprice}" readonly/></td>
                        <td><input type="text" value="${item.newquantity*item.newprice}" readonly/></td>
                        <td><input type="text" value="${(item.planquantity*item.planprice)-(item.newquantity*item.newprice)}" readonly/></td>
                    </c:forEach>
                    </tr>
                </table>
            </div>
           </container3>
    <script src="http://code.jquery.com/jquery-latest.js"></script> <!--제이쿼리최신버젼가져옴-->
   <script type="text/javascript">
        $(document).ready(function(){
        
        $('ul.tabs li').click(function(){
            var tab_id = $(this).attr('data-tab');
    
            $('ul.tabs li').removeClass('current');
            $('.tab-content').removeClass('current');
    
            $(this).addClass('current');
            $("#"+tab_id).addClass('current');
        })
    
    });
    </script>
</body>
</html>