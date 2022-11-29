<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"    
    isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
 #contents1{
            position: absolute;
            left: 15%;
            top: 15%;
            width: 85%;
            height: 10%;
            border: 1px solid #ccc;
            z-index: 1;
        }
        #contents2{
            position: absolute;
            left: 15%;
            top: 25%;
            width: 85%;
            height: 70%;
            border: 1px solid #ccc;
            z-index: 1;
        }
        .con1_search {
            margin: 10px;   
        }
       
        
        .con1_search {
            margin: 10px;   
        }
        #contents1 {
            border-bottom: none;
            
        }
        #contents2 {
            border-bottom: none;
            
        }
        
        
        #contents1 td {
            text-align: center;
            letter-spacing: 1px;
            padding: 1px;
            font-family: 'Hanna';
        }
        #contents2 td {
            border-collapse: collapse;
            padding: 3px;
            text-align: center;
        }
        #contents3 td {
            border-collapse: collapse;
            padding: 3px;
        }

        
        #contents1 input[type="text"] {
            text-align: center;
        }
        #contents1 input[disabled] {
            border: 2px inset rgb(148, 147, 150);
        }
        #contents2 input {
            text-align: center;
        }
        #contents3 input {
            text-align: center;
        }        
        
        #table1 {
            width: 70%;
            padding-top: 15px;
            padding-left: 25px;
            text-align: center;
            margin-top: 18px;
        }
        #table2 {
            width: 100%;
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
            <table id="table1" align="center">
                <tr>
                    <td align="center">(주)XXX의 전체 사원 목록 입니다.</td>
                </tr>
            </table>
        </container1>
        <container2 id= contents2>
            <table id="table2" align="center">
                <tr>
                	<td>사원코드</td>
                    <td>사원명</td>
                    <td>부서코드</td>
                    <td>부서명</td>
                    <td>입사일</td>
                    <td>퇴사일</td>
                    <td>비상연락망</td>
                </tr>
                <c:forEach var="employee" items="${employeeView}" > 
                <tr>
                    <td>
                        <input type=text name="Employee_Code" style="width:100px;" value='${employee.employee_Code }' readonly/>
                    </td>
                    <td>
                        <input type=text name="Employee_Name" value='${employee.employee_Name }' readonly/>
                    </td>
                   	<td>
                   		<input type=text name="Department_Code" style="width:100px;" value='${employee.department_Code }' readonly/>
                    </td>
                    <td>
                    	<input type=text name="Department_Name" value='${employee.department_Name }' readonly/>
                    </td>
                    <td>
                    	<input type=date name="JoinDate" value='${employee.joinDate }' readonly/>
                    </td>
                    <td>
                    	<input type=date name="ResignationDate" value='${employee.resignationDate }' readonly/>
                    </td>
                    <td>
                    	<input type=text name="Emergency_Contact_Network" value='${employee.emergency_Contact_Network }' readonly/>
                    </td>
                </tr>
                </c:forEach>
            </table>
        </container2>
</body>
</html>