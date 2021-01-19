<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="hContext" value="${pageContext.request.contextPath }" ></c:set> 
	<!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">HOON</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">홈페이지
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">로그인</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">회원가입</a>
          </li>
          <li class="nav-item">
          <c:url value="/orders/ordersView.do" var="orderViewUrl">
		  </c:url>
		  
		  <c:choose>
		  	<c:when test='${null != sessionScope.memberId}'>
		    	<li class="nav-item">
		        	<a href="<c:out value='${orderViewUrl}' />"   class="nav-link">
		        		<span class="btn btn-secondary">마이페이지</span>
		        	</a>
		        </li>
		    </c:when>
		    <c:otherwise>
		  	<a class="nav-link" type="button" id="loginView">마이페이지</a>
		   </c:otherwise>				      
		   </c:choose> 
          
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <!-- commit test -->
	 <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="${hContext}/resources/js/bootstrap.min.js"></script>
	
  <script type="text/javascript">
  $("#loginView").on("click",function(){
	  alert("로그인이 필요합니다.");
	  window.location.href="${hContext}/member/loginPage.do"
  });
  </script>