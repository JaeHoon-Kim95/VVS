<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="hContext" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>HOONShop</title>

<!-- Bootstrap core CSS -->
<link
	href="${hContext}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${hContext}/resources/css" rel="stylesheet">

</head>

<body>
<%@ include file="/WEB-INF/views/main/topbar.jsp" %>
	<!-- Page Content -->
	<div class="container">
<br><br><br><br>
		
			<div>
			<label>categoryNum : </label>
				${outVO.categoryNum }
			</div>
			<div>
			<label>productName : </label>
				${outVO.productName }
			</div>
			<div>
			<label>price : </label>
				${outVO.price }
			</div>
			<div>
			<label>discountPrice : </label>
				${outVO.discountPrice }
			</div>
			<div>
			<label>mainInfo : </label>
				${outVO.mainInfo }
			</div>
			<div>
			<label>semiInfo : </label>
				${outVO.semiInfo }
			</div>
		
			<hr>
			<label>옵션 리스트</label>
			<div id="optionList">
			
			</div>
			<hr>
			<form>
				<label>상품 번호 :</label>
				<input type="text" value="${outVO.productNum }" id="productNum"><br>
				<label>옵션 번호 : </label>
				<input type="text" id="optionSeq" name="optionSeq" value="">
				<label>갯수 : </label>
				<input type="text" id="qty" name="qty" value="1"><br>
				<input type="button" id="orderBtn" name="orderBtn" value="바로 주문">
				<input type="button" id="cartBtn" name="cartBtn" value="장바구니">
			</form>
			<br><br><br><br><br>
			
	</div>
	<!-- container end -->

	<!-- Bootstrap core JavaScript -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript">

	// Load Options List
	window.onload = function(){
		doSelectListOptions();
	}

	function doSelectListOptions(){
		$.ajax({
			type:"GET",
	           url:"${hContext}/product/doOptionsList.do",
	           dataType:"json",
	           async: true,
	           data:{
	           		"productNum":$("#productNum").val()
	           },
	           success: function(data){
	                console.log("success!");
					$("#optionList").empty();
					var html = "";
					$.each(data, function(i, value) {
							html += "<p>options seq : "+value.seq+"</p>";
							html += "<p>options color : "+value.color+"</p>";
							html += "<p>options sizes : "+value.sizes+"</p>";
							html += "<p>options qty : "+value.qty+"</p>";
							html += "<p>options productNum : " + value.productNum + "</p>";
							html += "<br>"
						});
					$("#optionList").append(html);
	               }
			});

		}

	// --Load Options List
	
	//order(주문하기)
	$("#orderBtn").on("click",function(){
		alert("성공");
		var id = "jung123";
		$.ajax({
		    type:"POST",
		    url:"${hContext}/orders/doInsert.do",
		    dataType:"html", 
		    data:{
			    "memberId" : "${sessionScope.MemberVO.memberId }",
			    "productNum" : $("#productNum").val(),
			    "qty" : $("#qty").val()
		    },
		    success:function(data){ //성공
		    	alert("주문을 완료했습니다.");
		    	 //json 분리해서 변수
			       var jsonObj = JSON.parse(data);
			    
			       if(null !=jsonObj && jsonObj.regId=="1"){
			    	   location.reload();
			       }
		    },		       
		    error:function(xhr,status,error){
		     alert("error:"+error);
		    },
		    complete:function(data){
		    
		    }   
		  
		});//--ajax 
	});	
		
	//order(주문하기)	
	</script>
</body>

</html> 