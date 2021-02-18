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
	href="${hContext}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
</head>

<body>
	<%@ include file="/WEB-INF/views/main/topbar.jsp" %>

	<form name="toCartForm" action="/shop/cart/doInsertCart.do" method="get">
		<input type="hidden" value="${outVO.productNum }" id="productNum" name="productNum">
		<input type="hidden" value="0" id="optionSeq" name="optionSeq">
		<input type="hidden" value="1" id="qty" name="qty">
	</form>
	<form name="moveToUpdatePageForm" action="/shop/product/moveToUpdatePage.do" method="get">
		<input type="hidden" value="${outVO.productNum }" name="productNum">
		<input type="hidden" value="${imgDetail.thunImg }" name="thunImg">
	</form>
	
	<!-- Page Content -->
	<div class="container">
	<br><br><br><br>
		<div class="row">
			<!-- img box -->
			<div id="carouselImgBox" class="col">
				<div id="carouselControls" class="carousel slide" data-ride="carousel">
				  <ol class="carousel-indicators">
				    <li data-target="#carouselControls" data-slide-to="0" class="active"></li>
				    <li data-target="#carouselControls" data-slide-to="1"></li>
				    <li data-target="#carouselControls" data-slide-to="2"></li>
				  </ol>
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				    	<img alt="" class="rounded float-left" width="500" height="600" src="${hContext}/${imgDetail.thunImg}">
				    </div>
				    <div class="carousel-item">
				      <img alt="" class="rounded float-left" width="500" height="600" src="${hContext }/resources/img/randomImg2.png">
				    </div>
				    <div class="carousel-item">
				      <img alt="" class="rounded float-left" width="500" height="600" src="${hContext }/resources/img/randomImg3.png">
				    </div>
				  </div>
				  <a class="carousel-control-prev" href="#carouselControls" role="button" data-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="carousel-control-next" href="#carouselControls" role="button" data-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
				</div>
			</div>
			<!-- img box -->
			
			
			<div class="col-sm-1"></div>
			
			<!-- product detail -->
			<div class="col">
				<h4>
				<small class="text-muted">카테고리><c:out value="${categoryName }"/></small>
				</h4>
				<h2><strong><c:out value="${outVO.productName }"/></strong></h2>
				<br>
				<h4 id="priceTag"><c:out value="${outVO.price }"/></h4>
				<hr>
				
				<div id="semiInfoBox">
					<span><c:out value="${outVO.semiInfo }"/></span>
				</div>
				<hr>
			    
			    <label for="inlineFormCustomSelect">색상 및 사이즈</label>
			    <div class="form-group">
				    <div>
				      <select class="custom-select" id="inlineFormCustomSelect" onchange="changeOption();">
				        <option selected>색상 및 사이즈를 선택하세요</option>
				      </select>
				    </div>
				</div>
				<hr>
				
				<button id="doInsertCart" type="button" class="btn btn-block btn-lg btn-outline-info">장바구니 담기</button>
				<button id="orderBtn" type="button" class="btn btn-block btn-lg btn-outline-info">바로 구매</button>
				
				<c:choose>
					<c:when test="${sessionScope.MemberVO.auth eq 0 }">
						<button id="moveToUpdate" type="button" class="btn btn-block btn-lg btn-outline-info">수정</button>
					</c:when>
					<c:otherwise></c:otherwise>
				</c:choose>
			</div>
			<!-- product detail -->
		</div>
		
		<!-- mainInfo -->
		<div class="text-center">
		<br><br><br>
		<hr>
				<h2>상품 정보</h2>
				<br>
				<h3><c:out value="${outVO.mainInfo }"/></h3>
		</div>
		
		<br><br><br>
	</div>
	<!-- container end -->

	<!-- Bootstrap core JavaScript -->
	<script src="${hContext}/resources/vendor/jquery/jquery.min.js"></script>
	<script src="${hContext}/resources/vendor/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript">

	$("#moveToUpdate").on("click", function(){
			moveToUpdatePage();

		})
	
	function moveToUpdatePage(){
			
			var frm = document.moveToUpdatePageForm;
			frm.submit();
		}
	
	// Insert Cart
	$("#doInsertCart").on("click", function(){
			doInsertCart();
		});

	function doInsertCart(){
			// memberId(controller - session), productNum, qty, optionSeq
			var frm = document.toCartForm;

			var chkOption = $("#optionSeq").val();

			var cfm = confirm("장바구니에 담으시겠습니까?");

			if(!cfm){
					return;
				}
			
			if(chkOption == "0"){
					alert("색상 및 사이즈를 선택하세요!");
					return;
				}

			$.ajax({
			   type:"GET",
	           url:"${hContext}/cart/doInsertCart.do",
	           dataType:"html",
	           async: false,
	           data:{
	           		"productNum":$("#productNum").val(),
	           		"qty":$("#qty").val(),
	           		"optionSeq":$("#optionSeq").val()
	           },
	           success: function(data){
		           		alert("장바구니에 담겼어요!");
		           		var cfm2 = confirm("장바구니로 이동하시겠습니까?");
		           		if(cfm2){
								window.location.href = '/shop/cart/moveToCart.do';
			           		}
	               }
				});

			

		}
	
	function changeOption(){
		var value = $("#inlineFormCustomSelect").val();
		$("#optionSeq").val(value);
	}
	// -- Insert Cart
	
	// Load Options List
	window.onload = function(){
		doSelectListOptions();
		
		var priceTag = $("#priceTag").text();
		var price = priceTag.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');

		$("#priceTag").empty();
		$("#priceTag").text(price+" 원");
		
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
					var html = "";
					$.each(data, function(i, value) {

							html += "<option value='"+value.seq+"'>"+value.color+" / "+value.sizes+"</option>";
							
						});
					$("#inlineFormCustomSelect").append(html);
	               }
			});

		}

	// --Load Options List
	
	//order(주문하기)
	$("#orderBtn").on("click",function(){
		doInsertOrder();
	});	

	function doInsertOrder(){
		// memberId(controller - session), productNum, qty, optionSeq
		var frm = document.toCartForm;
	
		var chkOptions = $("#optionSeq").val();

		var cfms = confirm("주문 하시겠습니까?");

		if(!cfms){
				return;
			}
		
		if(chkOptions == "0"){
				alert("색상 및 사이즈를 선택하세요!");
				return;
			}

		$.ajax({
		   type:"GET",
           url:"${hContext}/cart/doInsertCart.do",
           dataType:"html",
           async: false,
           data:{
           		"productNum":$("#productNum").val(),
           		"qty":$("#qty").val(),
           		"optionSeq":$("#optionSeq").val()
           },
           success: function(data){
	           		window.location.href = "${hContext}/cart/doOrders.do";
               }
			});
	}
	
	//order(주문하기)	
	</script>
</body>

</html> 