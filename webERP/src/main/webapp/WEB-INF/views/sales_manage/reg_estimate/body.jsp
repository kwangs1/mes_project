<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
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
         #view{
            width: 100%;
            text-align: center;
            border: 1px solid black;
        }
        #view td:not(#no){
            width: 8%;
        }
        #view td input{
            width: 100%;
        }
</style>
</head>
<body>
<container1 id = contents1>
            <table class="con1_search">
                <tr>
                    <td align="center">사업장</td>
                    <td><input type="text" name="" id=""></td>
                    <td><i class="fas fa-search" style="color: blue;"></i></td>
                    <td><input type="text" disabled></td>
                    <td align="center">견적기간</td>
                    <td><input type="date"></td>
                    <td>~</td>
                    <td><input type="date"></td>
                </tr>
                <tr>
                    <td align="center">고객</td>
                    <td><input type="text"></td>
                    <td><i class="fas fa-search" style="color: blue;"></i></td>
                    <td><input type="text" disabled></td>
                </tr>
            </table>
        </container1>
        <container2 id="contents2">
           <table id="view">
                <thead>
                    <td><input type="checkbox" id="check" name="content" onclick="selectAll(this)"/></td>
                    <td align="center">견적번호</td>
                    <td align="center">견적일자</td>
                    <td align="center">고객</td>
                    <td align="center">과세구분</td>
                    <td align="center">단가구분</td>
                    <td align="center">비고</td>
                </thead>
                <tbody>
                    <td><input type="checkbox" value = "check1" id="check" name="content"/></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                </tbody>
           </table>
        </container2>
        <container3 id="contents3">
            <table id="view">
                <thead>
                    <td style="width: 5%;"><input type="checkbox" name="content1" onclick="selectAll1(this)"></td>
                    <td align="center">품번</td>
                    <td align="center">품명</td>
                    <td align="center">규격</td>
                    <td align="center">납기일</td>
                    <td align="center">견적수량</td>
                    <td align="center">단가</td>
                    <td align="center">공급가</td>
                    <td align="center">부가세</td>
                    <td align="center">합계액</td>
                </thead>
                <tbody>
                    <td style="width: 5%;"><input type="checkbox" value = "check1" id="check" name="content1"/></td>
                    <td><input type="text" name="" id=""></td>
                    <td><input type="text" name="" id=""></td>
                    <td><input type="text" name="" id=""></td>
                    <td><input type="text" name="" id=""></td>
                    <td><input type="text" name="" id=""></td>
                    <td><input type="text" name="" id=""></td>
                    <td><input type="text" name="" id=""></td>
                    <td><input type="text" name="" id=""></td>
                    <td><input type="text" name="" id=""></td>
                </tbody>
            </table>
        </container3>
</body>
</html>