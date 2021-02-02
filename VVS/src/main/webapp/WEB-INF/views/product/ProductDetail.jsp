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
				    	<img alt="" class="rounded float-left" width="500" height="600" src="${hContext }/resources/img/randomImg.png">
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
				<small class="text-muted">카테고리><c:out value="${outVO.categoryNum }"/></small>
				</h4>
				<h2><strong><c:out value="${outVO.productName }"/></strong></h2>
				<br>
				<h4 id="priceTag"><c:out value="${outVO.price }"/></h4>
				<hr>
				
				<div id="semiInfoBox">
					<span><c:out value="${outVO.semiInfo }"/></span>
				</div>
				<hr>
				
				<!-- jquery로 class active를 찾아서 -->
				<div class="list-group" id="list-tab" role="tablist">
			      <a class="list-group-item list-group-item-light list-group-item-action active" id="list-home-list" data-toggle="list" href="#list-home" role="tab" aria-controls="home">BLACK / S</a>
			      <a class="list-group-item list-group-item-light list-group-item-action" id="list-profile-list" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">BLACK / M</a>
			      <a class="list-group-item list-group-item-light list-group-item-action" id="list-messages-list" data-toggle="list" href="#list-messages" role="tab" aria-controls="messages">BLACK / L</a>
			      <a class="list-group-item list-group-item-light list-group-item-action" id="list-settings-list" data-toggle="list" href="#list-settings" role="tab" aria-controls="settings">WHITE / S</a>
			    </div>
				<hr>
				
				<div><h4>결제 금액 : 옵션 클릭하면 가격이 바뀌게</h4></div>
				
			</div>
			<!-- product detail -->
		</div>
		
		<!-- mainInfo -->
		<div>
		<br><br><br>
				<h1><c:out value="${outVO.mainInfo }"/></h1>
		</div>
		
		<br><br><br>
		
		
		
		
		<!-- 
		
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
			<label>옵션 리스트</label>
			<div id="optionList">
			
			</div>
			<hr>
			<form>
				<label>상품 번호 :</label>
				<input type="text" value="${outVO.productNum }" id="productNum"><br>
				<label>옵션 번호 : </label>
				<input type="text" id="optionSeq" name="optionSeq" value="">
				<label>갯수 : </label>
				<input type="text" id="qty" name="qty" value="1"><br>
				<input type="button" id="orderBtn" name="orderBtn" value="바로 주문">
				<input type="button" id="cartBtn" name="cartBtn" value="장바구니">
			</form>
			<br><br><br><br><br>
			 -->
	</div>
	<!-- container end -->

	<!-- Bootstrap core JavaScript -->
	<script src="${hContext}/resources/vendor/jquery/jquery.min.js"></script>
	<script src="${hContext}/resources/vendor/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript">

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
					$("#optionList").empty();
					var html = "";
					var html2 = "";
					$.each(data, function(i, value) {
							html += "<p>options seq : "+value.seq+"</p>";
							html += "<p>options color : "+value.color+"</p>";
							html += "<p>options sizes : "+value.sizes+"</p>";
							html += "<p>options qty : "+value.qty+"</p>";
							html += "<p>options productNum : " + value.productNum + "</p>";
							html += "<br>"
						});
					$("#optionList").append(html);
	               }
			});

		}

	// --Load Options List
	
	//order(주문하기)
	$("#orderBtn").on("click",function(){
		alert("성공");
		var id = "jung123";
		$.ajax({
		    type:"POST",
		    url:"${hContext}/orders/doInsert.do",
		    dataType:"html", 
		    data:{
			    "memberId" : "${sessionScope.MemberVO.memberId }",
			    "productNum" : $("#productNum").val(),
			    "qty" : $("#qty").val()
		    },
		    success:function(data){ //성공
		    	alert("주문을 완료했습니다.");
		    	 //json 분리해서 변수
			       var jsonObj = JSON.parse(data);
			    
			       if(null !=jsonObj && jsonObj.regId=="1"){
			    	   location.reload();
			       }
		    },		       
		    error:function(xhr,status,error){
		     alert("error:"+error);
		    },
		    complete:function(data){
		    
		    }   
		  
		});//--ajax 
	});	
		
	//order(주문하기)	
	</script>
</body>

</html> 