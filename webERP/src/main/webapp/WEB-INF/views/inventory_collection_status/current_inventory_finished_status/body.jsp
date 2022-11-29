<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
window.onload = function(){
    l_sub3.style.display = "block";
      l_sub3.style.position = "relative";
      l_sub3.style.marginLeft = "10px";
 }
</script>
<style>
#contents1{
            position: absolute;
            padding: 10px;
            right: 0;
            top: 15%;
            width: 85%;
            height: 12%; 
            border: 1px solid black;
            z-index: 1;
        }
        
        #contents2{
            position: absolute;
            right: 0;
            top: 27%; 
            width: 85%;
            height: 68%; 
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
            /* position: absolute; 칸 모잘라서 지움*/
            top: 25%;
            left: 18%;
        }
        #view1,#view2{
            width: 100%;
            text-align: center;
            border: 1px solid black;
            
        }
        /* end default 밑으로 css 추가함*/
        .con1_search {
            margin: 10px;
        }        
        #contents2 {
            overflow: scroll;
        }
        

        /*탭구현 css임*/		
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
</style>
</head>
<body>
<container1 id = contents1>
                <form id="searchForm" method="get" action="${pageContext.request.contextPath }/member/curfinishedinvenstat.do">
            <table class="con1_search">
                <tr>
                    <td>품명</td>
                    <td style="width: 500px;">
                    	<input type="text" id="reqInput" name="type_name" style="width: 100%;" value="${type_name}"/>
                    </td>
                    <td>
                    <a href = "javascript:search1()"><i class="fas fa-search"  style="color: blue;"></i></a>
                    </td>
                </tr>
            </table>
            </form>
        </container1>
        <container2 id="contents2">
            <table id="view1">
                <thead>
                <tr>
                    <td><input type="checkbox" name="content" onclick="selectAll(this)"/></td>
                    <td>품번</td>
                    <td>품명</td>
                    <td>규격</td>
                    <td>단위</td>
                    <td>재고수량</td>
                 </tr>                 
                </thead>
                <tbody id="table1">
            <c:forEach var="item" items="${stockList}" varStatus="sts">
		        	<tr class="moveNum2">
                    <td><input type="checkbox" value = "check1" id="check" name="content"/></td>
                    <td><input type="text"  value= "${item.itemCode }" readonly/></td>
                    <td><input type="text"  value="${item.itemName }" readonly/></td>
                    <td><input type="text"  value= "${item.standard }"  readonly/></td>
                    <td><input type="text"  value="${item.inventoryUnit }"  readonly/></td>
                    <td><input type="text"  value= "${item.quantity }"  readonly/></td>
				</tr>
				</c:forEach>
                </tbody>
            </table>
        </container2>
	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>
	<script>
		var itemName = document.getElementById("itemName");

		function search1() {
			openWindowPop(
					'http://localhost:8090/webERP/member/finishedsearchtype.do',
					'type');
		}
		function openWindowPop(url, name) {
			var options = 'top=0, left=0, width=320, height=420, status=no, menubar=no, toolbar=no, resizable=no';
			window.open(url, name, options);
		}
		function setChildValue(code, name) {
			$('input[name=type_code]').val(code);
			$('input[name=type_name]').val(name);
		}

		view_button.onclick = function() {

				var searchForm = $('#searchForm');

				searchForm.submit();
			
		}
	</script>
</body>
</html>