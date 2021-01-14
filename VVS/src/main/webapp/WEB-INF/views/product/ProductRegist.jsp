<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="hContext" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE html>
<html>

<head>

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
	<h1>Regist Page</h1>



		<div class="row">
			<form name="registData" id="registData" action="/shop/product/doRegist.do" method="post">
				<label>카테고리 구분</label>
				<input type="text" name="categoryNum" id="categoryNum">

				<label>상품 이름</label>
				<input type="text" name="productName" id="productName">

				<label>가격</label>
				<input type="text" name="price" id="price">

				<label>할인율</label>
				<input type="text" name="discountRate" id="discountRate">

				<label>할인 유무</label>
				<input type="text" name="discount" id="discount">
				
				<label>간단 설명</label>
				<input type="text" name="semiInfo" id="semiInfo">
				
				<label>상세 설명</label>
				<input type="text" name="mainInfo" id="mainInfo">
			</form>
		</div>
		<!-- row end -->
		<div>
			<input type="button" value="상품 등록" id="doRegist">
		</div>
	</div>
	<!-- container end -->

	<!-- Bootstrap core JavaScript -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript">
		$("#doRegist").on("click", function(){
				var frm = document.registData;
				frm.submit();
			})
		
	</script>
</body>

</html> 