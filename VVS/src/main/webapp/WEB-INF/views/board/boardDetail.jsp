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
		
      	<div class="page-header">
      		<h2>커뮤니티</h2>
      	</div>
      	      
      <div class="row text-right">
			<label class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></label>
			<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">		
				<c:choose>
		  		<c:when test='${null != sessionScope.MemberVO}'>		    
					<input  type="button" class="btn btn-secondary btn-sm" value="수정" id="updateBtn" />
					<c:if test= "${sessionScope.MemberVO.getMemberId()} eq ${outVO.regId}">
					<input  type="button" class="btn btn-secondary btn-sm" value="삭제" id="deleteBtn" />
					</c:if>
				</c:when>
				</c:choose>	 				
				<input  type="button" class="btn btn-secondary btn-sm" value="목록" id="moveList"  />
			</div>
		</div>
			
     	<form  class="form-horizontal" id="mngForm" action="${hContext}/board/doUpdatePage.do" method="post">	
     	<input type="hidden" name="seq" value='<c:out value="${outVO.seq}"/>'>   	
     	<input type="hidden" id="num" value=${pageVO.num}>
      	<div class="form-group">
			<label class="col-lg-2 col-md-2 col-sm-2 col-xs-2">제목</label>
			<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
				<input type="text" class="form-control" name="title" id="title" value="${outVO.title}" readonly="readonly" />
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-lg-2 col-md-2 col-sm-2 col-xs-2">작성자</label>
			<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
				<input type="text" class="form-control" name="regId" id="regId" value="${outVO.regId}" readonly="readonly" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-lg-2 col-md-2 col-sm-2 col-xs-2">작성일</label>
			<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
				<input type="text" class="form-control" name="regDt" id="regDt" value="${outVO.regDt}" readonly="readonly" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-lg-2 col-md-2 col-sm-2 col-xs-2">내용</label>
			<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
				<textarea rows="5" cols="40" name="contents" id="contents" class="form-control" readonly="">${outVO.contents}</textarea>
			</div>
		</div>		
    </div>  		
   </form>
 <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="${hContext}/resources/js/bootstrap.min.js"></script>
  	<script type="text/javascript">
  		$("#updateBtn").on("click",function(){
  	  		$("#mngForm").submit();
  	  		});
	  	$("#moveList").on("click",function(){
		  	window.location.href="/shop/board/doSelectList.do?num=1";
		  	});	
	  	$("#deleteBtn").on("click",function(){  		
	  		$.ajax({
		  		type="POST",
		  		url : "${hContext}/board/doDelete.do"
			    dataType : "html",
			    	success:function(){
						if(flag==1){
							alert("탈퇴되었습니다.");
						window.location.href="/shop/board/doSelectList.do?num=1";
							}
				    	},
				    	error:function(){
					    }
		  		});
		  	});
  	</script>
</body>
</html>