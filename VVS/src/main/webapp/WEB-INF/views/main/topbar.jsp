<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="hContext" value="${pageContext.request.contextPath }" ></c:set> 
	<!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="${hContext}/member/homeBack.do" style="font-size:40px;color:white">HOON</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <input type="hidden" id="sessionMember" name="sessionMember" value="${sessionScope.MemberVO}"> 
      
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
			
		  <li class="nav-item active">						
			 <a class="nav-link" id="moveToBoard" type="button">게시판</a> 			 
			 <form name="moveBoard" action="${hContext}/board/doSelectList.do">
				<input type="hidden" value="1" name="num">
			 </form>					 
	      </li>	      
          
          <li class="nav-item">
           			 <a id="editCheck" class="nav-link" href="${hContext}/member/editCheck.do">정보수정</a>
         		 </li>
           
          <li class="nav-item">
		  <c:choose>
		  	<c:when test='${null != sessionScope.MemberVO}'>
		    	<li class="nav-item">
		    		<form name="ordersMove" action="${hContext}/orders/ordersView.do">
						<input type="hidden" value="1" name="num">
					</form>
		        	<a id="ordersMove"  class="nav-link" type="button">
		        		마이페이지
		        	</a>	        	
		        </li>

         		 
         		 <li class="nav-item">
		        	<a class="nav-link" style="font-size:16px;color:white">${sessionScope.MemberVO.getName()}님 환영합니다.</a>
		        </li>
         		 
		        <li class="nav-item">
		        	<a href="${hContext}/member/logout.do" class="nav-link">로그아웃</a>
		        </li>
		        		        
		    </c:when>
		    <c:otherwise>
		  	<li class="nav-item">
            	<a class="nav-link" href="${hContext}/member/registerPage.do">회원가입</a>
            </li>		  	
            <li class="nav-item">
            	<a class="nav-link" href="${hContext}/member/loginPage.do">login</a>
            </li>	
         	
         	
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
  	
		
     $("#moveToBoard").on("click",function(){
	  doSelectListBoard();
	  
	  }); 
  
  function doSelectListBoard(){
	  var frm = document.moveBoard;
	  frm.submit();
	  }
  
  $("#ordersMove").on("click",function(){	  
	  doSelectListOrders();
	  });
  function doSelectListOrders(){
  	var frm = document.ordersMove;
  	frm.submit();
  }

  </script>