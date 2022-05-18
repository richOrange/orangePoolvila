<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Orange-poolvilla:cookingToolList</title>
    <meta name="description" content="Free Bootstrap Theme by uicookies.com">
    <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/styles-merged.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/style.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/custom.css">

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
              <h1>insert poolvilla info</h1>
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
		<h2>insert poolvilla info</h2>
		<br>
        <!-- Form -->
        <form action="${pageContext.request.contextPath}/host/insertPoolvillaController" method="post" class="probootstrap-form mb60" id="insertForm">
           	<table class = "table table-active">
				<tr>
					<td>판매자</td>
					<td><input type="text" name="hostId" id="hostId" class="form-control" value="${ sessionLoginMember.memberId }" readonly="readonly"></td>
				</tr>
				<tr>
					<td>지역</td>
					<td>
						<span id="locationNoHelper"></span>
						<select id="locationNo" name="locationNo" class="form-control">
	                     	<option value="-1">:: 지역 선택 ::</option>
		                      <c:forEach var ="m" items="${ locationList }">
		                      	<c:if test="${ m.locationNo == param.locationNo }">
		                         <option value="${ m.locationNo }" selected>${ m.locationName }</option>
		                      	</c:if>
		                         <option value="${ m.locationNo }">${ m.locationName }</option>
		                      </c:forEach>
	                    </select>
                    </td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
					<span id="addressNoHelper"></span>
		          	<input class="form-control" name="searchAddress" id ="searchAddress" placeholder="주소" type="text" value="${param.searchAddress}"/>
		          	<button class="btn btn-primary" type="submit">주소검색</button><br>
						<c:if test="${searchAddressList != null}">
		            		<select class="form-control" id="addressNo" name="addressNo">
			       		    	<option value = "" style="text-align:center;">:: 주소 선택 ::</option>
					            <c:forEach var="s" items="${searchAddressList}">
					            		<option value="${s.addressNo}" style="text-align:center;">${s.addr}</option>
					            </c:forEach>
			            	</select>
		            	</c:if>
					</td>
				</tr>
				<tr>
					<td>상세 주소</td>
					<td><input type="text" name="pvDetailaddr" class="form-control" placeholder="Please enter the detail address" value="${param.pvDetailaddr}"></td>
				</tr>
				<tr>
					<td>풀빌라 이름</td>
					<td><input type="text" name="pvName" value="${param.pvName}" class="form-control" placeholder="Please enter the poolvilla name"></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="text" name="price" value="${param.price}" class="form-control" placeholder="Please enter the price"></td>
				</tr>
				<tr>
					<td>면적</td>
					<td><input type="text" name="pvSize" value="${param.pvSize}" class="form-control" placeholder="Please enter the size"></td>
				</tr>
				<tr>
					<td>층수</td>
					<td><input type="text" name="pvFloor" value="${param.pvFloor}"  class="form-control" placeholder="Please enter the floor"></td>
				</tr>
				<tr>
					<td>최대 인원</td>
					<td><input type="text" name="pvPeople" value="${param.pvPeople}" class="form-control" placeholder="Please enter the people number"></td>
				</tr>
			</table>
			<button type="button" class="btn btn-primary" id="submit">insert</button>
          </form>
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
    	$('#submit').click(function() {
    		if($('#hostId').val()==''){
    			$('#hostId').focus();
    		}else if($('#locationNo').val() == -1) {
    			$('#locationNoHelper').text('지역을 입력해주세요');
    			$('#locationNo').focus();
    		} else if($('#addressNo').val()=='') {
    			$('#addressNoHelper').text('주소를 입력해주세요');
    			$('#searchAddress').focus();
    		} else if($('#name').val() == '') {
    			$('#addressNoHelper').text('');
    			$('#customerPwHelper2').text('');
    			
    			$('#idHelper').text('id는 4자 이상 입력해주세요');
    			$('#name').focus();
    		} else if($('.gender:checked').length == 0) {
    			$('#customerPwHelper').text('');
    			
    			$('#genderHelper').text('gender를 선택하세요');
    			$('.gender').focus(); // ?
    		} else if($('#birth').val() == '') {
    			$('#genderHelper').text('');
    			
    			$('#birthHelper').text('birth를 입력하세요');
    			$('.gender').focus();
    		} else if($('#emailId').val() == '' || $('#emailUrl').val() == '') {
    			$('#birthtHelper').text('');
    			
    			$('#emailHelper').text('email을 입력하세요');
    			$('#emailId').focus();
    		} else if($('#phone').val() == '') {
    			$('#emailHelper').text('');
    			
    			$('#phoneHelper').text('phone number를 입력하세요');
    			$('#phone').focus();
    		} else {
    			$('#insertForm').submit();
    		}
    	});
  </script>
  
  <script src="${pageContext.request.contextPath}/template/js/scripts.min.js"></script>
  <script src="${pageContext.request.contextPath}/template/js/main.min.js"></script>
  <script src="${pageContext.request.contextPath}/template/js/custom.js"></script>
  
</html>