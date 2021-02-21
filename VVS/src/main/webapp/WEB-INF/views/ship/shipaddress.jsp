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
		        		<a href="${hContext}/orders/ordersView.do?num=1" > 마이페이지</a>
                        <span>배송 주소록 관리</span>
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
                        
                        <h4>배송지 정보</h4>
                            <br>
                            <br>
                            <br>
                        <div class="row">
                            <!-- 우편번호, 도로명, 상세주소 --> 
                            <div class="form-group"> 
								<input class="form-control" style="width: 40%; display: inline;" value="${sessionScope.MemberVO.getAddrNum()}" name="inputAddr1" id="inputAddr1" type="text" readonly="readonly"/> 
								<button type="button" class="btn btn-default" onclick="execPostCode2();"><i class="fa fa-search"></i> 우편번호 찾기</button> 
							</div> 
							<div class="form-group"> 
								<input class="form-control" style="top: 5px;" value="${sessionScope.MemberVO.getAddrRoad()}" name="inputAddr2" id="inputAddr2" type="text" readonly="readonly" /> 
							</div> 
							<div class="form-group"> 
								<input class="form-control" value="${sessionScope.MemberVO.getAddrDetail()}" name="inputAddrDetail" id="inputAddrDetail" type="text"/> 
							</div>
                        
                            <div class="col-lg-12">
                            <br>
                            <br>
                                <div class="create-item">
                                    <input style="width:300px; background-color:black; margin:5px;" class="btn btn-primary btn-lg" type="button" value="수정하기" id="AddressupdateBtn">
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
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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

		 	//수정하기 버튼 클릭시	
			$("#AddressupdateBtn").on("click",function(){
				var chk_Arr = new Array(1).fill(false);
				if(address.val() == ''){
					chk_Arr[0] = false;
					alert("주소를 확인하세요.");
					return false;
				}else{
					chk_Arr[0] = true;
				}
					
				//전체 유효성 검사 
				var validAll = true; 
				for(var i = 0; i < chk_Arr.length; i++){ 
					if(chk_Arr[i] == false){ 
						validAll = false; 
						} 
					}
				
				if(validAll == true){
					$.ajax({				  	
					  	type : "POST",
					  	url : "${hContext}/member/doUpdateAddress.do",
					  	dataType : "html",
					  	data : {
					  			"memberId":"${sessionScope.MemberVO.memberId}",
								"addrNum":$("#inputAddr1").val(),
								"addrRoad":$("#inputAddr2").val(),
								"addrDetail":$("#inputAddrDetail").val()
						  	},
						  	success:function(data){
					  	
								alert("수정되었습니다.");
								window.location.href = "${hContext}/member/homeBack.do";
							  	},
							error:function(data){
							    alert("잘못된 정보 확인부탁드립니다.");
								}
					  });
				}
			}); //registerBtn function
			
	function execPostCode2() {
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

	$("#moveOrder").on("click",function(){	  
		  doSelectListOrder();
		  });
	  function doSelectListOrder(){
	  	var frm = document.moveOrder;
	  	frm.submit();
	  }
		
	</script>
	<%@ include file="/WEB-INF/views/main/footer.jsp" %>
</body>

</html>