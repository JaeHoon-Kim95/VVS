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
	<article class="container"> 
		<div class="page-header"> 
			<div class="col-md-6 col-md-offset-3"> 
				<h3>회원가입</h3> 
			</div>
		</div>
		<div class="col-sm-6 col-md-offset-3"> 
			<form action="doInsert.do" method="post" role="form" id="registerForm" name="registerForm">
				<div class="form-group"> 
					<label for="inputId">아이디</label> 
					<input type="text" class="form-control" id="inputId" name="inputId" placeholder="${sessionScope.memberId}" readonly="readonly"> 
					<div class="eheck_font" id="id_check"></div> 
				</div>
				
				<div class="form-group"> 
					<label for="inputPw">비밀번호</label> 
					<input type="password" class="form-control" id="inputPw" name="inputPw" placeholder="PASSWORD"> 
					<div class="eheck_font" id="pw_check"></div> 
				</div>
				
				<div class="form-group"> 
					<label for="inputPwChk">비밀번호 확인</label> 
					<input type="password" class="form-control" id="inputPwChk" name="inputPwChk" placeholder="Check Password">
					<div class="eheck_font" id="pw2_check"></div> 
				</div>
				
				<div class="form-group"> 
					<label for="inputName">이름</label> 
					<input type="text" class="form-control" id="inputName" name="inputName" placeholder="Name"> 
					<div class="eheck_font" id="name_check"></div> 
				</div>
				
				<div class="form-group"> 
					<label for="inputEmail">이메일 주소</label> 
					<input type="email" class="form-control" id="inputEmail" name="inputEmail" placeholder="E-mail"> 
					<div class="eheck_font" id="email_check"></div> 
				</div>
				
				<div class="form-group"> 
					<label for="inputPhone">휴대폰 번호('-'없이 번호만 입력해주세요)</label> 
					<input type="tel" class="form-control" id="inputPhone" name="inputPhone" placeholder="Phone Number"> 
					<div class="eheck_font" id="phone_check"></div> 
				</div>
				
		
				<div class="form-group"> 
					<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="inputAddr1" id="inputAddr1" type="text" readonly="readonly" > 
					<button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button> 
				</div> 
				<div class="form-group"> 
					<input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="inputAddr2" id="inputAddr2" type="text" readonly="readonly" /> 
				</div> 
				<div class="form-group"> 
					<input class="form-control" placeholder="상세주소" name="inputAddrDetail" id="inputAddrDetail" type="text" /> 
				</div>

				
					<input style="width:300px; background-color:black; margin:5px;" class="btn btn-primary btn-lg" type="button" value="회원가입" id="registerBtn"> 			
			</form> 
		</div> 
	</article>

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>	
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script type="text/javascript">
		
		</script>
</body>
</html>