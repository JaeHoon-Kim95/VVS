<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="hContext" value="${pageContext.request.contextPath }" ></c:set> 
    
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
      
      <div class="container">
      <h2>나의 주문처리 현황</h2>
      	<div class="row">
      		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
      			<thead>
      				<tr>
      					<th style="background-color: #eeeeee; text-align: center;">상품정보</th>
      					<th style="background-color: #eeeeee; text-align: center;">주문일자</th>
      					<th style="background-color: #eeeeee; text-align: center;">주문번호</th>
      					<th style="background-color: #eeeeee; text-align: center;">주문금액(수량)</th>
      					<th style="background-color: #eeeeee; text-align: center;">주문상태</th>
      				</tr>
      			</thead>
      			<tbody>
      				<tr>
      					<td>니트</td>
      					<td>2021-01-09</td>
      					<td>1</td>
      					<td>12000(1)</td>
      					<td>배송준비중1</td>
      				</tr>
      			</tbody>
      		</table>
      	</div>      
      </div>
      
      </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->
      
      
<%@ include file="/WEB-INF/views/main/footer.jsp" %>
  <!-- Bootstrap core JavaScript -->
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
     
  <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="${hContext}/resources/js/bootstrap.min.js"></script>
    <script type="text/javascript"> 


    
    </script>   
</body>
</html>











