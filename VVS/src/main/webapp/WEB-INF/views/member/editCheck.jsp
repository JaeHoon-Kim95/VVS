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
<%@ include file="/WEB-INF/views/main/sidebar.jsp" %>
	<div style="text-align: center;" class="container">
		<h1>SIGN IN</h1>
		<hr>
		<input type="hidden" value="${sessionScope.MemberVO.getMemberId()}" id="deleteMemberId"/>
		<input type="hidden" value="${sessionScope.MemberVO.getMemberPw()}" id="checkMemberPw"/>
		<c:choose>
		  	<c:when test='${null != sessionScope.MemberVO}'>
				<div class="contents text-center">
					<div class="col-sm-6 col-md-offset-10" >
						<div> 
							<label for="inputPw">비밀번호</label> 
							<input type="password" class="form-control" id="inputPw" name="inputPw" placeholder="PASSWORD"> 			
						</div>
							<input style="width:150px; background-color:black; margin:5px;" class="btn btn-primary btn-lg" type="button" value="뒤로가기" id="backBtn">
							<input style="width:150px; background-color:black; margin:5px;" class="btn btn-primary btn-lg" type="button" value="수정하기" id="editBtn">				
					</div>
							<input style="width:300px; background-color:black; margin:5px;" class="btn btn-primary btn-lg" type="button" value="탈퇴하기" id="deleteBtn">
				</div>
			</c:when>
			<c:otherwise>
				<script type="text/javascript">
					window.location.href = "${hContext}/member/loginPage.do";
  					alert("로그인이 필요합니다.");
				</script>
			</c:otherwise>
		</c:choose>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript">
	var sessionPw = $("#checkMemberPw");
    var sessionId = $("#deleteMemberId");
	
	$("#backBtn").on("click",function(){
		window.location.href = "${hContext}/member/homeBack.do";
	});

	$("#editBtn").on("click",function(){
		if($("#checkMemberPw").val() == $("#inputPw").val()){
			window.location.href = "${hContext}/member/memberEdit.do";			
		}else{
			alert("비밀번호를 확인하세요.");
		}
	});
	$("#deleteBtn").on("click",function(){
		if($("#checkMemberPw").val() == $("#inputPw").val()){
			if(confirm("탈퇴 하시겠습니까?")){			
				deleteMember();
				window.location.href = "${hContext}/member/homeBack.do";
			}else{
				alert("취소하였습니다.");
				window.location.href = "${hContext}/member/editCheck.do";			
			}
		}else{
			alert("비밀번호를 확인하세요.");
		}	
	});
	function deleteMember(){				
		$.ajax({
			type : "POST",
			url : "${hContext}/member/doDelete.do",
			dataType : "html",
				success:function(){
					if(flag = 1){
					alert("탈퇴되었습니다.");		
					}		
				},
				error:function(){					
				}
			});	
		}		


	</script>

</body>
</html>