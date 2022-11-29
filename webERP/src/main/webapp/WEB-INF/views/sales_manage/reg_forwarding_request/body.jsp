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
        #reqInput {
            background-color: rgb(255, 255, 149);
            text-align: center;
        }
</style>
</head>
<body>
<container1 id = contents1>
            <table class="con1_search">
                <tr>
                    <td>사업장</td>
                    <td><input type="text" name="" id="reqInput"></td>
                    <td><i class="fas fa-search" style="color: blue;"></i></td>
                    <td><input type="text" disabled></td>
                    <td>의뢰기간</td>
                    <td><input type="date" id="reqInput"></td>
                    <td>~</td>
                    <td><input type="date" id="reqInput"></td>
                </tr>
                <tr>
                    <td>고객</td>
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
                    <td>의뢰번호</td>
                    <td>의뢰일자</td>
                    <td>고객</td>
                    <td>납품처</td>
                    <td>의뢰창고</td>
                    <td>비고</td>
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
                    <td>품번</td>
                    <td>품명</td>
                    <td>규격</td>
                    <td>납기일</td>
                    <td>의뢰수량(관리)</td>
                    <td>관리단위</td>
                    <td>의뢰수량(재고)</td>
                    <td>재고</td>
                    <td>검사</td>
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