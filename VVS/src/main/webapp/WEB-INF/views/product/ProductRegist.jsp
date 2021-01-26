<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="hContext" value="${pageContext.request.contextPath }"></c:set>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
		<!-- 
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
		-->
			<form name="registData" id="registData" action="/shop/product/doRegist.do" method="post">
				<label><strong>- 상품명*</strong></label><br>
				<input type="text" value="" placeholder="상품명을 입력해주세요." id="productName" name="productName"><br>
				<label><strong>- 판매 가격*</strong></label><br>
				<input type="text" value="" placeholder="가격을 입력해주세요." id="price" name="price"><br>
				<label><strong>- 상품 카테고리*</strong></label><br>
				<p>대분류 / 중분류 / 소분류 고를 때 마다 하위 항목 나오게 만들기</p>
				<input type="text" value="1" name="categoryNum" id="categoryNum" readonly><br>
				<label><strong>- 할인 유무</strong></label><br>
				<input type="text" value="0" name="discountRate" id="discountRate" readonly="readonly"><br>
				<label><strong>- 할인률</strong></label><br>
				<input type="text" value="0" name="discount" id="discount" readonly="readonly"><br>
				<label><strong>- 한 줄 설명</strong></label><br>
				<input type="text" value="" name="semiInfo" id="semiInfo" placeholder="한 줄 설명을 입력해주세요."><br>
				<label><strong>- 상세 설명</strong></label><br>
				<textarea rows="10" id="mainInfo" name="mainInfo" cols="80" placeholder="상세 설명을 입력해주세요!"></textarea><br>
				
			</form>
			<div id="">
				<label><strong>옵션(적어도 하나는 입력해 주세요!)</strong></label><br>
				<label>색상:</label><input type="text" id="color" name="optionsList[0].color">
				<label>사이즈:</label><input type="text" id="sizes" name="optionsList[0].sizes">
				<label>재고:</label><input type="text" id="qty" name="optionsList[0].qty">
				<input type="button" value="+">
				<p>+를 누르면 한칸씩 추가가 되도록. input 값 추가하고 javascript로 넣을 때 name에 input값으로 index를 바꾸면 되지 않을까</p>
				
			</div>
			<div>
				<label>option 갯수 : </label>
				<input type="text" id="optionsNum" name="optionsNum" value="1">
			</div>
			
		</div>
		<!-- row end -->
		<div>
			<input type="button" value="상품 등록" id="doRegist">
			<br><br><br><br>
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