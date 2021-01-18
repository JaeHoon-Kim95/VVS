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
	body{ padding-top:70px;}
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
					<th style="background-color: #eeeeee; text-align: center;">주문번호</th>
					<th style="background-color: #eeeeee; text-align: center;">주문금액</th>
					<th style="background-color: #eeeeee; text-align: center;">주문수량</th>
					<th style="background-color: #eeeeee; text-align: center;">주문상태</th>
				</thead>
      			<tbody id="order">
      			<!-- 문자: 왼쪽, 숫자: 오른쪽, 같은면: 가운데 -->
			        <c:choose>
			        	<c:when test="${orderList.size()>0 }">
			        		<c:forEach var="OrdersVO" items="${orderList}">  
						    	<tr>
						    		<td class="text-center">${OrdersVO.productName}</td>
						    		<td class="text-center">${OrdersVO.orderDt}</td>
						    		<td class="text-center" id = "orderNum">${OrdersVO.orderNum}</td>
						    		<td class="text-center">${OrdersVO.price}원</td>
						    		<td class="text-center">${OrdersVO.qty}개</td>
						    		<td class="text-center">
						    		${OrdersVO.orderSt}
						    			<c:if test="${OrdersVO.orderSt=='주문완료'}">
						    			<input type="button" value="주문취소" id="orderDelete_btn" class="btn btn-dark" />
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
      	</div>      
      </div>
      
      </div>
    <!-- //.row -->

  </div>
  <!-- //.container -->
      
      
<%@ include file="/WEB-INF/views/main/footer.jsp" %>
  <!-- Bootstrap core JavaScript -->
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
     
  <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="${hContext}/resources/js/bootstrap.min.js"></script>
    <script type="text/javascript"> 

  	//완료시 이벤트
	$("#order").click(function(event){
		alert("orderDelete_btn test111");

		var test1 = $(event.target).children("#orderNum").text();
		var test2 = JSON.stringify(test1);
		console.log(test1);
		console.log("test1123:"+test2);
		var orderToDelete = $("#orders").val();
		console.log("orderToDelete1:"+orderToDelete);	
		 
		/* $.ajax({
		    type:"POST",
		    url:"${hContext}/orders/doDelete.do",
		    dataType:"html", 
		    data:{"orderNum" :$("#orders").val()
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
		  
	});//--ajax */
		

	});
    
    </script>   
</body>
</html>












