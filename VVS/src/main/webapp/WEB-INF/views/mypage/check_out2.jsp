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
                        <input type="radio" style="width:20px;height:20px;border:1px;" name="chk_info" id="address_btn2" value="기본 수령지">기본 수령자 정보
                        <input type="radio" style="width:20px;height:20px;border:1px;" name="chk_info" id="address_btn" value="수령지 변경">새로운 수령자 정보 입력하기
                       
                        <div class="row">
                            <div class="col-lg-6">
                                <label for="fir">이름<span>*</span></label>
                                <input type="text" id="inputName" value="${sessionScope.MemberVO.getName()}">
                            </div>
                            
                            <div class="col-lg-6">
                                <label for="email">이메일주소<span>*</span></label>
                                <input type="text" id="inputEmail" value="${sessionScope.MemberVO.getEmail()}">
                            </div>
                            
                            <div class="col-lg-6">
                                <label for="phone">핸드폰번호<span>*</span></label>
                                <input type="text" id="inputPhone" value="${sessionScope.MemberVO.getPhone()}">
                            </div>
                            
                            <!-- 우편번호, 도로명, 상세주소 --> 
                            <div class="form-group"> 
								<input class="form-control" style="width: 40%; display: inline;" value="${sessionScope.MemberVO.getAddrNum()}" name="inputAddr1" id="inputAddr1" type="text" readonly="readonly"/> 
								<button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button> 
							</div> 
							<div class="form-group"> 
								<input class="form-control" style="top: 5px;" value="${sessionScope.MemberVO.getAddrRoad()}" name="inputAddr2" id="inputAddr2" type="text" readonly="readonly" /> 
							</div> 
							<div class="form-group"> 
								<input class="form-control" value="${sessionScope.MemberVO.getAddrDetail()}" name="inputAddrDetail" id="inputAddrDetail" type="text"/> 
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
							        		<c:set var="TotalSum" value="0" />
							        		<c:forEach var="cartout" items="${cartOut}" varStatus="status">  
							        		<c:set var="totalsum" value="${cartout.price * cartout.qty}" />							        		
							        		<a id="productNum" name="productNum" style="display: none"><c:out value="${cartout.productNum}" /></a>
							        		<a id="qty" name="qty" style="display: none"><c:out value="${cartout.qty}" /></a>							        		
										    	<li class="fw-normal">
										    	<c:forEach var="fileout" items="${fileOut}">
						    						<c:if test="${fileout.productNum == cartout.productNum}">
   						 								<img alt="" class="rounded float-left" width="50" height="50" src="${hContext}/${FileVO.thunImg}">
						    						</c:if>	
						    					</c:forEach>
						    					<br/> ${cartout.productName} x ${cartout.qty}
										    	<br/> color : ${cartout.color}, size : ${cartout.sizes} 
										    	<span id="price"> <c:out value="${totalsum}원"/>  </span></li>
										    <c:set var="TotalSum" value="${TotalSum+totalsum }" /> 		        			
							        		</c:forEach>
							        	</c:when>
							        	<c:otherwise>
							        		<tr>
										    		<td class="text-center" colspan="99">주문현황이 없습니다.</td>
										    </tr>  		
							        	</c:otherwise>
							        </c:choose>
                                    <li class="total-price">총가격 <span><c:out value="${TotalSum}원"/></span></li>
                                </ul>
                                <div class="order-btn">
                                    <button type="button" class="site-btn place-btn" id="order_btn">주문하기</button>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript">
	var empJ = /\s/g;  
	// 이름 정규식 
	var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/; 
	// 이메일 검사 정규식 
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/; 
	// 휴대폰 번호 정규식 
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	// 주소 공백 체크 위해서
	var address = $("#inputDetail");

	//수령자 초기화 이벤트
	$("#address_btn").on("click",function(){
		$('#inputName').val('');
		$('#inputEmail').val('');
		$('#inputPhone').val('');
		$('#inputAddr1').val('');
		$('#inputAddr2').val('');
		$('#inputAddrDetail').val('');

	});


	//기본 수령자 이벤트
	$("#address_btn2").on("click",function(){
		$('#inputName').val('${sessionScope.MemberVO.getName()}');
		$('#inputEmail').val('${sessionScope.MemberVO.getEmail()}');
		$('#inputPhone').val('${sessionScope.MemberVO.getPhone()}');
		$('#inputAddr1').val('${sessionScope.MemberVO.getAddrNum()}');
		$('#inputAddr2').val('${sessionScope.MemberVO.getAddrRoad()}');
		$('#inputAddrDetail').val('${sessionScope.MemberVO.getAddrDetail()}');

	});
	
	//이름에 특수문자 들어가지 않도록 설정 
	$("#inputName").blur(function() { 
		if (nameJ.test($(this).val())) { 
			console.log(nameJ.test($(this).val())); 
			$("#name_check").text(''); 
		} else { 
			$("#name_check").text("한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)"); 
			$("#name_check").css("color", "red"); 
			} 
		});
	//이메일 양식 확인
	 $("#inputEmail").blur(function() { 
		 if (mailJ.test($(this).val())) { 
			 $("#email_check").text("사용할 수 있는 이메일 입니다.");
			 $("#email_check").css("color", "blue"); 
		 } else { $("#email_check").text("이메일 양식을 확인해주세요."); 
		 	 $("#email_check").css("color", "red"); 
		 	 } 
	 	 });
 	 //휴대전화
 	 $("#inputPhone").blur(function(){ 
	 	 if(phoneJ.test($(this).val())){ 
		 	 console.log(nameJ.test($(this).val())); 
		 	 $("#phone_check").text(''); 
		 } else { $("#phone_check").text("휴대폰번호를 확인해주세요 "); 
		 	 $("#phone_check").css("color", "red"); 
		 	 } 
	 	 });
	
	function execPostCode() {
        new daum.Postcode({
            oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
               var extraRoadAddr = ''; // 도로명 조합형 주소 변수

               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                   extraRoadAddr += data.bname;
               }
               // 건물명이 있고, 공동주택일 경우 추가한다.
               if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
               }
               // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
               if(extraRoadAddr !== ''){
                   extraRoadAddr = ' (' + extraRoadAddr + ')';
               }
               // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
               if(fullRoadAddr !== ''){
                   fullRoadAddr += extraRoadAddr;
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               console.log(data.zonecode);
               console.log(fullRoadAddr);
               $("[name=inputAddr1]").val(data.zonecode);
               $("[name=inputAddr2]").val(fullRoadAddr);
               
            }
        }).open();
    }

	//주문 이벤트
	$("#order_btn").on("click",function(){
		alert("성공");
		
		var productArray= [];
		var qtyArray= [];
		
		$("a[name=qty]").each(function(i){
			qtyArray.push($(this).text());
			console.log("qtyArray:"+qtyArray);
		});	
		$("a[name=productNum]").each(function(i){
			productArray.push($(this).text());
			console.log("productArray:"+productArray);
		});		
		console.log("qtyArray12:"+qtyArray);
		console.log("productArray12:"+productArray);
		var objParams = {
                "productNum" : productArray,
                "qty"     :   qtyArray
            };
		console.log("productArray:"+productArray);
		console.log("qtyArray:"+qtyArray);
		console.log("memberId:"+"${sessionScope.MemberVO.memberId }");
		console.log("objParams:"+objParams);
			 $.ajax({
			    type:"POST",
			    url:"${hContext}/orders/doInsert.do",
			    dataType:"html",
			    traditional:true, 
			    data:{
			    	"memberId"  : "${sessionScope.MemberVO.memberId }",
			    	"productNum" : productArray,
	                "qty"     :   qtyArray
			    },
			    success:function(data){ //성공
			    	alert("주문을 완료했습니다.");
			    	 //json 분리해서 변수
				      // var jsonObj = JSON.parse(data);

				       window.location.href="${hContext}/main/index.do";
					      
			    },		       
			    error:function(xhr,status,error){
			     alert("error:"+error);
			    },
			    complete:function(data){
			    
			    }   
			  
		});//--ajax 	

	});

	
	</script>
</body>

</html>