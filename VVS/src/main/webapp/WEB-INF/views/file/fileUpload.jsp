<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="hContext" value="${pageContext.request.contextPath }" ></c:set> 
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<title>VVS SHOP</title>

   <!-- Bootstrap core CSS -->
  <link href="${hContext}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${hContext}/resources/css" rel="stylesheet">
  <style>
	.inputArea { margin:10px 0; }
	select { width:100px; }
	label { display:inline-block; width:70px; padding:5px; }
	label[for='gdsDes'] { display:block; }
	input { width:150px; }
	textarea#gdsDes { width:400px; height:180px; }
	.select_img img { margin:20px 0; }
</style>
		<script src="/resources/bootstrap/bootstrap.min.js"></script>
		<script src="/resources/jquery/jquery-3.3.1.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/main/topbar.jsp" %>
<%@ include file="/WEB-INF/views/main/sidebar.jsp" %>

		<div id="container_box">
			<h2>상품 등록</h2>
			
			<form role="form"  method="post" autocomplete="off" enctype="multipart/form-data" action="${hContext }/file/doUpload.do">
			<div class="inputArea">
				<label for="vvsImg">이미지</label>
				<input type="file" id="vvsImg" name="file" />
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
				
				<%=request.getRealPath("/") %>
				
			</div>
			
			
			
			<div class="inputArea">
				<button type="submit" id="register_Btn" class="btn btn-primary">등록</button>
			</div>
			
			</form>
		</div>

</body>
</html>