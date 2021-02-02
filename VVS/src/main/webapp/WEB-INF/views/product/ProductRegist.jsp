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
			<form:form name="registData" id="registData" commandName="productVO" action="/shop/product/doRegistTest.do" method="post">
				<label><strong>- 상품명*</strong></label><br>
				<input type="text" value="" placeholder="상품명을 입력해주세요." id="productName" name="productName"><br>
				<label><strong>- 판매 가격*</strong></label><br>
				<input type="text" value="" placeholder="가격을 입력해주세요." id="price" name="price"><br>
				<label><strong>- 상품 카테고리*</strong></label><br>
				<!-- TODO -->
				<p>enum 쓰는 것보다 나중에 편의성을 위해 db 쓰는게 나은거 같기도 하고</p>
				<!-- TODO -->
				
				<input type="text" value="1" name="categoryNum" id="categoryNum" readonly><br>
				<label><strong>- 할인 유무</strong></label><br>
				<input type="text" value="0" name="discountRate" id="discountRate" readonly="readonly"><br>
				<label><strong>- 할인률</strong></label><br>
				<input type="text" value="0" name="discount" id="discount" readonly="readonly"><br>
				<label><strong>- 한 줄 설명</strong></label><br>
				<input type="text" value="" name="semiInfo" id="semiInfo" placeholder="한 줄 설명을 입력해주세요."><br>
				<label><strong>- 상세 설명</strong></label><p>나중에 게시판거 베껴서 글쓰기 형식 가져오자.</p><br>
				<textarea rows="10" id="mainInfo" name="mainInfo" cols="80" placeholder="상세 설명을 입력해주세요!"></textarea><br>
				
				<div id="optionsTable">
					<div id="1">
						<label><strong>옵션(적어도 하나는 입력해 주세요!)</strong></label>
						<input id="plusBtn" type="button" value="+"><input id="minusBtn" type="button" value="-"><br>
						<label>색상:</label><input type="text" id="color" name="optionsList[0].color">
						<label>사이즈:</label><input type="text" id="sizes" name="optionsList[0].sizes">
						<label>재고:</label><input type="text" id="qty" name="optionsList[0].qty">
					</div>
				</div>
				
				<input type='submit' value='바로 등록'>
				<br><br><br>
			</form:form>
			
			<div>
				<input type="hidden" id="optionsNum" name="optionsNum" value="1">
			</div>
			
		</div>
		<!-- row end -->
	</div>
	<!-- container end -->

	<!-- Bootstrap core JavaScript -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript">
	
		$(document).on("click","#plusBtn" ,function(){
				var optionsNum = $("#optionsNum").val();
				optionsNum *= 1;
				var html = "";
				html += "<div id="+(optionsNum + 1)+">";
				html += "<label>색상:</label><input type='text' name='optionsList["+optionsNum+"].color'>";
				html += "<label>사이즈:</label><input type='text' name='optionsList["+optionsNum+"].sizes'>";
				html += "<label>재고:</label><input type='text' name='optionsList["+optionsNum+"].qty'>";
				html += "</div>";
				$("#optionsTable").append(html);				
				
				$("#optionsNum").val(optionsNum + 1);
			});

		$(document).on("click","#minusBtn", function(){
				var optionsNum = $("#optionsNum").val();
				if(optionsNum == "1"){
						alert("적어도 하나의 옵션이 필요합니다!");
						return;
					}

				$("#"+optionsNum).detach();
				
				optionsNum *= 1;
				$("#optionsNum").val(optionsNum - 1);
			});
		
		$("#doRegist").on("click", function(){
				var frm = document.registData;
				frm.submit();
			})
		
	</script>
</body>

</html> 