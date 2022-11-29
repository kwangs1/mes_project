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
        .con1_search{
            padding:0;
            text-align: center;
            /* position: absolute; 칸 모잘라서 지움*/
            top: 25%;
            left: 5%;
        }
            #searchForm {
            height: 100%;
            margin: 10px 20px;
            padding:0;
            text-align: center;
        }
    /* 컨텐츠 css부 */
        #workOrderDetail{
            height: 100%;
            overflow: scroll;
        }
        #workOrderInfo {
            height: 95%;
            width: 100%;
            overflow: scroll;
        }
           /* 합계 출력부 */
           #resultWindow{
            height: 5%;
            background-color: gray;
            line-height: 5%;
        }

</style>
</head>
<body>
<container1 id = contents1>
            <form id="searchForm">
                <table class="con1_search">
                    <tr>
                        <td>사업장</td>
                        <td style="width: 80px;"><input type="text" style="width: 100%; background-color: yellow;"/></td>
                        <td colspan="3"><input type="text" name="" disabled style="width: 100%;"/></td>
                        <td> <i class="fas fa-search" style="color: blue;"></i></td> 
    
                        <td colspan="5" style="width: 80px;">부서</td>
                        <td style="width: 80px;"><input type="text" style="width: 100%; background-color: yellow;"/></td>
                        <td><input type="text" name="" disabled/></td>
                        <td> <i class="fas fa-search" style="color: blue;"></i></td>
                        
                    </tr>
                    
                    <tr>
                        <td>마감일</td>
                        <td colspan="2" style="width: 50px;"><input type="date" style="width: 100%; background-color: yellow;"/></td>
                        <td>~</td>
                        <td ><input type="date" style="width: 100%; background-color: yellow;"/></td>
                        <td></td>
    
                        <td colspan="5" style="width: 80px;">사원</td>
                        <td style="width: 80px;"><input type="text" style="width: 100%; background-color: yellow;"/></td>
                        <td><input type="text" name="" disabled/></td>
                        <td > <i class="fas fa-search" style="color: blue;"></i></td>

                        <td>
                            <input type="button" value="실적적용" style="padding: 5px; margin-left: 30px;"></input>
                        </td>
                        <td>
                            <input type="button" value="실적일괄적용" style="padding: 5px;"></input>
                        </td>
                    </tr>
                </table>
                </form>
        </container1>
        <container2 id="contents2">
           <!-- 디테일부 -->
           <div id="workOrderDetail">
            <table id="workOrderDetailTable">
                <thead>
                    <td><input type="checkbox" name="content" onclick="selectAll(this)"/></td>
                    <td>외주비마감번호</td>
                    <td>마감일자</td>
                    <td>외주공정</td>
                    <td>외주처</td>
                    <td>비고</td>
                </thead>
                <!-- 테스트용 데이터, 추후 표현식으로 수정필요 -->
                <tbody>
                    <td><input type="checkbox" value = "check1" id="check" name="content"/></td>
                    <td><input type="text"/></td>
                    <td><input type="date"/></td>
                    <td><input type="text"/></td>
                    <td><input type="text"/></td>
                    <td><input type="text"/></td>
                </tbody>
            </table>
        </div>
        <!-- 디테일부 종료 -->
        </container2>
        <container3 id="contents3">
            <div id="workOrderInfo">
                <table id="workOrderTable">
                    <thead>
                        <td><input type="checkbox" name="content2" onclick="selectAll2(this)"/></td>
                        <td>순번</td>
                        <td>품번</td>
                        <td>품명</td>
                        <td>규격</td>
                        <td>단위</td>
                        <td>수량</td>
                        <td>단가</td>
                        <td>공급가</td>
                        <td>부가세</td>
                        <td>합계액</td>
                        <td>비고</td>
                    </thead>
                    <!-- 테스트용 데이터, 추후 표현식으로 수정필요 -->
                    <tbody>
                        <td><input type="checkbox" value = "check1" id="check" name="content2"/></td>
                        <td><input type="text"/></td>
                        <td><input type="text"/></td>
                        <td><input type="text"/></td>
                        <td><input type="text"/></td>
                        <td><input type="text"/></td>
                        <td><input type="text"/></td>
                        <td><input type="text"/></td>
                        <td><input type="text"/></td>
                        <td><input type="text"/></td>
                        <td><input type="text"/></td>
                        <td><input type="text"/></td>
                    </tbody>
                </table>
            </div>
             <!-- 합계 출력부 -->
             <div id="resultWindow">
                합 계 <span style="margin-left: 50px;">수량<input type="text"></span><span style="margin-left: 50px;">공급가<input type="text"></span><span style="margin-left: 50px;">부가세<input type="text"></span><span style="margin-left: 50px;">합계액<input type="text"></span>
            </div>
            <!-- 합계 출력부 종료 -->
        </container3>
      
</body>
</html>