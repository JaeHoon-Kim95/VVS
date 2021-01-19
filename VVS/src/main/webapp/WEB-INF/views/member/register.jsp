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
<<<<<<< HEAD
<%@ include file="/WEB-INF/views/cmn/topBar.jsp" %>
=======
<%@ include file="/WEB-INF/views/main/topbar.jsp" %>
>>>>>>> refs/remotes/origin/JHS_workspace

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
		
		//모든 공백 체크 정규식
		var empJ = /\s/g; 
		//아이디 정규식 
		var idJ = /^[A-Za-z0-9][A-Za-z0-9_\-]{4,19}$/; 
		// 비밀번호 정규식 
		var pwJ = /^[A-Za-z0-9]{4,12}$/; 
		// 이름 정규식 
		var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/; 
		// 이메일 검사 정규식 
		var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/; 
		// 휴대폰 번호 정규식 
		var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
		// 주소 공백 체크 위해서
		var address = $("#inputDetail");


		
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
								$('#id_check').text('사용가능한 아아디 입니다.'); 
								$('#id_check').css('color', 'blue'); 
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
		$("#registerBtn").on("click",function(){
			var chk_Arr = new Array(6).fill(false);
			if(idJ.test($("#inputId").val())){
				console.log(idJ.test($("#inputId").val()));
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
				console.log(nameJ.test($("#inputName").val()));
				chk_Arr[2] = true;
			}else { 
				chk_Arr[2] = false; 
				alert('이름을 확인하세요.'); 
				return false;
			}
			//이메일 정규식
			if(mailJ.test($("#inputEmail").val())){
				console.log(mailJ.test($('#inputEmail').val()));
				chk_Arr[3] = true;	
			}else { 
				chk_Arr[3] = false; 
				alert('이메일을 확인하세요.'); 
				return false; 
			}
			//휴대전화 정규식
			if (phoneJ.test($("#inputPhone").val())) { 
				console.log(phoneJ.test($("#inputPhone").val())); 
				chk_Arr[4] = true; 
			} else { 
				chk_Arr[4] = false; 
				alert("휴대폰 번호를 확인하세요."); 
				return false; 
			}

			if(address.val() == ''){
				chk_Arr[5] = false;
				alert("주소를 확인하세요.");
				return false;
			}else{
				chk_Arr[5] = true;
			}
				
			//전체 유효성 검사 
			var validAll = true; 
			for(var i = 0; i < chk_Arr.length; i++){ 
				if(chk_Arr[i] == false){ 
					validAll = false; 
					} 
				}
			
			if(validAll == true){
				$.ajax({				  	
				  	type : "POST",
				  	url : "${hContext}/member/doInsert.do",
				  	dataType : "html",
				  	data : {
							"memberId":$("#inputId").val(),
							"memberPw":$("#inputPw").val(),
							"name":$("#inputName").val(),
							"email":$("#inputEmail").val(),
							"phone":$("#inputPhone").val(),
							"addrNum":$("#inputAddr1").val(),
							"addrRoad":$("#inputAddr2").val(),
							"addrDetail":$("#inputAddrDetail").val()
					  	},
					  	success:function(data){
				  	
							alert("환영합니다.");
							window.location.href = "${hContext}/member/homeBack.do";
						  	},
						error:function(data){
						    alert("아이디 혹은 이메일 중복");
							}
				  });
			}
		}); //registerBtn function

		$("#inputPw").blur(function() { 
			if (pwJ.test($("#inputPw").val())) { 
				console.log("true"); 
				$('#pw_check').text("사용할 수 있는 비밀번호 입니다.");
				$("#pw_check").css("color", "blue"); 
			} else { 
				console.log("false"); 
				$('#pw_check').text("4~12자의 숫자 , 문자로만 사용 가능합니다."); 
				$('#pw_check').css("color", "red"); 
				} 
			}); 
		//1~2 패스워드 일치 확인 
		$("#inputPwChk").blur(function() { 
			if ($("#inputPw").val() != $(this).val()) { 
				$("#pw2_check").text("비밀번호가 일치하지 않습니다."); 
				$("#pw2_check").css("color", "red"); 
			} else { 
				$("#pw2_check").text("비밀번호가 일치 합니다.");
				$("#pw2_check").css("color", "blue"); 
				} 
			}); 
		//이름에 특수문자 들어가지 않도록 설정 
		$("#inputName").blur(function() { 
			if (nameJ.test($(this).val())) { 
				console.log(nameJ.test($(this).val())); 
				$("#name_check").text(''); 
			} else { 
				$("#name_check").text("한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)"); 
				$("#name_check").css("color", "red"); 
				} 
			});
		//이메일 양식 확인
		 $("#inputEmail").blur(function() { 
			 if (mailJ.test($(this).val())) { 
				 $("#email_check").text("사용할 수 있는 이메일 입니다.");
				 $("#email_check").css("color", "blue"); 
			 } else { $("#email_check").text("이메일 양식을 확인해주세요."); 
			 	 $("#email_check").css("color", "red"); 
			 	 } 
		 	 });
	 	 //휴대전화
	 	 $("#inputPhone").blur(function(){ 
		 	 if(phoneJ.test($(this).val())){ 
			 	 console.log(nameJ.test($(this).val())); 
			 	 $("#phone_check").text(''); 
			 } else { $("#phone_check").text("휴대폰번호를 확인해주세요 "); 
			 	 $("#phone_check").css("color", "red"); 
			 	 } 
		 	 });

	 	function execPostCode() {
	         new daum.Postcode({
	             oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	 
	                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	 
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	                if(fullRoadAddr !== ''){
	                    fullRoadAddr += extraRoadAddr;
	                }
	 
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                console.log(data.zonecode);
	                console.log(fullRoadAddr);
	                $("[name=inputAddr1]").val(data.zonecode);
	                $("[name=inputAddr2]").val(fullRoadAddr);
	                
	             }
	         }).open();
	     }
		
		</script>
</body>
</html>