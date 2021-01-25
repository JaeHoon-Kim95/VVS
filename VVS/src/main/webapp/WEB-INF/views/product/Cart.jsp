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
	<!-- Page Content -->
	<div class="container">
<br><br><br><br>
			<h1>장바구니</h1><br>
			<form:form id="cartList" commandName="cartVO" action="/shop/cart/doOrder.do">
			<table class="table table-hover" id="cartTable">
				<thead>
					<tr>
						<th class="text-center">이미지</th>
						<th class="text-center">상품명</th>
						<th class="text-center">사이즈</th>
						<th class="text-center">색깔</th>
						<th class="text-center">가격</th>
						<th class="text-center">갯수</th>
						<th class="text-center">가격</th>
						<th></th>
					</tr>
				</thead>
				<tbody class="text-center" id="cartTableBody">
					
				</tbody>
			</table>
			
			<p>바로 주문 버튼을 누르면 컨트롤러로 CartVO List가 들어갑니다. CartController에 doOrder 쪽에 보시면 될 듯</p>
			<input type='submit' value='바로 주문'>
			</form:form>
			<hr>
			
			
			
			
			<br><br><br><br><br>
			
	</div>
	<!-- container end -->

	<!-- Bootstrap core JavaScript -->
	<script src="${hContext}/resources/vendor/jquery/jquery.min.js"></script>
	<script src="${hContext}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript">

	// doDelete Cart
	function doDeleteCart(ths){
			console.log("doDelete");
			var cnfrm = confirm("항목을 삭제하시겠습니까?");
			console.log("cnfrm : " + cnfrm);
			if(cnfrm){
					var cartSeq = $(ths).parent().find("input:eq(8)");
					console.log("cartSeq : " + cartSeq.val());
					$.ajax({
						type:"GET",
				           url:"${hContext}/cart/doDeleteCart.do",
				           dataType:"json",
				           async: false,
				           data:{
				           		"seq":cartSeq.val()
				           },
				           success: function(data){
				                console.log("Delete Success!");
				                
				               }
						});
				} else {
					return;
					}
			doSelectListCart();
		}
	// --doDelete Cart
	
	// 갯수 더하고 빼기
	function fnCalCount(type, ths){
		// qty before btn clicked
	    var tmp = $(ths).parent("td").find("span"); 
	    
	    // qty after btn clicked(input box)
		var inputBox = $(ths).parent().parent().find("input:eq(5)"); 

		// current total price
		var priceBox = $(ths).parent().parent().find("td:eq(6)").find("span"); 

		// current price
		var currentPrice = $(ths).parent().parent().find("td:eq(4)").find("span");
		
	    if(type=='p'){
				var tmp2 = tmp.text();
				var tmp3 = tmp.text();
				var crtP = currentPrice.text();
				crtP *= 1;
				tmp2 *= 1;
				tmp2 += 1;
				tmp3 *= 1;
				tmp.text(tmp2);
				inputBox.val(tmp2);
				priceBox.text(crtP*tmp2);
				var totalPrice = $("#totalPrice").text();
				totalPrice *= 1;
				totalPrice = totalPrice - (tmp3 * crtP) + (tmp2 * crtP);
				$("#totalPrice").text(totalPrice);
		    } else if(type=='m'){
				var tmp2 = tmp.text();
				var tmp3 = tmp.text();
				var crtP = currentPrice.text();
				crtP *= 1;
				tmp2 *= 1;
				tmp2 -= 1;
				tmp3 *= 1;
				if(tmp2 < 1){
						alert("1개 이상으로 지정해주세요!");
						return;
					}
				tmp.text(tmp2);
				inputBox.val(tmp2);
				var tmpPriceBox = crtP*tmp2;
				priceBox.text(tmpPriceBox);
				var totalPrice = $("#totalPrice").text();
				totalPrice *= 1;
				totalPrice = totalPrice - (tmp3 * crtP) + (tmp2 * crtP);
				$("#totalPrice").text(totalPrice);
			}
	}
	// --갯수 더하고 빼기

	// 주문 버튼 클릭
	$("#orderBtn").on("click", function(){
			console.log("order start");

			var bypass = confirm("주문하시겠습니까?");
			if(bypass != true){
					return;
				}

			console.log("bypass");

			var frm = document.cartList;
			frm.submit();
		})
	// --주문 버튼 클릭
	
	// Load cart List
	window.onload = function(){
		doSelectListCart();
	}

	function doSelectListCart(){
		$.ajax({
			type:"GET",
	           url:"${hContext}/cart/doCartList.do",
	           dataType:"json",
	           async: false,
	           data:{
	           		
	           },
	           success: function(data){
	                console.log("success!");
					$("#cartTableBody").empty();
					var html = "";
					var html2 = "";
					var totalPriceBox = 0;
					$.each(data, function(i, value) {
							html += "<tr>";
							html += "<td>사진</td>";
							html += "<td>"+value.productName+"</td>";
							html += "<td>"+value.sizes+"</td>";
							html += "<td>"+value.color+"</td>";
							html += "<td><span>"+value.price+"</span></td>";
							html += "<td><button type ='button' onclick=\"fnCalCount('p',this);\">+</button><span>"+value.qty+"</span><button type='button' onclick=\"fnCalCount('m', this);\">-</button></td>";
							var tmpPrice = value.price*1;
							var tmpQty = value.qty*1;
							html += "<td><span name='totalPriceSpan'>"+ (tmpPrice * tmpQty) + "</span></td>";
							html += "<td><input type='button' value='X' onclick=\"doDeleteCart(this);\"<td>";
							html += "<input type='hidden' name='cartList["+i+"].productName' value='"+value.productName+"' readonly>";
							html += "<input type='hidden' name='cartList["+i+"].sizes' value='"+value.sizes+"' readonly>";
							html += "<input type='hidden' name='cartList["+i+"].color' value='"+value.color+"' readonly>";
							html += "<input type='hidden' name='cartList["+i+"].price' value='"+value.price+"' readonly>";
							html += "<input type='hidden' name='cartList["+i+"].qty' value='"+value.qty+"'>";
							html += "<input type='hidden' name='cartList["+i+"].optionSeq' value='"+value.optionSeq+"' readonly>";
							html += "<input type='hidden' name='cartList["+i+"].productNum' value='"+value.productNum+"' readonly>";
							html += "<input type='hidden' name='cartList["+i+"].seq' value='"+value.seq+"' readonly>";
							html += "<input type='hidden' name='cartList["+i+"].memberId' value='"+value.memberId+"' readonly>";
							html += "</tr>";
							var totalPrice = tmpPrice * tmpQty;
							totalPriceBox += (totalPrice*1);
							html2 = "<tfoot class='text-right' id='cartTableFooter'><tr><td></td><td></td><td></td><td></td><td></td><td> Total Price : <span id='totalPrice'>"+totalPriceBox+"</span> 원</td><td></td><td></td></tr></tfoot>";
						});
					$("#cartTableBody").append(html);
					$("#cartTableFooter").detach();
					$("#cartTable").append(html2);
	               }
			});

		}

	// --Load cart List
		
	</script>
</body>

</html> 