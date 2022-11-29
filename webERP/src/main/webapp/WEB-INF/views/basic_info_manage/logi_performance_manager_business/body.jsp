<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
            border: 1px solid black;
            z-index: 1;
        }
        #contents2{
            position: absolute;
            left: 15%;
            top: 25%;
            width: 85%;
            height: 70%;
            border: 1px solid black;
            z-index: 1;
            overflow: scroll;
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
            padding-top: 15px;
            padding-left: 50px;
        }
        #table2 {
            width: 100%;
        }
</style>
</head>
<body>
<container1 id = contents1>
            <table id="table1">
                <tr>
                    <td align="center">거래처</td>
                    <td>
                        <input type="text">
                        <i class="fas fa-search" style="color: blue;"></i>
                    </td>
                    <td>
                        <input type="text" disabled>
                        ~
                    </td>
                    <td>
                        <input type="text">
                        <i class="fas fa-search" style="color: blue;"></i>
                    </td>
                    <td>
                        <input type="text" disabled>
                    </td>
                </tr>
                <tr>
                    <td>
                        <select name="" id="">
                            <option value="0">0.전체</option>
                            <option value="1">1.영업</option>
                            <option value="2">2.구매</option>
                            <option value="3">3.외주</option>
                        </select>
                    </td>
                    <td align="center" >
                        담당자
                        <input type="text" style="width: 115px;">
                        <i class="fas fa-search" style="color: blue;"></i>
                    <td>
                        <input type="text" disabled >
                    </td>
                </tr>
            </table>
        </container1>
        <container2 id= contents2>
            <table id="table2">
                <thead>
                    <td><input type="checkbox" name="content" onclick="selectAll(this)"/></td>
                    <td align="center">코드</td>
                    <td align="center">거래처명</td>
                    <td align="center">영업담당자</td>
                    <td align="center">구매담당자</td>
                    <td align="center">외주담당자</td>
                    <td align="center">지역</td>
                    <td align="center">거래처분류</td>
                    <td align="center">기본납품처</td>
                    <td align="center">영업기본단가유형</td>
                    <td align="center">구매기본단가유형</td>
                </thead>
                <tbody>
                    <td><input type="checkbox" value = "check1" id="check" name="content"/></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                </tbody>
            </table>
        </container2>
</body>
</html>