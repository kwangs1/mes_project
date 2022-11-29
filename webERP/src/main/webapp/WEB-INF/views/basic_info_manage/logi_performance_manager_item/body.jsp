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
            padding-top: 10px;
            padding-left: 20px;
        }
        #table2 {
            width: 100%;
        }
        #contents2 {
            overflow: scroll;
        }
</style>
</head>
<body>
<container1 id = contents1>
            <table id="table1">
                <tr>
                    <td align="center">계정</td>
                    <td>
                        <select name="" id="">
                            <option value="0">0.원재료</option>
                            <option value="1">1.부재료</option>
                            <option value="2">2.제품</option>
                            <option value="4">4.반제품</option>
                            <option value="5">5.상품</option>
                            <option value="6">6.저장품</option>
                            <option value="7">7.비용</option>
                            <option value="8">8.수익</option>
                        </select>
                    </td>
                    <td>
                        <select name="" id="">
                            <option value="0">0.전체</option>
                            <option value="1">1.영업</option>
                            <option value="2">2.구매</option>
                            <option value="3">3.자재</option>
                            <option value="4">4.생산</option>
                        </select>
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        담당자
                        <input type="text" style="width: 80px;">
                        <i class="fas fa-search" style="color: blue;"></i>
                    </td>
                    <td><input type="text" name="" id="" style="width: 100px;" disabled></td>
                </tr>
                <tr>
                    <td align="center">품목</td>
                    <td>
                        <input type="text" style="width: 80px;">
                        <i class="fas fa-search" style="color: blue;"></i>
                    </td>
                    <td>
                        <input type="text" name="" id="" style="width: 80px;" disabled>
                    </td>
                    <td>~</td>
                    <td>
                        <input type="text" style="width: 80px;">
                        <i class="fas fa-search" style="color: blue;"></i>
                    </td>
                    <td>
                        <input type="text" name="" id="" style="width: 80px;" disabled>
                    </td>
                    <td>품목군</td>
                    <td>
                        <input type="text" style="width: 80px;">
                        <i class="fas fa-search" style="color: blue;"></i>
                    </td>
                    <td>
                        <input type="text" name="" id="" style="width: 80px;" disabled>
                    </td>
                </tr>
            </table>
        </container1>
        <container2 id= contents2>
            <table id="table2">
                <thead>
                    <td><input type="checkbox" name="content" onclick="selectAll(this)"/></td>
                    <td align="center">품번</td>
                    <td align="center">품명</td>
                    <td align="center">규격</td>
                    <td align="center">단위</td>
                    <td align="center">영업담당자</td>
                    <td align="center">구매담당자</td>
                    <td align="center">자재담당자</td>
                    <td align="center">생산담당자</td>
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
                </tbody>
            </table>
        </container2>
</body>
</html>