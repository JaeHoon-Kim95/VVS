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
	<div id="wrap">
	<section>
	
	<div class="container">
		<div class="page-header">
      		<h2>커뮤니티</h2>
      	</div>
      		
      	<div class="row text-right">
			<label class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></label>
			<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">					 	   
				<input  type="button" class="btn btn-secondary btn-sm" value="완료" id="updateBtn" />
				<input  type="button" class="btn btn-secondary btn-sm" value="삭제" id="deleteBtn" />								
				<input  type="button" class="btn btn-secondary btn-sm" value="목록" id="moveList"  />
			</div>
		</div>	
			
		
      	<div class="row">
			<label class="col-lg-2 col-md-2 col-sm-2 col-xs-2">제목</label>
			<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
				<input type="text" class="form-control" name="title" id="title" value="${outVO.title}" />
			</div>
		</div>
		
		<div class="row">
			<label class="col-lg-2 col-md-2 col-sm-2 col-xs-2">작성자</label>
			<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
				<input type="text" class="form-control" name="regId" id="regId" value="${outVO.regId}" readonly="readonly" />
			</div>
		</div>
		<div class="row">
			<label class="col-lg-2 col-md-2 col-sm-2 col-xs-2">작성일</label>
			<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
				<input type="text" class="form-control" name="regDt" id="regDt" value="${outVO.regDt}" readonly="readonly" />
			</div>
		</div>
		<div class="row">
			<label class="col-lg-2 col-md-2 col-sm-2 col-xs-2">내용</label>
			<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
				<textarea rows="5" cols="40" name="contents" id="contents" class="form-control">${outVO.contents}</textarea>
			</div>
		</div>
		<input type="hidden" id="seq" value="${outVO.seq}">
    </div>  		
    </section>
    </div>
 <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="${hContext}/resources/js/bootstrap.min.js"></script>
  	<script type="text/javascript">
  		
  		
  		
  		$("#updateBtn").on("click",function(){
  			var title = $("#title").val(); 			
  	  		if(null == title || title.trim().length==0){
  	  	  		$("#title").focus();
				alert("제목을 입력하세요");
				return;
  	  	  		}

  	  		var contents = $("#contents").val();
  	  		if(null == contents || contents.trim().length==0){
				$("#contents").focus();
				alert("내용을 입력하세요.");
				return;
			}
  	  		 if(false==confirm("수정 하시겠습니까?"))return; 
			
  	  		$.ajax({
		  	  		type:"POST",
				    url:"${hContext}/board/doUpdate.do",
				    dataType:"html", 
				    data:{
					      "seq" : $("#seq").val(),
					      "contents" : $("#contents").val(),
					      "regId" : $("#regId").val(),
					      "title" : $("#title").val()				    	  
				    },  
				    success:function(data){ //성공
				       			    
				       if(data == 1){
				    	   alert("수정완료");
				    	   moveBoardList();
				       }
				    },
				    error:function(xhr,status,error){
				     alert("error:"+error);
				    }
  	  	  		}); /* --ajax */
  	  		});

  			$("#moveList").on("click",function(){
  	  			moveBoardList();
  	  			});
	  		function moveBoardList(){
	  			window.location.href="/shop/board/doSelectList.do?num=1";
		  		}
  	</script>
</body>
</html>