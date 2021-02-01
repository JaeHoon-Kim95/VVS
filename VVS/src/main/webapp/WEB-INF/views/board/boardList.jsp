<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
      			<c:set var="size" value="${fn:length(outVO)}"/>     			
			        <c:choose>			        	
			        	<c:when test="${size>0}">
			        	
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
      		<form id="numToBoard" action="${hContext}/board/doSelectList.do">
				<input type="hidden" name="num" value = "${pageVO.num}">
				<%-- <input type="hidden" name="postNum" value = "${pageVO.postNum}"> --%>
			</form>	
      
    


  
  <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="${hContext}/resources/js/bootstrap.min.js"></script>
  	<script type="text/javascript">
  		
  
		$(".page-link").on("click",function(e){
			console.log("click");
			e.preventDefault();
			
			$("#numToBoard").find("input[name='num']").val($(this).attr("href"));
			$("#numToBoard").submit();
			});
  	
  	</script>
  
      
      
<%@ include file="/WEB-INF/views/main/footer.jsp" %>
</body>
</html>