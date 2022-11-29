<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>Insert title here</title>
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
            /* position: absolute; 칸 모잘라서 지움*/
            top: 25%;
            left: 5%;
        }
        #workOrderDetail{
            height: 100%;
            overflow: scroll;
        }
        #workOrderInfo {
            height: 100%;
            width: 100%;
            overflow: scroll;
        }

</style>
<script>
	window.onload = function(){
		l_sub1.style.display = "block";
        l_sub1.style.position = "relative";
        l_sub1.style.marginLeft = "10px";
	}
</script>
</head>
<body>
<container1 id = contents1>
            <form id="searchForm">
                <table class="con1_search">
                    <tr>
                        <td>사업장</td>
                        <td style="width: 80px;"><input type="text" value="${param.factoryNumber }" style="width: 100%; background-color: yellow;"/></td>
                        <td colspan="3"><input type="text" value="${param.factoryName }" disabled style="width: 100%;"/></td>
                        <td><a href="javascript:search1()"><i class="fas fa-search" style="color: blue;"></i></td> 
    
                        <td colspan="5" style="width: 80px;">부서</td>
                        <td style="width: 80px;"><input type="text" value="${param.departmentCode }" style="width: 100%; background-color: yellow;"/></td>
                        <td><input type="text" value="${param.departmentName }" disabled/></td>
                        <td><a href="javascript:search2()"><i class="fas fa-search" style="color: blue;"></i></td>
                        
                    </tr>
                    
                    <tr>
                        <td>지시기간</td>
                        <td colspan="2" style="width: 50px;"><input type="date" id='searchStartDate' style="width: 100%;"/></td>
                        <td>~</td>
                        <td ><input type="date" id='searchEndDate' style="width: 100%;"/></td>
                        <td></td>
    
                        <td colspan="5" style="width: 80px;">사원</td>
                        <td style="width: 80px;"><input type="text" style="width: 100%; background-color: yellow;"/></td>
                        <td><input type="text" name="" disabled/></td>
                        <td > <i class="fas fa-search" style="color: blue;"></i></td>
                        <td>
                            <input type="button" value="자재출고" onClick="release()" style="padding: 5px; margin-left: 30px;"></input>
                        </td>
                        <td>
                            <input type="button" value="취소" onClick="revert();" style="padding: 5px;"></input>
                        </td>
                        <td>
                            <input type="button" value="확정" onClick="confirm();" style="padding: 5px;"></input>
                        </td>
                    </tr>
                </table>
                </form>
            </table>
        </container1>
        <container2 id="contents2">
            <div id="workOrderDetail">
            <form id="dataForm" mehtod="get" commandName="ListVO">
                <table id="workOrderDetailTable">
                    <thead>
                        <td><input type="checkbox" name="content" onclick="selectAll(this)"/></td>
                        <td>작업지시번호</td>
                        <td>자재출고상태</td>
                        <td>작업장</td>
                        <td>지시일</td>
                        <td>납기일</td>
                        <td>품번</td>
                        <td>품명</td>
                        <td>규격</td>
                        <td>단위</td>
                        <td>지시수량</td>
                        <td>상태</td>
                        <td>검사</td>
                        <td>생산설비</td>
                        <td>작업팀</td>
                        <td>비고</td>
                    </thead>
                    <!-- 테스트용 데이터, 추후 표현식으로 수정필요 -->
                    <tbody>
                    <c:forEach var="info" items="${infoList}" varStatus="status"> 
                    <tr id="updateData" align="center">
                        <td><input type="checkbox" id="workOrderNumber" value="${info.workOrderNumber }" name="content"/></td>
                        <td><input type="text" name="ListVO[${status.index }].workOrderNubmer" value="${info.workOrderNumber}" readonly /></td>
                        <td><input type="text" name="ListVO[${status.index }].materialstatus" value="${info.materialstatus}" readonly/></td>
                        <td><input type="text" name="ListVO[${status.index }].workplaceCode" value="${info.workplaceCode}" readonly/></td>
                        <td><input type="date" name="ListVO[${status.index }].instructiondate" value="${info.instructionDate}" readonly/></td>
                        <td><input type="date" name="ListVO[${status.index }].dueDate" value="${info.dueDate}" readonly/></td>
                        <td><input type="text" name="ListVO[${status.index }].itemCode" value="${info.itemCode }" readonly/></td>
                        <td><input type="text" name="ListVO[${status.index }].itemName" value="${info.itemName}" readonly/></td>
                        <td><input type="text" name="ListVO[${status.index }].standard" value="${info.standard}" readonly/></td>
                        <td><input type="text" name="ListVO[${status.index }].inventoryUnit" value="${info.inventoryUnit}" readonly/></td>
                        <td><input type="text" name="ListVO[${status.index }].indicated" value="${info.indicated}"/></td>
                        <td><input type="text" name="ListVO[${status.index }].status" value="${info.status}" readonly/></td>
                        <td><input type="text" name="ListVO[${status.index }].inspection" value="${info.inspection}" readonly/></td>
                        <td><input type="text" name="ListVO[${status.index }].productionFacility" value="${info.productionFacility}" readonly/></td>
                        <td><input type="text" name="ListVO[${status.index }].taskTeam" value="${info.taskTeam}" readonly/></td>
                        <td><input type="text" name="ListVO[${status.index }].note" value="${info.note}" readonly/></td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
                </form>
            </div>
        </container2>
        <container3 id="contents3">
            <div id="workOrderInfo">
            <form id="detailForm" mehtod="get" commandName="DetailVO">
                <table id="workOrderTable">
                    <thead>        
                    	<td> </td>               
                        <td>청구일</td>
                        <td>품번</td>
                        <td>품명</td>
                        <td>규격</td>
                        <td>단위</td>
                        <td>정미수량</td>
                        <td>LOSS</td>
                        <td>확정수량</td>                     
                        <td>비고</td>
                    </thead>
                    <!-- 테스트용 데이터, 추후 표현식으로 수정필요 -->
                    <tbody>
  					<c:forEach var="detail" items="${detailList}" varStatus="status">
  					 <tr>
  					 	<td><input type="checkbox" value="${detail.forwardingNumber }" name="content2"/></td>
                        <td><input type="date" name="DetailVO[${status.index }].billingDate" value="${detail.billingDate }" readonly /></td>
                        <td><input type="text" name="DetailVO[${status.index }].itemCode" value="${detail.itemCode }" /></td>
                        <td><input type="text" name="DetailVO[${status.index }].itemName" value="${detail.itemName}"/></td>
                        <td><input type="text" name="DetailVO[${status.index }].standard" value="${detail.standard}"/></td>
                        <td><input type="text" name="DetailVO[${status.index }].inventoryUnit" value="${detail.inventoryUnit}"/></td>
                        <td><input type="text" name="DetailVO[${status.index }].precisionQuantity" value="${detail.precisionQuantity}"/></td>
                        <td><input type="text" name="DetailVO[${status.index }].loss" value="${detail.loss}"/></td>
                        <td><input type="text" name="DetailVO[${status.index }].forwardingQuantity" value="${detail.comfirmQuantity}"/></td>                        
                        <td><input type="text" name="DetailVO[${status.index }].note" value="${detail.note}"/></td>
                        <td><input type="hidden" name="DetailVO[${status.index }].forwardingNumber"value="${detail.forwardingNumber }" /></td>
  					 </tr>
                    </c:forEach>              
                  
                    </tbody>
                </table>
                </form>
            </div>
        </container3>
<script>
 /* 검색부 date onChange 함수 설정 */
 		var startDate = "";
    	var endDate = "";
    	var workOrderNumber = document.getElementById("workOrderNumber").value;
    	
    	function isEmpty(str){
   	     
   	     if(typeof str == "undefined" || str == null || str == "")
   	         return true;
   	     
   	     else
   	         return false ;
   	     
   	 	}
    	
    	$('#searchStartDate').change(function (){
            var date = $('#searchStartDate').val();
            startDate = date;
        });
    	$('#searchEndDate').change(function (){
            var date = $('#searchEndDate').val();
            endDate = date;
        });
    	
      function search1(){  
    	  openWindowPop('http://localhost:8090/webERP/member/factorySearch.do','factorySearch');  	  
      }
      function search2(){  
	      openWindowPop('http://localhost:8090/webERP/member/departmentSearch.do','departmentSearch');  	  
		}
      
  
      /* 조회버튼 클릭시 기능 구현 */
      view_button.onclick = function(){
		 if(startDate>endDate){
			  alert("지시기간 종료일은 시작일보다 작을수 없습니다.");
		  } else{
			  
		var item = document.getElementsByName("content").length;
	    var no = "";
	    var ary = [];
	    for(var i=0; i<item;i++){
	    	if(document.getElementsByName("content")[i].checked==true){
	      		no = document.getElementsByName("content")[i].value;
	      		ary.push(no);
	      	  }
	     }
	      
    	  const URLSearch = new URLSearchParams(location.search);
		  URLSearch.set('startDate', startDate);
		  URLSearch.set('endDate', endDate);
		  URLSearch.set('searchNumber', ary);
		  const newParam = URLSearch.toString();

		  window.open(location.pathname + '?' + newParam, '_self');
		  }
  	}
      
      /* 저장 버튼 기능 구현 */
      
        function newRow(){
          // dao에서 저장
    	 
        	var row = workOrderTable.insertRow(); 
          	const URLSearch = new URLSearchParams(location.search);
		 	const newParam = URLSearch.toString();
			var link = location.pathname +'?'+newParam;
  			var linkPath = document.createElement("input");
  		    linkPath.setAttribute("type","hidden");
  		    linkPath.setAttribute("name","path");
  		    linkPath.setAttribute("value", link);
  		    alert("저장 버튼은 사용하실 수 없습니다!");
  		    /*
	  		  var is_empty = false; //변수 is_empty로 조건문의 분기를 만듬
	      	$('#detailForm').find('input[type!="hidden"]').each(function(){//값이 비어있는지 체크하는 제이쿼리
	      	    if(!$(this).val()) { //#reg_gen_account는 form태그의 id값임
	      	    	is_empty = true;      	    	
	      	    }      	 
	      	});   
	      	if(is_empty) { //비어있는내용이 있는지 체크함
	      	    alert('비어있는 내용이 있습니다. 다시입력하세요!');
	      	}
	      	else{

  		    document.getElementById('detailForm').appendChild(linkPath);
            document.getElementById('detailForm').action = "${contextPath}/member/addOperationInstruction.do";
  			document.getElementById('detailForm').submit();  
  			alert('저장되었습니다'); 
        	}   
	      	*/
      }
      
        function updateRow() {
        	var row = workOrderTable.insertRow(); 
        	const URLSearch = new URLSearchParams(location.search);
        	const newParam = URLSearch.toString();
  		 	var link = location.pathname +'?'+newParam;
    		var linkPath = document.createElement("input");
    		linkPath.setAttribute("type","hidden");
    		linkPath.setAttribute("name","path");
    		linkPath.setAttribute("value", link);
    		var is_empty = false; //변수 is_empty로 조건문의 분기를 만듬
        	$('#dataForm').find('input[type!="hidden"]').each(function(){//값이 비어있는지 체크하는 제이쿼리
        	    if(!$(this).val()) { //#reg_gen_account는 form태그의 id값임
        	    	is_empty = true;      	    	
        	    }      	 
        	});   
        	if(is_empty) { //비어있는내용이 있는지 체크함
        	    alert('비어있는 내용이 있습니다. 다시입력하세요!');
        	}
        	else{
  		    	document.getElementById('dataForm').appendChild(linkPath);
            	document.getElementById('dataForm').action = "${contextPath}/member/updateOperationInstruction.do";
    			document.getElementById('dataForm').submit();  
	    		alert('수정되었습니다'); 
        	}      	
    		
    	 
        }
        
      
        function deleteData() {
        	var row = workOrderTable.insertRow(); 
        	const URLSearch = new URLSearchParams(location.search);
        	const newParam = URLSearch.toString();
  		 	var link = location.pathname +'?'+newParam;
    		var linkPath = document.createElement("input");
    		linkPath.setAttribute("type","hidden");
    		linkPath.setAttribute("name","path");
    		linkPath.setAttribute("value", link);
    		
        		if(URLSearch.has('searchNumber')===true){
	  		    document.getElementById('detailForm').append(linkPath);
	            document.getElementById('detailForm').action = "${contextPath}/member/deleteCommitOperation.do";
	    		document.getElementById('detailForm').submit();  
	    		alert('삭제되었습니다'); 
        		}else{
        			alert("null");
        		window.history.back();
        		}

        }
        
        function confirm() {
        	var item = document.getElementsByName("content").length;
        	  var no = "";
        	  var ary = [];
        	  for(var i=0; i<item;i++){
        		  if(document.getElementsByName("content")[i].checked==true){
        			  no = document.getElementsByName("content")[i].value;
        			  ary.push(no);
        		  }
        	  }
  	      	if(ary.length === 0 || ary === null){ //체크박스가 아무것도 체크되지 않았을때
				alert('확정할 목록의 체크박스를 선택해주세요');
				//window.history.back();
			}
	    	else {//컨트롤러로 해당목록의 no값을 보낸다
        			window.location.href = "${contextPath}/member/confirmDetail.do?workOrderNumber="+ary;
	    		alert('상태가 확정되었습니다');
	
	    	}
	    		
        }
     
        function revert() {
        	var item = document.getElementsByName("content").length;
      	  	var no = "";
      	  	var ary = [];
      	  	for(var i=0; i<item;i++){
      			  if(document.getElementsByName("content")[i].checked==true){
      				no = document.getElementsByName("content")[i].value;
      			  	ary.push(no);
      		  	}
      	  }
      	  if(ary.length === 0 || ary === null){ //체크박스가 아무것도 체크되지 않았을때
				alert('취소할 목록의 체크박스를 선택해주세요');
				//window.history.back();
			}
	    	else {//컨트롤러로 해당목록의 no값을 보낸다
      			window.location.href = "${contextPath}/member/revertDetail.do?workOrderNumber="+ary;
	    		alert('상태가 취소되었습니다');
	
	    	}

        }
        
        function release(){
        	var item = document.getElementsByName("content").length;
      	  	var no = "";
      	  	for(var i=0; i<item;i++){
      			  if(document.getElementsByName("content")[i].checked==true){
      				no = document.getElementsByName("content")[i].value;
      		  	}
      			window.location.href = "${contextPath}/member/inscomoperins.do?workOrderNumber="+no;
      	  }
        }
        
      
        
      </script>
      
</body>
</html>