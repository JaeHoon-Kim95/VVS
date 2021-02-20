<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="hContext" value="${pageContext.request.contextPath }"></c:set>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<head>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>HOONShop</title>

<!-- Bootstrap core CSS -->
<link
	href="${hContext}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${hContext}/resources/css" rel="stylesheet">

</head>

<body>
	<%@ include file="/WEB-INF/views/main/topbar.jsp" %>
	<!-- Page Content -->
	<div class="container">
	<br><br><br><br>
	<h1>타이틀 등록</h1>
	<hr>
		<form name="titleRegist" id="titleRegist" action="${hContext}/product/titleRegist.do" method="post" autocomplete="off" enctype="multipart/form-data">
				<div class="inputArea">
				<label for="vvsImg">대표이미지</label>
				<input type="file" id="vvsImg" name="file2" />
				<div class="select_img"><img src="" /></div>
				
				<script>
					$("#vvsImg").change(function(){
						if(this.files && this.files[0]) {
							var reader = new FileReader;
							reader.onload = function(data) {
								$(".select_img img").attr("src", data.target.result).width(500);								
							}
							reader.readAsDataURL(this.files[0]);
						}
					});
				</script>								
			</div>
			
				<hr>
				<input class="btn btn-info" type='submit'value='바로 등록'>	
		</form>								
		</div>
		<!-- row end -->

	<!-- Bootstrap core JavaScript -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript">
	
	</script>
</body>

</html> 