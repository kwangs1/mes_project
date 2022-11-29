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
        .con1_search{
            padding:0;
            text-align: center;
            position: absolute;
            top: 25%;
            left: 18%;
        }
        #view1{
            width: 100%;
            text-align: center;
            border: 1px solid black;
        }
        #view1 td{
            width: 6%;
            text-align: center;

        }
        .total{
            position: absolute;
            left: 80px;
            bottom: 0;
            width: 100%;
            text-align: center;
        }
        .total input{
            border-style: none;
            background-color: rgb(223, 223, 223);
        }
        #contents1 div{
            position: absolute;
            right: 20px;
            top: 10px;
        }
        ul.tabs{
			margin: 0px;
			padding: 0px;
			list-style: none;
		}
		ul.tabs li{
			background: none;
			color: black;
			display: inline-block;
			padding: 5px 5px;
			cursor: pointer;
            width: 80px;
            text-align: center;
		}


		ul.tabs li.current{
			border-top: 2px solid skyblue;			
            background-color: #ddd;        
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
		}

		.tab-content{
			display: none;	
			
		}

		.tab-content.current{
			display: inherit;
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
                    <td>수주기간</td>
                    <td colspan="2" style="width: 80px;"><input type="date" style="width: 100%;"/></td>
                    <td>~</td>
                    <td><input type="date" style="width: 100%;"/></td>
                    <td></td>
                    <td colspan="5">창고</td>
                    <td style="width: 80px;"><input type="text" style="width: 100%;"/></td>
                    <td><input type="text" name="" disabled/></td>
                    <td><i class="fas fa-search" style="color: blue;"></td>
                </tr>
            </table>
            
                <ul class="tabs" style="left: 0px; bottom: 0px; position: absolute;">
                    <li class="tab-link current" data-tab="tab-1" id="date_button">일자별</li>
                    <li class="tab-link" data-tab="tab-2" id="type_button">유형별</li>
                </ul>
            
        </container1>
        <container2 id= contents2>
            
            <table id="view1">
                <thead id="day">
                    <td style="width: 1%;"><input type="checkbox" name="content"/></td>
                    <td>품번</td>
                    <td>품명</td>
                    <td>규격</td>
                    <td>단위</td>
                    <td>기초재고</td>
                    <td>입고<br>일계 | 누계</td>
                    <td>출고<br>일계 | 누계</td>
                    <td>기말재고</td>
                
                </thead>
                <tr id="type" style="display: none;">
                    <td style="width: 3%;"><input type="checkbox" name="content"/></td>
                    <td>수불일자</td>
                    <td>품번</td>
                    <td>품명</td>
                    <td>규격</td>
                    <td>수불유형</td>
                    <td>입출고유형</td>
                    <td>기초수량</td>
                    <td>입고수량</td>
                    <td>출고수량</td>
                    <td>재고수량</td>
                    <td>재고단위</td>
                    <td style="font-size: 13px;">관리단위수량</td>
                    <td>관리단위</td>
                </tr>
            </table>
            <div id="d_total" class="total">
                <table>
                    <tr>
                        <td>기초재고합계</td>
                        <td>일계입고합계</td>
                        <td>누계입고합계</td>
                        <td>일계출고합계</td>
                        <td>누계출고합계</td>
                        <td>기말재고합계</td>
                    </tr>
                    <tr>
                        <td><input type="text" disabled/></td>
                        <td><input type="text" disabled/></td>
                        <td><input type="text" disabled/></td>
                        <td><input type="text" disabled/></td>
                        <td><input type="text" disabled/></td>
                        <td><input type="text" disabled/></td>
                    </tr>
                </table>
            </div>
            <div id="t_total" class="total" style="display: none;">
                <table>
                    <tr>
                        <td>기초수량합계</td>
                        <td>입고수량합계</td>
                        <td>출고수량합계</td>
                        <td>재고수량합계</td>
                        <td>재고단위합계</td>
                        <td>관리단위합계</td>
                    </tr>
                    <tr>
                        <td><input type="text" disabled/></td>
                        <td><input type="text" disabled/></td>
                        <td><input type="text" disabled/></td>
                        <td><input type="text" disabled/></td>
                        <td><input type="text" disabled/></td>
                        <td><input type="text" disabled/></td>
                    </tr>
                </table>
            </div>
        </container2>
            <script>
        var date_button = document.getElementById('date_button');
        var type_button = document.getElementById('type_button');
        date_button.onclick = function(){
            var day = document.getElementById('day');
            var type = document.getElementById('type');
            var d_total = document.getElementById('d_total');
            var t_total = document.getElementById('t_total');
            day.style.display = "block";
            d_total.style.display = "block";
            type.style.display = "none";
            t_total.style.display = "none";
            
        }
        type_button.onclick = function(){
            var day = document.getElementById('day');
            var type = document.getElementById('type');
            var d_total = document.getElementById('d_total');
            var t_total = document.getElementById('t_total');
            day.style.display = "none";
            d_total.style.display = "none";
            type.style.display = "block";
            t_total.style.display = "block";
        }
        </script>
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script>
        $(document).ready(function(){
        
        $('ul.tabs li').click(function(){
            var tab_id = $(this).attr('data-tab');
    
            $('ul.tabs li').removeClass('current');
            $('.tab-content').removeClass('current');
    
            $(this).addClass('current');
            $("#"+tab_id).addClass('current');
        })
    
    })
    </script>
</body>
</html>