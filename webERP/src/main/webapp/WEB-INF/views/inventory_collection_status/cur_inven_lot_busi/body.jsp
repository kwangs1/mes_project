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
            height: 12%; 
            border: 1px solid black;
            z-index: 1;
        }
        
        #contents2{
            position: absolute;
            right: 0;
            top: 27%; 
            width: 85%;
            height: 68%; 
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
        #contents2 {
            overflow: scroll;
        }

        /*탭구현 css임*/		
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
                    <td >사업장</td>
                    <td style="width: 50px;"><input type="text" style="width: 100%;" disabled/></td>
                    <td colspan="3"><input type="text" name="" disabled style="width: 100%;"/></td>
                    <td><button>검</button></td>

                    <td colspan="5" style="width: 70px;">해당년도</td>
                    <td style="width: 80px;"><input type="number" style="width: 100%; text-align: right; background-color: rgb(255, 255, 149);" value="2021" /></td>

                    <!-- <td colspan="5" style="width: 50px;">계정조달</td>
                    <td style="width: 80px;"><input type="text" style="width: 100%;"/></td>
                    <td><input type="text" name="" disabled/></td>
                    <td><button>검</button></td> -->

                    
                    
                </tr>
                
                <tr>
                    <td>품번</td>
                    <td style="width: 50px;"><input type="text" style="width: 100%;"/></td>
                    <td colspan="3"><input type="text" name="" disabled style="width: 100%;"/></td>
                    <td><button>검</button></td>

                    <td colspan="5" style="width: 50px;">LOTno</td>
                    <td style="width: 80px;"><input type="text" style="width: 100%;"/></td>
                    <td><input type="text" name="" disabled/></td>
                    <td><button>검</button></td>
                                        
                    <!-- <td colspan="5" style="width: 50px;">품목군</td>
                    <td style="width: 80px;"><input type="text" style="width: 100%;"/></td>
                    <td><input type="text" name="" disabled/></td>
                    <td><button>검</button></td> -->
                </tr>

                <!-- <tr>
                    <td>재고수량유무</td>
                    <td style="width: 50px;"><input type="text" style="width: 100%;"/></td>
                    <td colspan="3"><input type="text" name="" disabled style="width: 100%;"/></td>
                    <td><button>검</button></td>   
                </tr> -->
                

                <ul class="tabs" style="left: 0px; bottom: 0px; position: absolute;">
                    <li class="tab-link current" data-tab="tab-1">전 사</li>
                    <li class="tab-link" data-tab="tab-2">사업장</li>
                </ul>
            </table>
        </container1>
        <container2 id="contents2">
            <table id="view1">
                <thead>
                    <td><input type="checkbox" name="content" onclick="selectAll(this)"/></td>
                    <td>품 번</td>
                    <td>품 명</td>
                    <td>규 격</td>
                    <td>단 위</td>
                    <td>LOTno</td>
                    <td>기초수량</td>
                    <td>입고수량</td>
                    <td>출고수량</td>
                    <td>재고수량</td>
                    



                </thead>
                <tbody id="table1">
                    <td><input type="checkbox" value = "check1" id="check" name="content"/></td>
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
        </container2>
       <script src="http://code.jquery.com/jquery-latest.js"></script> <!--제이쿼리최신버젼가져옴-->
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