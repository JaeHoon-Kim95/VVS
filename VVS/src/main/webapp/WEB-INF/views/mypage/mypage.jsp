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
	
	<!-- Bootstrap core CSS -->
    <link href="${hContext}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


  	<!-- Custom styles for this template -->
  	<link href="${hContext}/resources/css" rel="stylesheet">
	<style>
	body{ padding-top:70px;
		padding-left:100px;}
	</style>
</head>

<body>
	<%@ include file="/WEB-INF/views/mypage/mypage_sidebar.jsp" %>
	<%@ include file="/WEB-INF/views/main/topbar.jsp" %>
	  
	  <!-- Page Content -->
  	<div class="container">

    	<div class="row">

      	<div class="col-lg-3">

        <h1 class="my-4">My Page</h1>

      </div>
      
      <input type='hidden' id='orders'>
      <div class="container">
      <h2>나의 주문처리 현황</h2>
      	<div class="row">
      		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd" id="ordersListTable">
      			<thead class="bg-primary">  
					<th style="background-color: #eeeeee; text-align: center;">상품정보</th>
					<th style="background-color: #eeeeee; text-align: center;">주문일자</th>
					<th style="background-color: #eeeeee; text-align: center;">주문번호/송장번호</th>
					<th style="background-color: #eeeeee; text-align: center;">주문금액</th>
					<th style="background-color: #eeeeee; text-align: center;">주문수량</th>
					<th style="background-color: #eeeeee; text-align: center;">주문상태</th>
				</thead>
      			<tbody id="order">
      			<!-- 문자: 왼쪽, 숫자: 오른쪽, 같은면: 가운데 -->
			        <c:choose>
			        	<c:when test="${orderList.size()>0 }">
			        		<c:forEach var="OrdersVO" items="${orderList}" >
						    	<tr>
						    		<td class="text-center">
						    		<c:forEach var="FileVO" items="${fileLi}">
						    			<c:if test="${FileVO.productNum == OrdersVO.productNum}">
						    				<a href="/shop/product/moveToProductDetail.do?productNum=${OrdersVO.productNum }">
						    				<img alt="" class="rounded float-left" width="50" height="50" src="${hContext}/${FileVO.thunImg}">
						    				</a>
						    			</c:if>	
						    		</c:forEach>
						    		<br/> ${OrdersVO.productName}
						    		</td>
						    		<td class="text-center">${OrdersVO.orderDt}</td>
						    		<td class="text-center" id = "orderNum">${OrdersVO.orderNum}/
						    		<c:forEach var="ShipVO" items="${shipList}">
						    			<c:if test="${OrdersVO.orderNum == ShipVO.orderNum}">
   						 						<c:out value="${ShipVO.shipNum}" />
						    			</c:if>	
						    		</c:forEach>
						    			
						    		</td>
						    		<td class="text-center">${OrdersVO.price*OrdersVO.qty}원</td>
						    		<td class="text-center">${OrdersVO.qty}개</td>
						    		<td class="text-center">
						    		${OrdersVO.orderSt}						    		
						    			<c:if test="${OrdersVO.orderSt=='주문완료'}">
						    				<a class="btn btn-dark" type="button" name="orderDelete_btn" >
   						 						<c:out value="주문취소" />
   						 						<div id="orderSt" style="display: none"><c:out value="${OrdersVO.orderNum}" /></div>
   						 					</a>
						    			</c:if>	
						    			<c:if test="${OrdersVO.orderSt=='배송중'}">
						    				<a class="btn btn-dark" href="${hContext}/ship/shipView.do" target="_blank">배송조회</a>
						    			</c:if>	
						    			<c:if test="${OrdersVO.orderSt=='배송완료'}">
						    				<a class="btn btn-dark" type="button" name="orderCh_btn" >
   						 						<c:out value="교환" />
   						 						<div id="ordersSt" style="display: none"><c:out value="${OrdersVO.orderNum}" /></div>
   						 					</a>  
						    			</c:if>
						    			<c:if test="${OrdersVO.orderSt=='배송완료'}">
						    				<a class="btn btn-dark" type="button" name="orderDel_btn" >
   						 						<c:out value="환불요청" />
   						 						<div id="ordersSt" style="display: none"><c:out value="${OrdersVO.orderNum}" /></div>
   						 					</a> 
						    			</c:if>					    			
						    		</td>
						    	</tr>			        			
			        		</c:forEach>
			        	</c:when>
			        	<c:otherwise>
			        		<tr>
						    		<td class="text-center" colspan="99">주문현황이 없습니다.</td>
						    </tr>  		
			        	</c:otherwise>
			        </c:choose>
      				
      			</tbody>
      		</table>
      		<nav aria-label="Page navigation example">
  				<ul class="pagination">
    				<li class="page-item">
      					<c:if test="${pageVO.prev}">
      						<a class="page-link" href="${pageVO.startPageNum-1}" aria-label="Previous">
      							<span aria-hidden="true">&laquo;</span>
      							<span class="sr-only">Previous</span>
      						</a>
      					</c:if>
      					</li>
      		
      				<c:forEach var="num2" begin="${pageVO.startPageNum}" end="${pageVO.endPageNum}">
      					<li class="page-item ${pageVO.num == num2 ? "active":""}">
      						<a class="page-link" href="${num2}">${num2}</a>
      					</li>
      				</c:forEach>
			
					<li class="page-item">
						<a class="page-link" href="${pageVO.endPageNum+1}" aria-label="Next">
        					<span aria-hidden="true">&raquo;</span>
       						<span class="sr-only">Next</span>
      					</a>    		
      				</li>
  				</ul>
			</nav>
      	</div>      
      </div>
      <form id="numToBoard" action="${hContext}/orders/ordersView.do">
				<input type="hidden" name="num" value = "${pageVO.num}">
				<%-- <input type="hidden" name="postNum" value = "${pageVO.postNum}"> --%>
			</form>
      </div>
    <!-- //.row -->

  </div>
  <!-- //.container -->
  <br>
  <br>
  <br>    
   <br>
   <br>
   <br>   
<%@ include file="/WEB-INF/views/main/footer.jsp" %>
  <!-- Bootstrap core JavaScript -->
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
     
  <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="${hContext}/resources/js/bootstrap.min.js"></script>
    <script type="text/javascript"> 

  	//주문취소 이벤트
	$("a[name=orderDelete_btn]").on("click",function(event){

		 var orderNum = event.target.childNodes.item(1).textContent;
		  
		  console.log("orderNum:"+orderNum);
		  var result = confirm("주문을 취소하시겠습니까?");

		  if(!result){
		  return;
			 
		  }
				
		$.ajax({
		    type:"POST",
		    url:"${hContext}/orders/doDelete.do",
		    dataType:"html", 
		    data:{"orderNum" :orderNum
		    },
		    success:function(data){ //성공
		    	alert("주문을 취소했습니다.");
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

	//배송완료시 환불 이벤트
	$("a[name=orderDel_btn]").on("click",function(event){

		 var orderNum = event.target.childNodes.item(1).textContent;
		  console.log("orderNum:"+orderNum);
		  var result = confirm("제품을 환불하시겠습니까?");

		  if(!result){
		  return;
			 
		  }
				
		$.ajax({
		    type:"POST",
		    url:"${hContext}/orders/doDelete.do",
		    dataType:"html", 
		    data:{"orderNum" :orderNum
		    },
		    success:function(data){ //성공
		    	alert("제품을 환불요청이 되었습니다.");
		    	alert("제품에 기재된 주소로 보내주시기 바랍니다.");
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

	//배송완료시 교환 이벤트
	$("a[name=orderCh_btn]").on("click",function(event){

		 var orderNum = event.target.childNodes.item(1).textContent;
		  console.log("orderNum:"+orderNum);
		  var result = confirm("제품을 교환하시겠습니까?");

		  if(!result){
		  return;
			 
		  }
				
		$.ajax({
		    type:"POST",
		    url:"${hContext}/orders/doDelete.do",
		    dataType:"html", 
		    data:{"orderNum" :orderNum
		    },
		    success:function(data){ //성공
		    	alert("제품을 교환요청이 되었습니다.");
		    	alert("제품에 기재된 주소로 보내주시기 바랍니다.");
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

	$(".page-link").on("click",function(e){
		console.log("click");
		e.preventDefault();
		
		$("#numToBoard").find("input[name='num']").val($(this).attr("href"));
		$("#numToBoard").submit();
		});
    </script>   
</body>
</html>












