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
</head>
<body>
	<%@ include file="/WEB-INF/views/main/sidebar.jsp" %>
	<%@ include file="/WEB-INF/views/main/topbar.jsp" %>
	

<div class="container">
      <h2>커뮤니티</h2>
      	<div class="row">
      		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd" id="boardListTable">
      			<thead class="bg-primary">  
					<th style="background-color: #eeeeee; text-align: center;">순번</th>
					<th style="background-color: #eeeeee; text-align: center;">제목</th>
					<th style="background-color: #eeeeee; text-align: center;">작성자</th>
					<th style="background-color: #eeeeee; text-align: center;">작성일자</th>
				</thead>
      			<tbody id="boardList">
			        <c:choose>
			        	<c:when test="${outVO.size()>0 }">
			        		<c:forEach var="boardList" items="${outVO}">  
						    	<tr>
						    		<td class="text-center">${boardList.seq}</td>
						    		<td class="text-center">${boardList.title}</td>
						    		<td class="text-center">${boardList.regId}</td>
						    		<td class="text-center">${boardList.regDt}</td>				    	
						    	</tr>			        			
			        		</c:forEach>
			        	</c:when>
			        	<c:otherwise>
			        		<tr>
						    		<td class="text-center" colspan="99">게시글이 없습니다.</td>
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
</body>
</html>