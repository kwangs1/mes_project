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
            overflow: scroll;
        }
        .con1_search{
            padding:0;
            text-align: center;
            position: absolute;
            top: 25%;
            left: 18%;
        }
        #view1,#view2{
            width: 100%;
            text-align: center;
            border: 1px solid black;
            
        }
        #total{
            position: absolute;
            bottom: 0;
            right: 0;
        }
        #button{
            position: absolute;
            top: 10px;
            right: 20px;
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
                    <td colspan="5" style="width: 50px;">부서</td>
                    <td style="width: 80px;"><input type="text" style="width: 100%;"/></td>
                    <td><input type="text" name="" disabled/></td>
                    <td ><i class="fas fa-search" style="color: blue;"></td>
                    
                </tr> 
                <tr>
                    <td>의뢰기간</td>
                    <td colspan="2" style="width: 80px;"><input type="date" id="reqInput" style="width: 100%;"/></td>
                    <td>~</td>
                    <td><input type="date" id="reqInput"  style="width: 100%;"/></td>
                    <td></td>
                    <td colspan="5">사원</td>
                    <td style="width: 80px;"><input type="text" style="width: 100%;"/></td>
                    <td><input type="text" name="" disabled/></td>
                    <td><i class="fas fa-search" style="color: blue;"></td>
                </tr>
            </table>
            <div id="button">
                <button>발주적용조회</button>
                <button>재고확인</button>
            </div>
        </container1>
        <container2 id="contents2">
            <table id="view1">
                <thead>
                    <td><input type="checkbox" name="content" onclick="selectAll(this)"/></td>
                    <td>의뢰번호</td>
                    <td>의뢰일자</td>
                    <td>거래처</td>
                    <td>의뢰창고</td>
                    <td>의뢰담당자</td>
                    <td>요청마감일</td>
                </thead>
                <tbody id="table1">
                    <td><input type="checkbox" value = "check1" id="check" name="content"/></td>
                    <td><input type="text"/></td>
                    <td><input type="date"/></td>
                    <td><input type="text"/></td>
                    <td><input type="text"/></td>
                    <td><input type="text"/></td>
                    <td><input type="text"/></td>
                </tbody>
            </table>
        </container2>
        <container3 id="contents3">
            <table id="view2">
                <tr>
                    <td><input type="checkbox" value = "check1" id="check" name="content"/></td>
                    <td>no</td>
                    <td>품번</td>
                    <td>품명</td>
                    <td>규격</td>
                    <td>납기일</td>
                    <td>입고예정일</td>
                    <td>의뢰수량</td>
                    <td>검사</td>
                </tr>
                <tr>
                    <td><input type="checkbox" value = "check1" id="check" name="content"/></td>
                    <td><input type="text"/></td>
                    <td><input type="text"/></td>
                    <td><input type="text"/></td>
                    <td><input type="text"/></td>
                    <td><input type="date"/></td>
                    <td><input type="date"/></td>
                    <td><input type="text"/></td>
                    <td><input type="text"/></td>
                </tr>
            </table>
            <div id="total">
                <table>
                    <tr>
                        <td>의뢰수량합계</td>
                        <td><input type="text" disabled/></td>
                    </tr>
                    
                </table>
            </div>
        </container3>
</body>
</html>