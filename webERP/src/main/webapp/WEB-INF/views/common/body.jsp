<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#contents1{
            position: absolute;
            padding: 10px;
            right: 0;
            top: 15%;
            width: 85.1%;
            height: 10%;
            border: 1px solid #cccccc;
            z-index: 1;
            
            /* background-color: rgb(228, 228, 248); */

        }

	.con1_search{
            padding:0;
            text-align: center;
            position: absolute;
            top: 25%;
            left: 15%;
        }
        #contents2{
            position: absolute;
            left: 15%;
            top: 25%;
            width: 50%;
            height: 70%;
            border: 1px solid #ccc;
            z-index: 1;
        }
        #view1,#view2{
            width: 100%;
            text-align: center;
            border: 1px solid #ccc;
            
        }
        #contents2 div, #contents3 div{
            position: absolute;
            right: 0;
            bottom: 0;
        }
        #contents3{
            position: absolute;
            left: 65%;
            top: 25%;
            width: 35%;
            height: 70%;
            z-index: 1;
            border: 1px solid #ccc;
        }
        #view1,#view2{
            width: 100%;
            text-align: center;
            border: 1px solid #ccc;
            
        }
        #contents2 div, #contents3 div{
            position: absolute;
            right: 0;
            bottom: 0;
        }
</style>
</head>
<body>
<container1 id = contents1>
            <table class="con1_search">
                <tr>
                    <td>사업장</td>
                    <td style="width: 50px;"><input type="text" style="width: 100%;"/></td>

                    <td colspan="3"><input type="text" name="" disabled style="width: 100%;"/></td>
                    <td><button>검</button></td>
                    <td colspan="5" style="width: 100px;">거래구분</td>
                    <td style="width: 80px;"><input type="text" style="width: 100%;"/></td>
                    <td><input type="text" name="" disabled/></td>
                    <td ><button>검</button></td>
                    
                </tr> 
                <tr>
                    <td>견적기간</td>
                    <td colspan="2" style="width: 80px;"><input type="date" style="width: 100%;"/></td>
                    <td>~</td>
                    <td><input type="date" style="width: 100%;"/></td>
                    <td><button>검</button></td>
                    <td colspan="5">사원</td>
                    <td style="width: 80px;"><input type="text" style="width: 100%;"/></td>
                    <td><input type="text" name="" disabled/></td>
                    <td><button>검</button></td>
                </tr>
            </table>
        </container1>
 <container2 id= contents2>
            <table id="view1">
                <tr>
                    <td><input type="checkbox" name="content" onclick="selectAll(this)"/></td>
                    <td>주문번호</td>
                    <td>주문일자</td>
                    <td>고객명</td>
                    <td>No</td>
                    <td>품번</td>
                    <td>품명</td>
                    <td>단위</td>
                    <td>주문수량</td>
                </tr>
                <%-- <c:forEach var="member" items="${membersList}" >     
   <tr align="center">
   	  <td><input type="checkbox" name= "content"/></td>
      <td>${member.id}</td>
      <td>${member.pwd}</td>
      <td>${member.name}</td>
      <td>${member.email}</td>
      <td colspan="2">${member.joinDate}</td>
      <td><a href="${contextPath}/member/removeMember.do?id=${member.id }">삭제하기</a></td>
    </tr>
  </c:forEach> --%>
     <tr>
                    <td style="width:40px"><input type="checkbox" name="content" onclick="selectAll(this)"/></td>
                    <td style="width:40px"><input type="text" style="width:100%;"/></td>
                    <td style="width:40px"><input type="text" style="width:100%;"/></td>
                    <td style="width:40px"><input type="text" style="width:100%;"/></td>
                    <td style="width:40px"><input type="text" style="width:100%;"/></td>
                    <td style="width:40px"><input type="text" style="width:100%;"/></td>
                    <td style="width:40px"><input type="text" style="width:100%;"/></td>
                    <td style="width:40px"><input type="text" style="width:100%;"/></td>
                    <td style="width:40px"><input type="text" style="width:100%;"/></td>
             </tr>
            </table>
            <div>
                    주문수량 총합:
                    &nbsp;<input type="text" disabled/>
            </div>
        </container2>
        <container3 id="contents3">
            <table id="view2">
                <tr>
                    <th>출고번호</th>
                    <th>출고일자</th>
                    <th>No</th>
                    <th>수량</th>
                </tr>
            </table>
            <div>
                출고합계:
                <input type="text" disabled/>
                수량:
                <input type="text" disabled/>
             </div>
        </container3>
         <script>
        function selectAll(selectAll){
            const checkbox = document.getElementsByName('content');
            checkbox.forEach((checkbox) => {
                checkbox.checked = selectAll.checked;
            })
        }
        </script>
</body>
</html>