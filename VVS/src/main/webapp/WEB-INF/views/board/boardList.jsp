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
	body{ padding-top:130px;}
	</style>
</head>
</head>
<body>
	<%@ include file="/WEB-INF/views/main/sidebar.jsp" %>
	<%@ include file="/WEB-INF/views/main/topbar.jsp" %>
	
		
			<div style="float:right; margin-right:400px">
				<input type="button" class="btn btn-secondary" id="doInsertBtn"  value="글작성">
				<input type="hidden" id="checkRegId" value="${sessionScope.MemberVO.getMemberId()}"/>	
			</div>
			
<div class="container">
      <h2>커뮤니티</h2>
      	<div class="row" >
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
						    		<td class="text-center">
						    		<a class="boardDetailFrm" href='<c:out value="${boardList.seq}"/>'>
						    		<c:out value="${boardList.seq}"/></a>
						    		</td>
						    		<td class="text-center">
						    		<a class="boardDetailFrm" href='<c:out value="${boardList.seq}"/>'>
						    		<c:out value="${boardList.title}"/></a>
						    		</td>
						    		<td class="text-center">${boardList.regId}</td></br>
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
      	      
      
      		<form id="numToBoard" action="${hContext}/board/doSelectList.do">
				<input type="hidden" name="num" value = "${pageVO.num}">
				<input type="hidden" name="keyword" value="<c:out value='${pageVO.keyword}'/>" />
				<input type="hidden" name="type" value="<c:out value='${pageVO.type}'/>" />
				<%-- <input type="hidden" name="postNum" value = "${pageVO.postNum}"> --%>
			</form>
	<div class="row">
		<div class="col-lg-12"> 		
      		<form id="searchForm" action="${hContext}/board/doSelectList.do">
      			<select name="type">
      				
      				
      				<option value="T"
      					<c:out value="${pageVO.type eq 'T'?'selected':''}"/>>제목
      				</option>
      				
      				<option value="R"
      					<c:out value="${pageVO.type eq 'R'?'selected':''}"/>>작성자
      				</option>
      			</select>
      			<input type="text" name="keyword" value='<c:out value="${pageVO.keyword}"/>' />
      			<input type="hidden" name="num" value='<c:out value="${pageVO.num}"/>' />
      			<input type="hidden" name="postNum" value='<c:out value="${pageVO.postNum}"/>' />
      			
      			<input type="button" class="btn btn-secondary" id="searchBtn"  value="검색">
     		</form>    			
    	</div>  	
	</div>				
	</div>		 
</div>


  
  <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="${hContext}/resources/js/bootstrap.min.js"></script>
  	<script type="text/javascript">
  		$(document).ready(function(){
  	  		
  	  		});
  		var numToBoard = $("#numToBoard");
  		
		$(".page-link").on("click",function(e){
			console.log("click");
			e.preventDefault();
			
			numToBoard.find("input[name='num']").val($(this).attr("href"));
			numToBoard.submit();
			});
		
  		$("#searchForm button").on("click",function(e){
  			var searchForm = $("#searchForm");
  			
  	  		
  	  		if(!searchForm.find("input[name='keyword']").val()){
				alert("검색어를 입력하세요");
				return false;
	  	  		}
  	  		searchForm.find("input[name='num']").val(1);
  	  		e.preventDefault(); 
  	  		searchForm.submit();  	  			
  	  		});
	  	$(".boardDetailFrm").on("click",function(e){
		  		e.preventDefault();
		  		numToBoard.append("<input type='hidden' name='seq' value='"+$(this).attr("href")+"'>");
		  		numToBoard.attr("action","${hContext}/board/doSelectOne.do");
		  		numToBoard.submit();
		  		
		  	});
	  	$("#doInsertBtn").on("click",function(){
		  	var checkRegId = $("#checkRegId").val();
		  	if(!checkRegId){
				alert("로그인이 필요합니다");				
			  	}else{
		  		window.location.href="${hContext}/board/doInsertPage.do";
			  	}
		  	});
  	</script>
  
      
      
<%@ include file="/WEB-INF/views/main/footer.jsp" %>
</body>
</html>