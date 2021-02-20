<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="hContext" value="${pageContext.request.contextPath }"></c:set>

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
<link
	href="${hContext}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

</head>

<body>
	<%@ include file="/WEB-INF/views/main/topbar.jsp" %>
	<%@ include file="/WEB-INF/views/main/sidebar.jsp" %>
	<!-- Page Content -->
	<div class="container">
<br><br><br><br>
		<form class="form-inline" name="searchData" id="searchData" action="/shop/product/doSearch.do" method="get">
			<input type="hidden" id="pageSize" name="pageSize" value="10">
			<input type="hidden" id="pageNum" name="pageNum" value="1">
			<input type="hidden" id="minPrice" name="minPrice" value="0">
			<input type="hidden" id="maxPrice" name="maxPrice" value="0">
			<input type="hidden" name="categoryNum" value="0">
			<input class="form-control mr-sm-2" id="searchWord" name="searchWord" type="search" placeholder="Search" aria-label="Search" value="${searchWord }">
    		<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</form>
		<hr>
		<div class="row">
      <!-- /.col-lg-3 -->
      <%-- <c:choose>
			<c:when test="${sessionScope.MemberVO.auth eq 0 }"> --%>
		<input class="btn btn-info" type="button" value="타이틀 이미지 등록" id="moveToTitleRegist">
		<input class="btn btn-info" type="button" value="타이틀 이미지 수정" id="moveToTitleUpdate">
		<%-- </c:when>
			<c:otherwise></c:otherwise>
		</c:choose>     --%>
		<div class="col-lg-14">
      
            
               
            <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
                <ol class="carousel-indicators">
                  <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner" role="listbox">
                <c:forEach var="imgList" items="${imgList}">
                   <c:if test="${2 eq imgList.titleImg }">
                  <div class="carousel-item active">
                     
                          <img class="d-block img-fluid" src="${hContext}/${limgList.thunImg}" alt="First slide">
                      
                  </div>
                   </c:if>
                   
                   <c:if test="${3 eq imgList.titleImg }">
                  <div class="carousel-item">
                          <img class="d-block img-fluid" src="${hContext}/${limgList.thunImg}" alt="Second slide">         
                  </div>
                  </c:if>
                  
                  <c:if test="${4 eq imgList.titleImg }">
                  <div class="carousel-item">      
                          <img class="d-block img-fluid" src="${hContext}/${limgList.thunImg}" alt="Third slide">                          
                  </div>
                  </c:if>
                  
                
           </c:forEach>
           </div>
                
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="sr-only">Next</span>
                </a>
              </div>
      <br><br><br>

		
		<div class="row">
			<c:forEach var="list" items="${productList }" varStatus="status">
				<c:set var="imgListThun" value="${imgList[status.index].thunImg}"/>
				<c:set var="productNumL" value="${list.productNum}"/>
				<c:set var="productNumI" value="${imgList[status.index].productNum}"/>		
				
				<div class="col-lg-4 col-md-6 mb-4">
								
					<div class="card h-100">	
								
						<a href="/shop/product/moveToProductDetail.do?productNum=${list.productNum }"><img class="card-img-top" height="400"
							src="${hContext}/${imgListThun}" alt=""></a>
							<input type="hidden" value="${imgListThun}" name="thunImg" id="thunImg">				
						<div class="card-body">
							<h4 class="card-title">								
									<a class="moveDetail" href="/shop/product/moveToProductDetail.do?productNum=${list.productNum }"><c:out value="${list.productName }"/></a>																
							</h4>
							<h5><c:out value="${list.price }"/> 원</h5>
							<p class="card-text"><c:out value="${list.categoryName }"/></p>
						</div>
						<div class="card-footer">
							<small class="text-muted"></small>
						</div>
					</div>				
				</div>
				
				
			</c:forEach>
	
		</div>
		</form>
		<!-- row end -->
		<div class="row">
			<div class="mx-auto">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }" step="1">
							<c:choose>
								<c:when test="${i eq currentPageNum }"><li class="page-item disabled"><a class="page-link" href="#">${i }</a></li></c:when>
								<c:otherwise><li class="page-item"><a class="page-link" href="javascript:goPage(${i})">${i }</a></li></c:otherwise>
							</c:choose>
						</c:forEach>
					</ul>
				</nav>
			</div>
		</div>
		
		<c:choose>
			<c:when test="${sessionScope.MemberVO.auth eq 0 }">
				<div>
				<input class="btn btn-info" type="button" value="상품 등록" id="moveToproductRegistPage">
				<br><br><br><br><br>
				</div>
			</c:when>
			<c:otherwise></c:otherwise>
		</c:choose>
		
			</div>
		</div>
	</div>
	<!-- container end -->

	<!-- Bootstrap core JavaScript -->
	<script src="${hContext}/resources/vendor/jquery/jquery.min.js"></script>
	<script src="${hContext}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript">
	

		window.onload = function(){
			if (self.name != 'reload') {
		        self.name = 'reload';
		        self.location.reload(true);
		    }
		    else self.name = ''; 
		}

		$("#moveToTitleRegist").on("click",function(){		
			window.location.href = "${hContext}/product/moveToTitleRegist.do";
		})
		
		$("#moveToTitleRegist").on("click",function(){		
			window.location.href = "${hContext}/product/moveToTitleUpdate.do";
		})
		
		$("#moveToproductRegistPage").on("click",function(){
				var goUrl = "/shop/product/moveToproductRegistPage.do";
				window.location.href = goUrl;
			})
		$("#searchBtn").on("click", function(){
				var frm = document.searchData;
				frm.submit();
			})
			
		function goPage(pageNum){
				$("#pageNum").val(pageNum);
				var frm = document.searchData;
				frm.submit();
			}
	
		
		
	</script>
</body>

</html> 