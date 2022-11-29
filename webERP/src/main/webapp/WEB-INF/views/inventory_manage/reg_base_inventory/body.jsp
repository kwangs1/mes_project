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
            height: 15%; /*10에서 15로수정*/
            border: 1px solid black;
            z-index: 1;
        }
        #contents2{
            position: absolute;
            right: 0;
            top: 30%; /*25에서 30로수정*/
            width: 85%;
            height: 35%; 
            border: 1px solid black;
            z-index: 1;
        }
        #contents3{
            position: absolute;
            right: 0;
            top:65%; /*60에서 65으로수정*/
            width: 85%;
            height: 30%; /*35에서 30으로수정*/
            border: 1px solid black;
            z-index: 1;
        }
        .con1_search{
            padding:0;
            text-align: center;
            /* position: absolute; 칸 모잘라서 지움*/
            top: 25%;
            left: 18%;
        }
        #view1,#view2{
            width: 100%;
            text-align: center;
            border: 1px solid black;
            
        }
        /* end default 밑으로 css 추가함*/
        .con1_search {
            margin: 10px;
        }
        #contents1 {
            padding: 0px;
        }              
        #contents2, #contents3{
            overflow: scroll;
        }
        
        /*탭구현 css임*/  
        #tabContent1, #tabContent2, #tabContent3, #tabContent4{
            display: none;          
            }
 
        #tab1, #tab2, #tab3, #tab4 {
              display: none;}
 
        label {
            display: inline-block;
            padding: 5px;          
            color: #bbb;
            border: 1px solid transparent;}
 
        label:hover {
            color: #2e9cdf;
            cursor: pointer;}
 
        /*input 클릭시, label 스타일*/
        input:checked + label {
              color: #555;
              border: 1px solid black;
              border-top: 1px solid white;
              border-bottom: 1px solid black;}
 
        #tab1:checked ~ #tabContent1,
        #tab2:checked ~ #tabContent2,
        #tab3:checked ~ #tabContent3,
        #tab4:checked ~ #tabContent4 {
            display: block;}
        
</style>
</head>
<body>
<container1 id = contents1>
            <table class="con1_search">
                    <input id="tab1" type="radio" name="tabs" checked> 
                    <label for="tab1">기초조정</label>
                
                    <input id="tab2" type="radio" name="tabs">
                    <label for="tab2">입고조정</label>

                    <input id="tab3" type="radio" name="tabs">
                    <label for="tab3">출고조정</label>
                
                <tr> 
                    <td>사업장</td>
                    <td style="width: 50px;"><input type="text" style="width: 100%;"/></td>
                    <td colspan="3"><input type="text" name="" disabled style="width: 100%;"/></td>
                    <td><button>검</button></td>

                    <td colspan="5" style="width: 70px;">부서</td>
                    <td style="width: 80px;"><input type="text" style="width: 100%;"/></td>
                    <td><input type="text" name="" disabled/></td>
                    <td ><button>검</button></td>

                    <!-- <td colspan="5" style="width: 70px;">사원</td>
                    <td style="width: 80px;"><input type="text" style="width: 100%;"/></td>
                    <td><input type="text" name="" disabled/></td>
                    <td><button>검</button></td> -->
                    
                </tr>
                
                <tr>
                    <td>조정기간</td>
                    <td colspan="2" style="width: 80px;"><input type="date" style="width: 100%;"/></td>
                    <td>~</td>
                    <td><input type="date" style="width: 100%;"/></td>
                    <td><button>검</button></td>

                    <td colspan="5" style="width: 50px;">창고</td>
                    <td style="width: 80px;"><input type="text" style="width: 100%;"/></td>
                    <td><input type="text" name="" disabled/></td>
                    <td ><button>검</button></td>
                                        
                    <!-- <td colspan="5" style="width: 50px;">장소</td>
                    <td style="width: 80px;"><input type="text" style="width: 100%;"/></td>
                    <td><input type="text" name="" disabled/></td>
                    <td ><button>검</button></td> -->
                    <td colspan="5"></td>
                    <td style="margin: 5px;">
                    <input type="button" value=" 재고실사적용" style="padding: 5px; margin: 5px;"> <!--need popup-->
                    </td>
                </tr>

                <!-- <tr>
                    <td>담당자</td>
                    <td style="width: 50px;"><input type="text" style="width: 100%;"/></td>
                    <td colspan="3"><input type="text" name="" disabled style="width: 100%;"/></td>
                    <td><button>검</button></td>

                    <td colspan="5" style="width: 50px;">관리구분</td>
                    <td style="width: 80px;"><input type="text" style="width: 100%;"/></td>
                    <td><input type="text" name="" disabled/></td>
                    <td ><button>검</button></td>

                    <td colspan="5" style="width: 50px;">프로젝트</td>
                    <td style="width: 80px;"><input type="text" style="width: 100%;"/></td>
                    <td><input type="text" name="" disabled/></td>
                    <td><button>검</button></td>
                    
                </tr>
                
                <tr>
                    <td>품목군</td>
                    <td style="width: 50px;"><input type="text" style="width: 100%;"/></td>
                    <td colspan="3"><input type="text" name="" disabled style="width: 100%;"/></td>
                    <td><button>검</button></td>

                    <td colspan="5" style="width: 50px;">거래처</td>
                    <td style="width: 80px;">
                        <div id="tabContent1"></div>
                            <p><input type="text" style="width: 100%;" disabled/></p>
                        </div> 
                        <div id="tabContent2">
                            <p><input type="text" style="width: 100%;"/></p>
                        </div>  
                    </td>
                    
                    <td><input type="text" name="" disabled/></td>
                    <td ><button>검</button></td>

                    <td colspan="5" style="width: 50px;">품번</td>
                    <td style="width: 80px;"><input type="text" style="width: 100%;"/></td>
                    <td><input type="text" name="" disabled/></td>
                    <td><button>검</button></td>
                  
                </tr> -->
                 
                
                
            </table>
        </container1>
        <container2 id="contents2">
            <table id="view1">
                <thead>
                    <td><input type="checkbox" name="content" onclick="selectAll(this)"/></td>
                    <td>조정번호</td>
                    <td>조정일자</td>
                    <td>창고</td>
                    <td>장소</td>
                    <td>담당자</td>
                                     
                </thead>
                <tbody id="table1">
                    <td><input type="checkbox" value = "check1" id="check" name="content"/></td>
                    <td><input type="text"/></td>
                    <td><input type="date"/></td>
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
                    <td>품 번</td>
                    <td>품 명</td>
                    <td>규 격</td>
                    <td>단 위</td>
                    <td>조정수량</td>
                    <td>단가</td>
           
                </tr>
                <tr>
                    <td><input type="checkbox" value = "check1" id="check" name="content2"/></td>
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