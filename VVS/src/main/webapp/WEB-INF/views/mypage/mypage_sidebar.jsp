<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="hContext" value="${pageContext.request.contextPath }" ></c:set> 
<style>
* {padding:0;margin:0;}
	
	div[class = "sidebar"] {
		width: 200px;
		height: 100%;
		background: #222;
		position: fixed;
		top: 0;
		left: 0px;
		z-index: 1;
		transition:all .35s;
		background-color: white;
		padding-top: 70px;
	}
</style>



<div class="sidebar">
<aside>
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
	 
	 <!-- Divider -->
     <hr class="sidebar-divider">
     <h4>나의 쇼핑 활동</h4>
     <hr class="sidebar-divider">
	<li><a href="#"><font color="gray";>상품 문의</font></a>
	</li>
	 
	 <!-- Divider -->
     <hr class="sidebar-divider">
     
	<li><a href="#"><font color="gray";>장바구니</font></a>
	</li>
	 
	 <!-- Divider -->
     <hr class="sidebar-divider">
     
	<li><a href="#"><font color="gray";>주문내역 조회</font></a>
	</li>
	
	<!-- Divider -->
     <hr class="sidebar-divider">
	
	<li><a href="${hContext}/member/registerPage.do"><font color="gray";>회원정보 수정</font></a>
	</li>
	
	<!-- Divider -->
     <hr class="sidebar-divider">
	
	<li><a href="#"><font color="gray";>배송 주소록 관리</a>

	</li>
</ul>
</aside>
</div>
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