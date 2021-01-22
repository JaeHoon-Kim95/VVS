<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="hContext" value="${pageContext.request.contextPath }" ></c:set> 
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<title>VVS SHOP</title>

   <!-- Bootstrap core CSS -->
  <link href="${hContext}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${hContext}/resources/css" rel="stylesheet">
</head>
<body>
<%@ include file="/WEB-INF/views/main/topbar.jsp" %>

	<div style="text-align: center;" class="container">
		<h1>SIGN IN</h1>
		<hr>
		<div class="contents text-center">
			<div class="col-sm-6 col-md-offset-10" >
				<form method="post" action="${hContext }/member/doLogin.do" class="" name="loginForm" id="loginForm">
					<div class="form-group">
						<label for="inputId">아이디</label> 
						<input type="text" class="form-control" id="inputId" name="inputId" placeholder="ID">
					</div>
					
					<div class="form-group"> 
						<label for="inputPw">비밀번호</label> 
						<input type="password" class="form-control" id="inputPw" name="inputPw" placeholder="PASSWORD"> 			
				</div>
					<input style="width:150px; background-color:black; margin:5px;" class="btn btn-primary btn-lg" type="button" value="REGISTER" id="registerBtn">
					<input style="width:150px; background-color:black; margin:5px;" class="btn btn-primary btn-lg" type="button" value="SIGN IN" id="loginBtn">				
				</form>
			</div>
		</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript">
	$("#registerBtn").on("click",function(){
		window.location.href = "${hContext}/member/registerPage.do";
	});

	$("#loginBtn").on("click",function(){
		if($("#inputId").val()==''){
			alert("ID를 입력하세요");
		}else if($("#inputPw").val()==''){
			alert("PW를 입력하세요");
		}
		
		$.ajax({
			type : "POST",
			url : "${hContext}/member/doLogin.do",
			dataType : "html",
			data : {
					"memberId" : $("#inputId").val(),
					"memberPw" : $("#inputPw").val()
				},
				success : function(data){
					console.log(data);
					if(data == 1){						
						alert("로그인 성공");
						window.location.href = "${hContext}/member/homeBack.do";
					}else if(data == 2){
						console.log(data);
						alert("비밀번호를 확인하세요.");
						window.location.href = "${hContext}/member/loginPage.do";
					}else if(data == 3){
						console.log(data);
						alert("ID를 확인하세요.");
						window.location.href = "${hContext}/member/loginPage.do";
					}
				},
				error:function(data){
					
				}				
			}); //ajax
		}); //loginBtn
	</script>
</body>
</html>