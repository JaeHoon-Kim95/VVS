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
	<%@ include file="/WEB-INF/views/main/topbar.jsp" %>
	<%@ include file="/WEB-INF/views/main/sidebar.jsp" %>
	<!-- Page Content -->
	<div class="container">
	<br><br><br><br>
	<h1>상품 등록</h1>
	<hr>



		<div class="row">
			<form:form class="form-group" name="registData" id="registData" commandName="productVO" action="/shop/product/doRegistTest.do" method="post" autocomplete="off" enctype="multipart/form-data">
				<label><strong>- 상품명*</strong></label><br>
				<input class="form-control" type="text" value="" placeholder="상품명을 입력해주세요." id="productName" name="productName"><br>
				<label><strong>- 판매 가격*</strong></label><br>
				<input class="form-control" type="text" value="" placeholder="가격을 입력해주세요." id="price" name="price"><br>
				<label for="inlineFormCustomSelect">- 카테고리*</label>
				<div class="form-group">
				    <div>
				      <select class="custom-select" id="inlineFormCustomSelect" onchange="changeOption();">
				        <option selected value="0">카테고리를 선택하세요</option>
				        <c:forEach var="list" items="${categoryList }" varStatus="vs">
				        	<option value="${vs.index+1}">${categoryList[vs.index] }</option>
				        </c:forEach>
				      </select>
				    </div>
				</div>
				
				<input type="hidden" value="0" name="categoryNum" id="categoryNum" readonly><br>
				<label><strong>- 할인 유무</strong></label><br>
				<input class="form-control" type="text" value="0" name="discountRate" id="discountRate" readonly="readonly"><br>
				<label><strong>- 할인률</strong></label><br>
				<input class="form-control" type="text" value="0" name="discount" id="discount" readonly="readonly"><br>
				<label><strong>- 한 줄 설명</strong></label><br>		
				<input class="form-control" type="text" value="" name="semiInfo" id="semiInfo" placeholder="한 줄 설명을 입력해주세요."><br>
				<label><strong>- 상세 설명</strong></label>
				<input class="form-control" type="textarea" value="" name="mainInfo" id="mainInfo" placeholder="상세 설명을 입력해주세요.">
				
				<div id="optionsTable">
					<div id="1">
						<label><strong>옵션(적어도 하나는 입력해 주세요!)</strong></label>
						<input class="btn btn-info" id="plusBtn" type="button" value="+"><span>&nbsp;&nbsp;</span><input class="btn btn-info" id="minusBtn" type="button" value="-"><br>
						<hr>
						<div class="row">
							<div class="col">
								<label>색상</label>
								<input class="form-control" type="text" id="color" name="optionsList[0].color">
							</div>
							<div class="col">
								<label>사이즈</label>
								<input class="form-control" type="text" id="sizes" name="optionsList[0].sizes">
							</div>
							<div class="col">
								<label>수량</label>
								<input class="form-control" type="text" id="qty" name="optionsList[0].qty">
							</div>
						</div>
					</div>
				</div>
				
				<div class="inputArea">
				<label for="vvsImg">대표이미지</label>
				<input type="file" id="vvsImg" name="file" />
				<div class="select_img"><img src="" /></div>
				
				<script>
					$("#vvsImg").change(function(){
						if(this.files && this.files[0]) {
							var reader = new FileReader;
							reader.onload = function(data) {
								$(".select_img img").attr("src", data.target.result).width(500);								
							}
							reader.readAsDataURL(this.files[0]);
						}
					});
				</script>								
				
			</div>
				
				<hr>
				<input class="btn btn-info" type='submit' value='바로 등록'>
				<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
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

		function changeOption(){
				var changeValue = $("#inlineFormCustomSelect").val();
				$("#categoryNum").val(changeValue);

			}
		
		$(document).on("click","#plusBtn" ,function(){
				var optionsNum = $("#optionsNum").val();
				optionsNum *= 1;
				var html = "";
				html += "<div id="+(optionsNum + 1)+">";
				html += "<div class='row'>";
				html += "<div class='col'>";
				html += "<label>색상</label>";
				html += "<input class='form-control' type='text' name='optionsList["+optionsNum+"].color'>";
				html += "</div>";
				html += "<div class='col'>";
				html += "<label>사이즈</label>";
				html += "<input class='form-control' type='text' name='optionsList["+optionsNum+"].sizes'>";
				html += "</div>";
				html += "<div class='col'>";
				html += "<label>수량</label>";
				html += "<input class='form-control' type='text' name='optionsList["+optionsNum+"].qty'>";
				html += "</div>";
				html += "</div>";
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
	<%@ include file="/WEB-INF/views/main/footer.jsp" %>
</body>

</html> 