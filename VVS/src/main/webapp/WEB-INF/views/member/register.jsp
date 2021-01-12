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
					<input type="text" class="form-control" id="inputId" name="inputId" placeholder="ID"> 
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
					<label for="inputAdr" class="col-lg-2 control-label">주소</label>
					<div class="col-lg-10">				
					<input style="width: 400px; display: inline;" type="text" class="form-control" name="inputAdr" id="inputAdr" placeholder="주소">
					</div>	
				</div>
				<div class="form-group text-center"> 
					<button type="submit" class="btn btn-primary">회원가입</button> 
				</div>
			</form> 
		</div> 
	</article>

			
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script type="text/javascript">
		
		//모든 공백 체크 정규식
		var empJ = /\s/g; 
		//아이디 정규식 
		var idJ = /^[A-Za-z0-9][A-Za-z0-9_\-]{4,19}$/; 
		// 비밀번호 정규식 
		var pwJ = /^[A-Za-z0-9]{4,12}$/; 
		// 이름 정규식 
		var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/; 
		// 이메일 검사 정규식 
		var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; 
		// 휴대폰 번호 정규식 
		var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;


		//아이디 중복확인 부분
		$("#inputId").blur(function(){
			if($("#inputId").val()==''){
				$("#id_check").text("아이디를 입력하세요.");
				$("#id_check").css("color","red");
			}else if(idJ.test($("#inputId").val())!=true){
				$("#id_check").text('4~12자의 영문, 숫자만 사용 가능합니다.'); 
				$("#id_check").css("color", "red");
			}else if($("#inputId").val()!=''){
				var inputId = $("#inputId").val();

				$.ajax({
					async : true,
					type : "POST",
					data : {"memberId" : inputId},
					url : "doMemberIdChk.do",
					dataType : "html",
					success : function(data){
						if(data > 0){
							$('#id_check').text('중복된 아이디 입니다.'); 
							$('#id_check').css('color', 'red'); 
							$("#registerForm").attr("disabled", true);
						}else{
							if(idJ.test(inputId)){
								$('#id_check').text('사용가능한 아아디 입니다..'); 
								$('#id_check').css('color', 'red'); 
								$("#registerForm").attr("disabled", false);
							}else if(inputId==''){
								$('#id_check').text('아이디를 입력해주세요.'); 
								$('#id_check').css('color', 'red'); 
								$("#resgisterForm").attr("disabled", true); 
							}else{
								$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다.");
								$('#id_check').css('color', 'red'); 
								$("#usercheck").attr("disabled", true);
							}
					 	}	
						
					}
				});	//ajax
			} 
		});  //blur

		//회원가입 버튼 클릭시
		$('form').on('submit',function(){
			var chk_Arr = new Array(5).fill(false);
			if(idJ.test($("#inputId").val())){
				chk_Arr[0] = true;
			}else{
				chk_Arr[0] = false;
				alert("아이디를 확인하세요.");
				return false;
			}
			//비밀번호가 같은 경우 && 비밀번호 정규식
			if(($("#inputPw").val()==($("#inputPwChk").val())) && pwJ.test($("#inputPw").val())){
				chk_Arr[1] = true;
			}else{
				chk_Arr[1] = false;
				alert("비밀번호를 확인하세요.");
				return false;
			}
			//이름 정규식
			if(nameJ.test($("#inputName").val())){
				chk_Arr[2] = true;
			}else { 
				chk_Arr[2] = false; alert('이름을 확인하세요.'); 
				return false;
			}
			//이메일 정규식
			if(mailJ.test($("#inputEmail").val())){
				console.log(phoneJ.test($('#inputEmail').val()));
				chk_Arr[4] = true;	
			}else { 
				chk_Arr[4] = false; 
				alert('이메일을 확인하세요.'); 
				return false; 
			}
			//휴대전화 정규식
			if (phoneJ.test($("#inputPhone").val())) { 
				console.log(phoneJ.test($("#inputPhone").val())); 
				chk_Arr[5] = true; 
			} else { 
				chk_Arr[5] = false; 
				alert("휴대폰 번호를 확인하세요."); 
				return false; 
			}
			//전체 유효성 검사 
			var validAll = true; 
			for(var i = 0; i < chk_Arr.length; i++){ 
				if(chk_Arr[i] == false){ 
					validAll = false; 
					} 
				}
			
			if(validAll == true){
				alert("HOON SHOP 환영합니다.");
			}else{
				alert("정보를 다시 확인하세요.");
			}
		}); //registerBtn function

		
		
		</script>
</body>
</html>