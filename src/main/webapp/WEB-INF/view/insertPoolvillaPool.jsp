<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Orange-poolvilla:insertPoolvillaPool</title>
    <meta name="description" content="Free Bootstrap Theme by uicookies.com">
    <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/styles-merged.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/style.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/custom.css">
	
	<style>
	    .helper {
	    	color : #FF0000;
	    }
	</style>
  </head>
  
  	<!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
  <body>

  	<!-- START: header -->
	       <div id="includeHeader"></div>
	<!-- END: header -->
	
  <section class="probootstrap-slider flexslider2 page-inner">
    <div class="overlay"></div>
    <div class="probootstrap-wrap-banner">
      <div class="container">
        <div class="row">
          <div class="col-md-8">

            <div class="page-title probootstrap-animate">
              <div class="probootstrap-breadcrumbs">
                <a href="${pageContext.request.contextPath}/template/#">Home</a><span>About</span>
              </div>
              <h1>Insert Poolvilla pool</h1>
            </div>

          </div>
        </div>
      </div>
    </div>
    <ul class="slides">
      <li style="background-image: url(${pageContext.request.contextPath}/template/img/slider_1.jpg);"></li>
      <li style="background-image: url(${pageContext.request.contextPath}/template/img/slider_4.jpg);"></li>
      <li style="background-image: url(${pageContext.request.contextPath}/template/img/slider_2.jpg);"></li>
    </ul>
  </section>
  <!-- END: slider  -->
  
  <section class="probootstrap-section">
    <div class="container">
    
    	<h2>pool Info List</h2>
    		<br>
    		<table class = "table table-hover text text-center">
				<thead>
					<tr>
						<th class="text text-center">수영장 이름</th>
						<th class="text text-center">가로</th>
						<th class="text text-center">세로</th>
						<th class="text text-center">깊이</th>
						<th class="text text-center">온수 여부</th>
						<th class="text text-center">실내/야외</th>
						<th>&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					<tr>
					<c:if test="${ not empty ppList }">
						<c:forEach var = "pp" items = "${ ppList }" varStatus = "status">
							<form method="post" action="${pageContext.request.contextPath}/host/insertPoolvillaPoolController">
								<input type = "hidden" name = "pvNo" value = "${ pp.pvNo }" readonly>
								<input type = "hidden" name = "poolNo" value = "${ pp.poolNo }" readonly>
								<tr>
									<td>${ pp.poolName }</td>
									<td>${ pp.poolWidth }</td>
									<td>${ pp.poolLength }</td>
									<td>${ pp.depth }</td>
									<td>${ pp.hotWater }</td>
									<td>${ pp.indoorOutdoor }</td>
									<td><a href="${pageContext.request.contextPath}/host/deletePoolvillaPoolController?pvNo=${pvNo}&poolNo=${ pp.poolNo }" class = "btn btn-outline-secondary btn-sm">삭제</a></td>
								</tr>
							</form>
						</c:forEach>
					</c:if>
					</tr>
				</tbody>
			</table>
		
		<hr>
      
		<h2>Enter the pool info</h2>
		<br>
        <!-- Form -->
        <table>
        <form action="${pageContext.request.contextPath}/host/insertPoolvillaPoolController?pvNo=${pvNo }" method="post" class="probootstrap-form mb60" id="insertForm3" >
            <div class="row">
            	<div class="form-group">
            		<input type = "hidden" name = "pvNo" value = "${ param.pvNo }" readonly>
             		<input type="text" name="poolName" id="poolName" class="form-control" placeholder="Please enter the pool name">
             		&nbsp; 
					<span id="poolNameHelper" class="helper"></span>
              		<input type="text" name="poolWidth" id="poolWidth" class="form-control" placeholder="Please enter the pool width">
              		&nbsp; 
					<span id="poolWidthHelper" class="helper"></span>
              		<input type="text" name="poolLength" id="poolLength" class="form-control" placeholder="Please enter the pool length">
              		&nbsp; 
					<span id="poolLengthHelper" class="helper"></span>
              		<input type="text" name="depth" id="depth" class="form-control" placeholder="Please enter the pool depth">
              		&nbsp; 
					<span id="depthHelper" class="helper"></span>
            		<select name="hotWater" id="hotWater" class="form-control">
               			<option value="-1">:: 온수 여부 ::</option>
                    	<option value="Y">Y</option>
                    	<option value="N">N</option>
              		</select>
              		&nbsp; 
					<span id="hotWaterHelper" class="helper"></span>
            		<select name="indoorOutdoor" id="indoorOutdoor" class="form-control">
               			<option value="-1">:: 실내/야외 ::</option>
                    	<option value="실내">실내</option>
                    	<option value="야외">야외</option>
              		</select>
              		&nbsp; 
					<span id="indoorOutdoorHelper" class="helper"></span>
           		</div>
				<div class="form-group">
					<button type="button" class="btn btn-primary btn-sm" id="submit3" >추가</button>
				</div>
			</div>
		</form>
		</table>
		<hr>
		<a href="${pageContext.request.contextPath}/host/selectHostPoolvillaOneController?pvNo=${ param.pvNo }" class = "btn btn-primary btn-sm">update완료</a>

    </div>
  </section>  

  	<!-- START: footer -->
	       <div id="includeFooter"></div>
	<!-- END: footer -->

  <div class="gototop js-top">
    <a href="${pageContext.request.contextPath}/template/#" class="js-gotop"><i class="icon-chevron-thin-up"></i></a>
  </div>

  </body>
  
  <script>
        $("#includeHeader").load('${pageContext.request.contextPath}/includeHeaderController');
        $("#includeFooter").load('${pageContext.request.contextPath}/includeFooterController');
        
        $('#submit3').click(function(){
    			$('#poolNameHelper').text('');    		
    			$('#poolWidthHelper').text('');
    			$('#poolLengthHelper').text('');
    			$('#depthHelper').text('');
    			$('#hotWaterHelper').text('');
    		if($('#poolName').val()==''){
    			$('#poolNameHelper').text('수영장을 입력하세요');
    			$('#poolName').focus();
    		
    		}else if($('#poolWidth').val() == '') {
    			$('#poolWidthHelper').text('가로 길이를 입력하세요');
    			$('#poolWidth').focus();
    		} else if($('#poolLength').val()=='') {
    			$('#poolLengthHelper').text('세로 길이를 입력하세요');
    			$('#poolLength').focus();
    		
    		} else if($('#depth').val() == '') {
    			$('#depthHelper').text('깊이를 입력하세요');
    			$('#depth').focus();
    		
    		} else if($('#hotWater').val() == -1) {
    			$('#hotWaterHelper').text('온수 여부를 입력하세요');
    			$('#hotWater').focus(); 
    		
    		} else if($('#indoorOutdoor').val() == -1) {
    			$('#indoorOutdoorHelper').text('실내/야외를 입력하세요');
    			$('#indoorOutdoor').focus();
    		} else {
    			$('#insertForm3').submit();
    		}
    	});
        
        
  </script>
  
  <script src="${pageContext.request.contextPath}/template/js/scripts.min.js"></script>
  <script src="${pageContext.request.contextPath}/template/js/main.min.js"></script>
  <script src="${pageContext.request.contextPath}/template/js/custom.js"></script>
  
</html>