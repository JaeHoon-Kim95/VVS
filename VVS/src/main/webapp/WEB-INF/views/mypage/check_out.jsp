<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="hContext" value="${pageContext.request.contextPath }" ></c:set> 
<%@page import="com.vvs.shop.orders.OrdersVO" %>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">	
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

	<title>HOONSHOP</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${hContext}/resources/css/bootstrap.min.css" >
    <link rel="stylesheet" href="${hContext}/resources/css/font-awesome.min.css" >
    <link rel="stylesheet" href="${hContext}/resources/css/themify-icons.css" >
    <link rel="stylesheet" href="${hContext}/resources/css/elegant-icons.css" >
    <link rel="stylesheet" href="${hContext}/resources/css/owl.carousel.min.css" >
    <link rel="stylesheet" href="${hContext}/resources/css/nice-select.css" >
    <link rel="stylesheet" href="${hContext}/resources/css/jquery-ui.min.css" >
    <link rel="stylesheet" href="${hContext}/resources/css/slicknav.min.css" >
    <link rel="stylesheet" href="${hContext}/resources/css/style.css" >
    <style>
	body{ padding-top:70px;
		  padding-left:200px;}
	</style>
</head>

<body>
	<%@ include file="/WEB-INF/views/mypage/mypage_sidebar.jsp" %>
	<%@ include file="/WEB-INF/views/main/topbar.jsp" %>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>


    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text product-more">
                        <a href="${hContext}/main/index.do"><i class="fa fa-home"></i> 홈</a>
                        <a href="${hContext}/cart/moveToCart.do">장바구니</a>
                        <span>주문</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->

    <!-- Shopping Cart Section Begin -->
    <section class="checkout-section spad">
        <div class="container">
            <form action="#" class="checkout-form">
                <div class="row">
                    <div class="col-lg-6">
                        
                        <h4>수령자 정보</h4>
                        <div class="row">
                            <div class="col-lg-6">
                                <label for="fir">이름<span>*</span></label>
                                <input type="text" id="fir">
                            </div>
                            <div class="col-lg-12">
                                <label for="cun-name">배송지 주소</label>
                                <input type="text" id="cun-name">
                            </div>
                            <div class="col-lg-12">
                                <label for="cun">Country<span>*</span></label>
                                <input type="text" id="cun">
                            </div>
                            <div class="col-lg-12">
                                <label for="street">Street Address<span>*</span></label>
                                <input type="text" id="street" class="street-first">
                                <input type="text">
                            </div>
                            <div class="col-lg-12">
                                <label for="zip">Postcode / ZIP (optional)</label>
                                <input type="text" id="zip">
                            </div>
                            <div class="col-lg-12">
                                <label for="town">Town / City<span>*</span></label>
                                <input type="text" id="town">
                            </div>
                            <div class="col-lg-6">
                                <label for="email">이메일주소<span>*</span></label>
                                <input type="text" id="email">
                            </div>
                            <div class="col-lg-6">
                                <label for="phone">핸드폰번호<span>*</span></label>
                                <input type="text" id="phone">
                            </div>
                            <div class="col-lg-12">
                                <div class="create-item">
                                    <label for="acc-create">
                                        Create an account?
                                        <input type="checkbox" id="acc-create">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        
                        <div class="place-order">
                            <h4>상품정보</h4>
                            <div class="order-total">
                                <ul class="order-table">
                                    <li>상품정보 <span>가격</span></li>
                                     <c:choose>
							        	<c:when test="${outList.size()>0 }">
							        		<c:forEach var="outVO" items="${outList}" >  
							        		<c:set var="totalsum" value="${outVO.price * outVO.qty}" />
										    	<li class="fw-normal">${outVO.productName} x ${outVO.qty}
										    	<br/> color : ${outVO.color}, size : ${outVO.sizes} 
										    	<span id="price"> <c:out value="${totalsum}"/>  </span></li> 		        			
							        		</c:forEach>
							        	</c:when>
							        	<c:otherwise>
							        		<tr>
										    		<td class="text-center" colspan="99">주문현황이 없습니다.</td>
										    </tr>  		
							        	</c:otherwise>
							        </c:choose>
                                    <li class="total-price">총가격 <span>$240.00</span></li>
                                </ul>
                                <div class="payment-check">
                                    <div class="pc-item">
                                        <label for="pc-check">
                                            Cheque Payment
                                            <input type="checkbox" id="pc-check">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                    <div class="pc-item">
                                        <label for="pc-paypal">
                                            Paypal
                                            <input type="checkbox" id="pc-paypal">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                </div>
                                <div class="order-btn">
                                    <button type="submit" class="site-btn place-btn">주문하기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>
    <!-- Shopping Cart Section End -->

    

    <%@ include file="/WEB-INF/views/main/footer.jsp" %> 

    <!-- Js Plugins -->
    <script src="${hContext}/resources/js/jquery-3.3.1.min.js"></script>
    <script src="${hContext}/resources/js/bootstrap.min.js"></script>
    <script src="${hContext}/resources/js/jquery-ui.min.js"></script>
    <script src="${hContext}/resources/js/jquery.countdown.min.js"></script>
    <script src="${hContext}/resources/js/jquery.nice-select.min.js"></script>
    <script src="${hContext}/resources/js/jquery.zoom.min.js"></script>
    <script src="${hContext}/resources/js/jquery.dd.min.js"></script>
    <script src="${hContext}/resources/js/jquery.slicknav.js"></script>
    <script src="${hContext}/resources/js/owl.carousel.min.js"></script>
    <script src="${hContext}/resources/js/main.js"></script>
</body>

</html>