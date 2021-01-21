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
			
			<label>媛��닔</label><input type="text" value="1"><br>
			<input type="button" value="二쇰Ц�븯湲�"><br>
			<input type="button" value="�옣諛붽뎄�땲 異붽�">
	</div>
	<!-- container end -->

	<!-- Bootstrap core JavaScript -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript">

	
		
	</script>
</body>

</html> 