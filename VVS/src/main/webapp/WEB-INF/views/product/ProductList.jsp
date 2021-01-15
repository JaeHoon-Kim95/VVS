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
		<form name="searchData" id="searchData" action="/shop/product/doSearch.do" method="get">
			<label>pageSize : </label><input type="text" id="pageSize" name="pageSize" value="3">
			<label>pageNum : </label><input type="text" id="pageNum" name="pageNum" value="1">
			<label>searchWord : </label><input type="text" id="searchWord" name="searchWord">
			<label>minPrice : </label><input type="text" id="minPrice" name="minPrice" value="0">
			<label>maxPrice : </label><input type="text" id="maxPrice" name="maxPrice" value="0">
			<label>검색 버튼</label><input type="button" id="searchBtn" name="searchBtn" value="검색">
		</form>

		<hr>
		<div class="row">

			<c:forEach var="list" items="${productList }">
				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="/shop/product/moveToProductDetail.do?productNum=${list.productNum }"><c:out value="${list.productName }"/></a>
							</h4>
							<h5><c:out value="${list.price }"/></h5>
							<p class="card-text"><c:out value="${list.categoryNum }"/></p>
						</div>
						<div class="card-footer">
							<small class="text-muted">&#9733; &#9733; &#9733; &#9733;
								&#9734;</small>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
		<!-- row end -->
		<div>
			<input type="button" value="상품 등록" id="moveToproductRegistPage">
		</div>
	</div>
	<!-- container end -->

	<!-- Bootstrap core JavaScript -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript">
		$("#moveToproductRegistPage").on("click",function(){
				var goUrl = "/shop/product/moveToproductRegistPage.do";
				window.location.href = goUrl;
			})
		$("#searchBtn").on("click", function(){
				var frm = document.searchData;
				frm.submit();
			})
	</script>
</body>

</html> 