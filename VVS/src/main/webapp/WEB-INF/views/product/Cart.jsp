<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="hContext" value="${pageContext.request.contextPath }"></c:set>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
	<!-- Page Content -->
	<div class="container">
<br><br><br><br>
			<div>장바구니</div>
			<hr>
			<label>품목들</label>
			<form:form id="cartList" commandName="cartVO" action="/shop/cart/doOrder.do">
			
			</form:form>
			<hr>
			<br><br><br><br><br>
			
	</div>
	<!-- container end -->

	<!-- Bootstrap core JavaScript -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript">

	$("#orderBtn").on("click", function(){
			console.log("order start");

			var bypass = confirm("주문하시겠습니까?");
			if(bypass != true){
					return;
				}

			console.log("bypass");

			var frm = document.cartList;
			frm.submit();
		})
	
	// Load cart List
	window.onload = function(){
		doSelectListCart();
	}

	function doSelectListCart(){
		$.ajax({
			type:"GET",
	           url:"${hContext}/cart/doCartList.do",
	           dataType:"json",
	           async: true,
	           data:{
	           		
	           },
	           success: function(data){
	                console.log("success!");
					$("#cartList").empty();
					var html = "";
					$.each(data, function(i, value) {

							html += "<label>seq:</label>";
							html += "<input type='text' name='cartList["+i+"].seq' value='"+value.seq+"'><br>";
							html += "<label>memberId:</label>";
							html += "<input type='text' name='cartList["+i+"].memberId' value='"+value.memberId+"'><br>";
							html += "<label>sizes:</label>";
							html += "<input type='text' name='cartList["+i+"].sizes' value='"+value.sizes+"'><br>";
							html += "<label>color:</label>";
							html += "<input type='text' name='cartList["+i+"].color' value='"+value.color+"'><br>";
							html += "<label>qty:</label>";
							html += "<input type='text' name='cartList["+i+"].qty' value='"+value.qty+"'><br>";
							html += "<label>productNum:</label>";
							html += "<input type='text' name='cartList["+i+"].productNum' value='"+value.productNum+"'><br>";
							html += "<label>optionSeq:</label>";
							html += "<input type='text' name='cartList["+i+"].optionSeq' value='"+value.optionSeq+"'><br>";
							html += "<label>price:</label>";
							html += "<input type='text' name='cartList["+i+"].price' value='"+value.price+"'><br>";
							html += "<hr>"
								
						});
					html += "<p>바로 주문 버튼을 누르면 컨트롤러로 CartVO List가 들어갑니다. CartController에 doOrder 쪽에 보시면 될 듯</p>"
					html += "<input type='submit' value='바로 주문'>";
					$("#cartList").append(html);
	               }
			});

		}

	// --Load cart List
		
	</script>
</body>

</html> 