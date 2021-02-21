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
  <link href="${hContext}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


</head>

<body>
	<%@ include file="/WEB-INF/views/main/topbar.jsp" %>
	
	<div class="container">
		<br><br><br><br>
		<h1>상품 수정</h1>
		<hr>
		
		<div class="row">
			<form:form class="form-group" name="updateData" id="updateData" commandName="productVO" action="/shop/product/doUpdate.do" method="post">
				<label><strong>- 상품명*</strong></label><br>
				<input class="form-control" type="text" value="${productVO.productName }" placeholder="상품명을 입력해주세요." id="productName" name="productName"><br>
				<label><strong>- 판매 가격*</strong></label><br>
				<input class="form-control" type="text" value="${productVO.price }" placeholder="가격을 입력해주세요." id="price" name="price"><br>
				<label for="inlineFormCustomSelect">- 카테고리*</label>
				<input class="form-control" type="text" value="${categoryName }" name="categoryNum" id="categoryNum" readonly><br>
				<label><strong>- 할인 유무</strong></label><br>
				<input class="form-control" type="text" value="0" name="discountRate" id="discountRate" readonly="readonly"><br>
				<label><strong>- 할인률</strong></label><br>
				<input class="form-control" type="text" value="0" name="discount" id="discount" readonly="readonly"><br>
				<label><strong>- 한 줄 설명</strong></label><br>
				<input class="form-control" type="text" value="${productVO.semiInfo }" name="semiInfo" id="semiInfo" placeholder="한 줄 설명을 입력해주세요."><br>
				<label><strong>- 상세 설명</strong></label><p>나중에 게시판거 베껴서 글쓰기 형식 가져오자.</p>
				<textarea class="form-control" rows="10" id="mainInfo" name="mainInfo" cols="80" placeholder="상세 설명을 입력해주세요!">${productVO.mainInfo }</textarea><br>
				<input class="btn btn-info" type='submit' value='수정'>
				<br><br><br><br><br><br><br><br><br>
				<input type="hidden" value="${productVO.productNum }" name="productNum">
			</form:form>
			
		
		</div>	
		
	
	</div>

	<!-- Bootstrap core JavaScript -->
	<script src="${hContext}/resources/vendor/jquery/jquery.min.js"></script>
	<script src="${hContext}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript">


	
	</script>
	<%@ include file="/WEB-INF/views/main/footer.jsp" %>
</body>

</html> 