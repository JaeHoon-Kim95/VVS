<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="hContext" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>게시판 등록</title>
    <link rel="shortcut icon" type="image/x-icon" href="${hContext}/resources/img/favicon.ico" > 
    <!-- 부트스트랩 -->
    <link href="${hContext}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="/WEB-INF/views/main/topbar.jsp" %>
<div id="wrap">
<%--    <%@include  file="/cmn/inc/header.jsp" %> --%>
   <section>
      <!-- container -->
      <div class="container">
         <!-- 제목 -->
         <div class="page-header">
            <h2>게시판 등록</h2>
         </div>
         <!--// 제목 -->
         
         <!-- button -->   
         <div class="row text-right">
             <label class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></label>
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                <!-- javascript click event -->
               <!-- <input  type="button" class="btn btn-primary btn-sm" value="등록" onclick="javascript:doInsert();" /> -->
               <!-- jquery click event -->
               <input  type="button" class="btn btn-primary btn-sm" value="등록" id="insertBtn" />             
               <input  type="button" class="btn btn-primary btn-sm" value="목록" id="moveList"  />
            </div>  
         </div>
<div class="form-group">
               <label class="col-lg-2 col-md-2 col-sm-2 col-xs-2">제목</label>
                <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                   <input type="text" class="form-control" name="title" id="title" placeholder="제목"
                    maxlength="200"/>
                </div>
            </div>      
            <div class="form-group">
               <label class="col-lg-2 col-md-2 col-sm-2 col-xs-2">작성자</label>
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                   <input type="text" class="form-control" name="modId" id="modId" placeholder="작성자"  maxlength="20"  />
                </div>
            </div>
            <div class="form-group">
               <label class="col-lg-2 col-md-2 col-sm-2 col-xs-2">작성일</label>
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                   <input type="text" class="form-control" name="modDt" id="modDt" placeholder="작성일" />
                </div>
            </div>               
            <div class="form-group">
               <label class="col-lg-2 col-md-2 col-sm-2 col-xs-2">내용</label>
               <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                  <textarea rows="5" cols="40" name="contents" id="contents" class="form-control"></textarea>
               </div>
            </div>
         </form>
      </div>
      <!--// container -->
   </section>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>   
    
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="${hContext}/resources/js/bootstrap.min.js"></script>
    
    <!-- javascript -->
    <script type="text/javascript">
    
    	//모든 컨트롤(element)가 로딩이 완료되면.
		$(document).ready(function(){   
			console.log("document ready");   		
			
		});//document ready  


		
		$("#moveList").on("click", function() {
			moveToListView();
		});

		
			
		$("#insertBtn").on("click", function() {
			console.log("insertBtn");
			
			var title = $("#title").val();
			console.log("title:"+title);
			if(null == title || title.trim().length==0){
				$("#title").focus();
				alert("제목을 입력하세요.");
				return;
			}

			var modId = $("#modId").val();
			console.log("modId:"+modId);
			if(null == modId || modId.trim().length==0){
				$("#modId").focus();
				alert("등록자를 입력하세요.");
				return;
			}
						
			var contents = $("#contents").val();
			console.log("contents:"+contents);
			if(null == contents || contents.trim().length==0){
				$("#contents").focus();
				alert("내용을 입력하세요.");
				return;
			}			
			
			if(false==confirm("등록 하시겠습니까?"))return;

			$.ajax({
			    type:"POST",
			    url:"${hContext}/board/doInsert.do",
			    dataType:"html", 
			    data:{
			    	  "div" :$("#div").val(),
			    	  "title":$("#title").val(),
			    	  "contents":$("#contents").val(),
			          "modId":$("#modId").val(),
			          "regId":$("#modId").val()
			    },   
			    success:function(data){ //성공
			       //console.log("data="+data);
			       //alert("data:"+data);
			       
			       //json 분리해서 변수
			       var jsonObj = JSON.parse(data);
			       console.log("msgId="+jsonObj.msgId);
			       console.log("msgContents="+jsonObj.msgContents);
			    
			       if(null !=jsonObj && jsonObj.msgId=="1"){
			    	   alert(jsonObj.msgContents);
			    	   //board_list.jsp로 이동
			    	   moveToListView();
			       }
			    },
			    error:function(xhr,status,error){
			     alert("error:"+error);
			    },
			    complete:function(data){
			    
			    }   
			  
		});//--ajax


			
		});

		
    
		//목록 Event감지
		$("#move_list").on("click",function(){
			console.log("move_list");
			//window.location.href="/EJDBC/board/board.do?work_div=doSelectList";
			moveToListView();
		});
		
		
		//목록화면으로 이동
		function moveToListView(){
			window.location.href="${hContext}/board/doSelectList.do?div="+$("#div").val();
		}
		
		
		
		
		//jquery event감지:id
		$("#insert_btn").on('click',function(){
			console.log("#insert_btn");
			
			var title = $("#title").val();
			console.log("title:"+title);
			if(null == title || title.trim().length==0){
				$("#title").focus();
				alert("제목을 입력하세요.");
				return;
			}
			
			var reg_id = $("#reg_id").val();
			console.log("reg_id:"+reg_id);
			if(null == reg_id || reg_id.trim().length==0){
				$("#reg_id").focus();
				alert("등록자를 입력하세요.");
				return;
			}
			
			var contents = $("#contents").val();
			console.log("contents:"+contents);
			if(null == contents || contents.trim().length==0){
				$("#contents").focus();
				alert("내용을 입력하세요.");
				return;
			}			
			
			//confirm : 확인
    		if( false==confirm("저장 하시겠습니까?"))return;
			
			
			//fiddler : web debuger(오후)
			//ajax->BoardController.java 
			//return json   
			$.ajax({
				    type:"POST",
				    url:"/EJDBC/board/board.do",
				    dataType:"html", 
				    data:{"work_div":"doInsert",
				    	  "div" :$("#div").val(),
				    	  "read_cnt" :$("#read_cnt").val(),
				          "title":$("#title").val(),
				          "contents":$("#contents").val(),
				          "reg_id":$("#reg_id").val()
				    },
				    success:function(data){ //성공
				       //console.log("data="+data);
				       //alert("data:"+data);
				       
				       // - =jsonMsg={"msgId":"1","msgContents":"등록 되었습니다.","num":0,"totalCnt":0}
				       
				       //json 분리해서 변수
				       var jsonObj = JSON.parse(data);
				       console.log("msgId="+jsonObj.msgId);
				       console.log("msgContents="+jsonObj.msgContents);
				    
				       if(null !=jsonObj && jsonObj.msgId=="1"){
				    	   alert(jsonObj.msgContents);
				    	   //board_list.jsp로 이동 
				    	   //window.location.href="/EJDBC/board/board.do?work_div=doSelectList";
				    	   moveToListView();
				       }
				    },
				    error:function(xhr,status,error){
				     alert("error:"+error);
				    },
				    complete:function(data){
				    
				    }   
				  
			});//--ajax

		
			
		});//insert_btn  
		
    	function doInsert_javascript() {
    		//console.log("doInsert() call");
			//alert("doInsert");
			//var frm = document.save_frm;
			//alert("frm.div.value:"+frm.div.value);
			
			//form에 컨트롤에 값 가지고 오기
    		/*
    			1. 컨트롤 이름으로 가지고 오기
    			   document.컨트롤이름.value
    			2. 컨트롤의 id로 가지고 오기
    			   document.getElementById('컨트롤id').value
    		*/
    		var frm = document.save_frm;
			
    		console.log("1.컨트롤 이름으로 가지고 오기"+document.save_frm.div.value);
    		console.log("2.컨트롤의 id로 가지고"+document.getElementById('div').value);
    		
    		var title = frm.title.value;
    		console.log("before title:"+title);
    		
    		//제목
    		if(title==""){
    			alert("제목을 입력하세요.");
    			frm.title.focus();
    			return;
    		}
    		
    		//등록자ID
    		var regId = frm.reg_id.value;
    		if(regId==""){
    			alert("등록자를 입력하세요.");
    			frm.reg_id.focus();
    			return;
    		}
    		
    		//내용
    		var contents = frm.contents.value;
    		if(contents==""){
    			alert("내용을 입력하세요.");
    			frm.contents.focus();
    			return;
    		}    
    		
    		//confirm : 확인
    		if( false==confirm("저장 하시겠습니까?"))return;
    		
    		
    		//작업구분 : doInsert
    		frm.work_div.value="doInsert";   
    		
    		//브라우저 to server로
    		frm.action = "/EJDBC/board/board.do"
    		frm.submit();
	
		}  
 </script>
    
    
    
  </body>
</html>