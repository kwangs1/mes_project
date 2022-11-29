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
            width: 50%;
            height: 70%;
            border: 1px solid black;
            z-index: 1;
        }
        #contents3{
            position: absolute;
            left: 65%;
            top: 25%;
            width: 35%;
            height: 70%;
            z-index: 1;
            border: 1px solid black;
        }
        .con1_search{
            padding:0;
            text-align: center;
            position: absolute;
            top: 25%;
            left: 15%;
        }
        #view1,#view2{
            width: 100%;
            text-align: center;
            border: 1px solid black;
            
        }
        #contents2 div, #contents3 div{
            position: absolute;
            right: 0;
            bottom: 0;
        }
        #view1 td:not(#non){
            width: 12%;
        }
        #view1 td input{
            width: 100%;
        }
        #view2 td{
            width: 15%;
        }
        #view2 td input{
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
                    <td style="width: 50px;"><input type="text" id="reqInput" style="width: 100%;"/></td>

                    <td colspan="3"><input type="text" name="" disabled style="width: 100%;"/></td>
                    <td><i class="fas fa-search" style="color: blue;"></td>
                    <td colspan="5" style="width: 100px;">거래구분</td>
                    <td style="width: 80px;"><input type="text" style="width: 100%;"/></td>
                    <td><input type="text" name="" disabled/></td>
                    <td ><i class="fas fa-search" style="color: blue;"></td>
                    
                </tr> 
                <tr>
                    <td>견적기간</td>
                    <td colspan="2" style="width: 80px;"><input type="date" id="reqInput" style="width: 100%;"/></td>
                    <td>~</td>
                    <td><input type="date" id="reqInput" style="width: 100%;"/></td>
                    <td></td>
                    <td colspan="5">사원</td>
                    <td style="width: 80px;"><input type="text" style="width: 100%;"/></td>
                    <td><input type="text" name="" disabled/></td>
                    <td><i class="fas fa-search" style="color: blue;"></td>
                </tr>
            </table>
        </container1>
        <container2 id= contents2>
            <table id="view1">
                <tr>
                    <th><input type="checkbox" name="content"/></th>
                    <th>주문번호</th>
                    <th>주문일자</th>
                    <th>고객명</th>
                    <th>No</th>
                    <th>품번</th>
                    <th>품명</th>
                    <th>단위</th>
                    <th>주문수량</th>
                </tr>
                <tr>
                    <td id="non"><input type="checkbox" name="content"/></td>
                    <td><input type="text" disabled/></td>
                    <td><input type="text" disabled/></td>
                    <td><input type="text" disabled/></td>
                    <td><input type="text" disabled/></td>
                    <td><input type="text" disabled/></td>
                    <td><input type="text" disabled/></td>
                    <td><input type="text" disabled/></td>
                    <td><input type="text" disabled/></td>
                    
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
                <tr>
                    <td><input type="text" disabled/></td>
                    <td><input type="text" disabled/></td>
                    <td><input type="text" disabled/></td>
                    <td><input type="text" disabled/></td>
                </tr>
            </table>
            <div>
                출고합계:
                <input type="text" disabled/>
                수량:
                <input type="text" disabled/>
             </div>
        </container3>
        
</body>
</html>