<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"
 %>
 <%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
 <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <script src="https://kit.fontawesome.com/51db22a717.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Alata&display=swap" rel="stylesheet">
    <style>

*{
    padding: 0;
    margin: 0;
    box-sizing: border-box;
    font-family: 'Alata', sans-serif;
}

.page-container{
    width: 100vw;
    height: 100vh;
    background: #eff0f2;
    display: flex;
    justify-content: center;
    align-items: center;

}
.shadow{
    -webkit-box-shadow: 27px 43px 43px -26px rgba(89,89,89,0.39);
    -moz-box-shadow: 27px 43px 43px -26px rgba(89,89,89,0.39);
    box-shadow: 27px 43px 43px -26px rgba(89,89,89,0.39);
}
.shadow-light{
    -webkit-box-shadow: 45px 45px 104px -33px rgba(38,38,38,0.92);
    -moz-box-shadow: 45px 45px 104px -33px rgba(38,38,38,0.92);
    box-shadow: 45px 45px 104px -33px rgba(38,38,38,0.92);
}
.login-form-container{
    background:#f5f5f5 ;
    width:860px;
    height: 540px;
    display: flex;
    flex-direction: row;
    box-shadow: 10px black;
    border-radius: 10px;

}
.login-form-right-side{
    width: 50%; 
    border-radius: 10px 0px 0px 10px;
    padding:75px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    color: white;
    background-image: radial-gradient(ellipse farthest-corner at 0 140%, 
                    #5d9dff 0%, #2178ff 70%, #3585ff 70%);
}
.login-form-right-side h1{
    color: white;
    width:100%;
    text-align: left;
    opacity: 0.9;
    font-size: 60px;
    }
.login-form-right-side p{
    padding-top: 50px;
    font-size: 20px;
    text-align: right;
    opacity: 0.8;
}
.login-form-left-side{
    width: 50%;
    border-radius: 0px 10px 10px 0px;
    display: flex;
    flex-direction: column;
    align-items: center;
    padding:40px;
    background: rgb(255,255,255);
    background: linear-gradient(287deg, rgba(255,255,255,1) 0%, 
                rgba(243,244,244,1) 0%, rgba(255,255,255,1) 100%);
}
.login-form-left-side .login-top-wrap{
    display: flex;
    justify-content: flex-end;
    align-items: center;
    width:100%;
}
.login-form-left-side .login-top-wrap span{
    color: gray;
    font-size: 11px;
    padding-right:20px;

}
.login-form-left-side .login-top-wrap .enviroment-setting-btn {
    background: rgb(105,163,255);
    background: linear-gradient(162deg, rgba(105,163,255,1) 0%, 
                rgba(43,125,254,1) 50%, rgba(43,125,254,1) 100%);;
    border:  0;
    width:85px;
    height: 35px;
    font-size: 11px;
    color: white;
    border-radius: 3px;
}
.login-input-container{
    padding-top:20px;
    width:300px;
}
.login-input-container .login-input-wrap{
    width:300px;
    height: 45px;
    margin-top: 20px;
    border-radius: 2px;
    border-bottom: solid 2px #2178ff;
}
.login-input-container .login-input-wrap i{
    color: #2178ff;
    line-height: 45px;
}
.login-input-container .login-input-wrap input{
    background: none;
   
    border: none;
    line-height: 45px;
    padding-left:10px;
    width:267px;
}
.login-input-container .login-input-wrap input:focus{
    outline: none;
}
.login-btn-wrap{
    margin-top: 40px;
    display: flex;
    flex-direction: column;
    align-items: center;;
}
.login-btn-wrap .login-btn{
    width:95px;
    height:35px;
    color:white;
    border: 0;
    border-radius: 4px;
    background: rgb(105,163,255);
    background: linear-gradient(162deg, rgba(105,163,255,1) 0%, 
                rgba(43,125,254,1) 50%, rgba(43,125,254,1) 100%);
}
.login-btn-wrap a{
    margin-top:10px;
    text-decoration: none;
    font-size: 11px;
    color: gray;
}
    </style>
</head>
<body>
    <div class="page-container">
        <div class="login-form-container shadow">
            <div class="login-form-right-side">
                <div class="top-logo-wrap">
                    
                </div>
                <h1>KINGDOM</h1>
                <p>to the Next Level</p>
            </div>
            <div class="login-form-left-side">
                <div class="login-top-wrap">
                    <span>Web MES Program ver 1.0</span>
                    <button class="enviroment-setting-btn shadow-light">Environment setting</button>
                </div>
			<form id="loginForm">
                <div class="login-input-container">
                    <div class="login-input-wrap input-ccode" id="ccode">
                        <a href="javascript:search1()"><i class="fas fa-search" style="color: blue;"></i></a>
                        <input placeholder="부서코드" id="depCode" name="dep_Code" value='${param.depCode }' type="text" readonly>
                    </div>
                    <div class="login-input-wrap input-cname">
                        <input placeholder="부서명" name="dep_Name" value='${param.depName }' type="text" readonly>
                    </div>
                    <div class="login-input-wrap input-ecode" id="ecode">
                        <a href="javascript:search2()"><i class="fas fa-search" style="color: blue;"></i></a>
                        <input placeholder="사원코드" name="emp_Code" value='${param.empCode }' type="text" readonly>
                    </div>
                    <div class="login-input-wrap input-ename">
                        <input placeholder="사원명" name="emp_Name" value='${param.empName }' type="text" readonly>
                    </div>
                    <div class="login-input-wrap input-password">
                        <!-- <i class="fas fa-key"></i> -->
                        <input placeholder="사원암호" name="password"  type="password">
                    </div>
                </div>
                <div class="login-btn-wrap">
                    <button class="login-btn" onclick="login()">Login</button>
                </div>
             </form>
            </div>
        </div>
    </div>
    <script>
    function openWindowPop(url, name){
        var options = 'top=330, left=400, width=320, height=420, status=no, menubar=no, toolbar=no, resizable=no';
        window.open(url, name, options);
    }
    	function search1(){
    		openWindowPop('${contextPath}/member/depcodepop.do','codehelper');
    	}
    	function search2(){
    		var depCode = document.getElementById('depCode');
    		openWindowPop('${contextPath}/member/empcodepop.do?depCode='+depCode.value,'codehelper');
    	}
    	 function setChildValue(code,name){
      	  const URLSearch = new URLSearchParams(location.search);
          if(URLSearch.get('empCode') == null){
  		window.location.href = location.href + '&empCode=' + code + '&empName=' + name;
          }
          else{
          	URLSearch.set('empCode', code);
          	URLSearch.set('empName', name);
          	const newParam = URLSearch.toString();
          	window.location.href = location.pathname+'?' +newParam;
          } 
    	 }
    	 function login(){
    		 document.getElementById('loginForm').action = "${contextPath}/member/doLogin.do";
    	 }
    </script>
</body>
</html>