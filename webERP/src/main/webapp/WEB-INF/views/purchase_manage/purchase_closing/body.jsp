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
            left: 0;
        }
        #view1,#view2{
            width: 100%;
            text-align: center;
            border: 1px solid black;
            
        }
        /* end default */

        .con1_search {
            margin: 10px;
            
            
        }
        
        #contents2, #contents3{
            overflow: scroll;
        }
</style>
</head>
<body>
<container1 id = contents1>
            <table class="con1_search">
                <tr>
                    <td>회사</td>
                    <td style="width: 80px;"><input type="text" style="width: 100%;"/></td>
                    <td colspan="3"><input type="text" name="" disabled style="width: 100%;"/></td>
                    <td><button>검</button></td>

                    <td colspan="5" style="width: 50px;">부서</td>
                    <td style="width: 80px;"><input type="text" style="width: 100%;"/></td>
                    <td><input type="text" name="" disabled/></td>
                    <td ><button>검</button></td>

                    <td colspan="5" style="width: 50px;">사원</td>
                    <td style="width: 80px;"><input type="text" style="width: 100%;"/></td>
                    <td><input type="text" name="" disabled/></td>
                    <td><button>검</button></td>
                    
                </tr>
                
                <tr>
                    <td>마감기간</td>
                    <td colspan="2" style="width: 80px;"><input type="date" style="width: 100%;"/></td>
                    <td>~</td>
                    <td><input type="date" style="width: 100%;"/></td>
                    <td><button>검</button></td>

                    <td></td>
                    <td colspan="5" style="width: 50px; text-align: right;">입고기간</td>
                    <td colspan="1" style="width: 80px; text-align: right;"><input type="date" style="width: 100%;"/></td>
                    <td style="text-align: left;" ><button>검</button></td>
                    
                    
                    <td colspan="5"></td>
                    <td><input type="submit" value="입고적용" style="padding: 5px; margin-top: 5px;"></td>
                </tr>
            </table>
        </container1>
        <container2 id="contents2">
            <table id="view1">
                <thead>
                    <td><input type="checkbox" name="content" onclick="selectAll(this)"/></td>
                    <td>마감번호</td>
                    <td>마감일자</td>
                    <td>거래처</td>
                    <td>마감구분</td>
                    <td>수량</td>
                    <td>단가</td>
                    <td>합계액</td>                    
                </thead>
                <tbody id="table1">
                    <td><input type="checkbox" value = "check1" id="check" name="content"/></td>
                    <td><input type="text"/></td>
                    <td><input type="date"/></td>
                    <td><input type="text"/></td>
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
                    <td><input type="checkbox" name="content2" onclick="selectAll2(this)"/></td>
                    <td>입고번호</td>
                    <td>입고일자</td>
                    <td>거래처</td>
                    <td>거래구분</td>
                    <td>과세구분</td>
                    <td>품명</td>
                    <td>입고</td>
                    <td>미마감수량</td>
                </tr>
                <tr>
                    <td><input type="checkbox" value = "check1" id="check" name="content2"/></td>
                    <td><input type="text"/></td>
                    <td><input type="date"/></td>
                    <td><input type="text"/></td>
                    <td><input type="text"/></td>
                    <td><input type="text"/></td>
                    <td><input type="text"/></td>
                    <td><input type="text"/></td>
                    <td><input type="text"/></td>
                </tr>
            </table>
            
        </container3>
</body>
</html>