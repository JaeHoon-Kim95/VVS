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
</head>
<body>
	<input style="width:300px; background-color:black; margin:5px;" class="btn btn-primary btn-lg" type="button" value="수정하기" id="testBtn">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript">
		$("#testBtn").on("click",function(){
			$.ajax({
				type : "POST", //POST 인터넷 주소창에 요청 데이터 안뜸 GET 뜸
				url : "${hContext}/board/doDelete.do",  // 컨트롤러 RequestMapping value="여기" 찾아감
				dataType : "html",  //json도 있고 html도 있고 한데 html만 써와서 그냥 씀..
				data : {  //보낼 데이터
					}
				success:function(data){ //다오까지 넘어가서 쿼리문 성공시
						if(flag = 1){
							alert("삭제성공");
						}
					},
					error:function(data){ //실패시
						alert("삭제실패");
						}
				});
			});
	</script>
</body>
</html>