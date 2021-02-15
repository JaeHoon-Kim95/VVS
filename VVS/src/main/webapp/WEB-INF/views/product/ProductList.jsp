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

</head>

<body>
	<%@ include file="/WEB-INF/views/main/topbar.jsp" %>
	<!-- Page Content -->
	<div class="container">
<br><br><br><br>
		<form class="form-inline" name="searchData" id="searchData" action="/shop/product/doSearch.do" method="get">
			<input type="hidden" id="pageSize" name="pageSize" value="10">
			<input type="hidden" id="pageNum" name="pageNum" value="1">
			<input type="hidden" id="minPrice" name="minPrice" value="0">
			<input type="hidden" id="maxPrice" name="maxPrice" value="0">
			<input class="form-control mr-sm-2" id="searchWord" name="searchWord" type="search" placeholder="Search" aria-label="Search" value="${searchWord }">
    		<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</form>

		<hr>
		<div class="row">
			<c:forEach var="list" items="${productList }">
				<c:forEach var="imgList" items="${imgList }">
				<c:set var="productNumL" value="${list.productNum}"/>
				<c:set var="productNumI" value="${imgList.productNum}"/>	
				<c:if test="${productNumL eq productNumI}">
				<div class="col-lg-4 col-md-6 mb-4">				
					<div class="card h-100">					
						<a href="/shop/product/moveToProductDetail.do?productNum=${list.productNum }"><img class="card-img-top" height="400"
							src="${hContext}/${imgList.thunImg}" alt=""></a>						
						<div class="card-body">
							<h4 class="card-title">
								<a href="/shop/product/moveToProductDetail.do?productNum=${list.productNum }"><c:out value="${list.productName }"/></a>
							</h4>
							<h5><c:out value="${list.price }"/> 원</h5>
							<p class="card-text"><c:out value="${list.categoryName }"/></p>
						</div>
						<div class="card-footer">
							<small class="text-muted"></small>
						</div>
					</div>				
				</div>
				</c:if>
				</c:forEach>
			</c:forEach>
			
			
			
			
		</div>
		<!-- row end -->
		<div class="row">
			<div class="mx-auto">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }" step="1">
							<c:choose>
								<c:when test="${i eq currentPageNum }"><li class="page-item disabled"><a class="page-link" href="#">${i }</a></li></c:when>
								<c:otherwise><li class="page-item"><a class="page-link" href="javascript:goPage(${i})">${i }</a></li></c:otherwise>
							</c:choose>
						</c:forEach>
					</ul>
				</nav>
			</div>
		</div>
		
		
		<div>
			<input class="btn btn-info" type="button" value="상품 등록" id="moveToproductRegistPage">
			<br><br><br><br><br>
		</div>
		
	</div>
	<!-- container end -->

	<!-- Bootstrap core JavaScript -->
	<script src="${hContext}/resources/vendor/jquery/jquery.min.js"></script>
	<script src="${hContext}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript">
	

		window.onload = function(){
			if (self.name != 'reload') {
		        self.name = 'reload';
		        self.location.reload(true);
		    }
		    else self.name = ''; 
		}
		
		$("#moveToproductRegistPage").on("click",function(){
				var goUrl = "/shop/product/moveToproductRegistPage.do";
				window.location.href = goUrl;
			})
		$("#searchBtn").on("click", function(){
				var frm = document.searchData;
				frm.submit();
			})
			
		function goPage(pageNum){
				$("#pageNum").val(pageNum);
				var frm = document.searchData;
				frm.submit();
			}
	</script>
</body>

</html> 