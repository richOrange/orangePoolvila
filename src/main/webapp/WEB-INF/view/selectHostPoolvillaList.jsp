<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Orange-poolvilla:poolvillaList</title>
    <meta name="description" content="Free Bootstrap Theme by uicookies.com">
    <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">
    
    <!-- <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet"> -->
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
                <a href="${pageContext.request.contextPath}/template/#">List</a><span>Host Poolvilla List</span>
              </div>
              <h1>Poolvilla List</h1>
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
  
	<!-- poolvillaList와 상세검색기능 부분 시작-->
	<form method="get" action="${pageContext.request.contextPath}/host/selectHostPoolvillaListController">
	  <section class="probootstrap-section probootstrap-section-lighter">
	    <div class="container">
	    	<!-- poolvillaList 부분  시작-->
				<div class="row">
	  				<c:forEach var="m" items="${poolvillaList}" varStatus="status">
	    				<div class="col-md-4">
		   					<div class="probootstrap-card probootstrap-listing">
		        			<!-- 상품 img 부분 -->
			        			<div class="probootstrap-card-media">
				        			<c:if test="${ not empty m.photoName }">
				        				<img src="${pageContext.request.contextPath}/image/poolvilla/${m.photoName}" class="img-responsive">
				        			</c:if>
			        			</div>
			        			<!-- 이미지 내 상품설명부분 -->
			        			<div class="probootstrap-card-text"> 
			          				<h2 class="probootstrap-card-heading"><a href="${pageContext.request.contextPath}/host/selectHostPoolvillaOneController?pvNo=${m.pvNo}">${m.pvName}</a></h2>
			          				<div class="probootstrap-listing-location">
			            				<i class="icon-location2"></i> <span>${m.address}</span>
			          				</div>
			          				<div class="probootstrap-listing-price"><strong>${m.price}원</strong> / Day</div>
		       					</div>
			        			<div class="probootstrap-card-extra">
			          				<ul>
			            				<li>
		             					  면적
		              					  <span>${m.pvSize} m2</span>
			            				</li>
							            <li>
							              방 개수
							              <span>${m.roomCnt}</span>
							            </li>
							            <li>
							              최대인원
							              <span>${m.pvPeople}</span>
							            </li>
							            <li>
							              평균 만족도
							              <span>${m.reviewSatisfaction}/10 </span>
							            </li>
							          </ul>
			        			</div>
		        			</div>
	        			</div>
	    		<!-- 한줄에 3개씩 나오게 하는 if문 -->
	    				<c:if test="${status.count%3== 0}">
	    					</div><div class="row">
	    				</c:if>
    			</c:forEach>
	      <a href="${pageContext.request.contextPath}/host/insertPoolvillaController" class = "btn btn-primary btn-sm">상품 추가</a>
   	      <!-- 페이징 부분 시작 -->
			<div>
			<!-- 이전 목록 표시 -->
				<c:if test="${minPage > 10 }">
					<button type = "submit" value ="${minPage-10}" name ="minPage" class="btn">이전목록</button>
				</c:if>				
			<!-- 이전 부분 -->
				<c:if test="${currentPage>1}">
			 		<button type = "submit" value ="${currentPage-1}" name = "currentPage" class="btn" >이전</button>
				</c:if>
			<!-- 목록 사이 번호 표시 -->
				<c:forEach var="i" begin="${minPage}" end="${minPage+9}" step="1">
					<c:if test= "${i <= lastPage}" >
						<c:if test="${currentPage == i}">
							<button type = "submit" value="${i}" name = "currentPage" class="btn btn-primary">${i}</button>
						</c:if>
						<c:if test="${currentPage != i}">
							<button type = "submit" value ="${i}" name = "currentPage" class="btn btn-default">${i}</button>
						</c:if>
					</c:if>
				
				</c:forEach>
				<!-- 다음 부분 -->
				<c:if test="${currentPage< lastPage }">
			 		<button type = "submit" value ="${currentPage+1}" name = "currentPage" class="btn" >다음</button>
				</c:if>
				<!-- 다음목록 표시 -->
				<c:if test="${minPage+10<= lastPage }">
			 		<button type = "submit" value ="${minPage+10 }" name = "minPage" class="btn">다음목록</button>
				</c:if>
			 </div>
		</div>
	      <!-- 페이징 부분 끝 --> 
	  </section>
	</form>
	<!-- poolvillaList 부분 끝-->
  <!-- END: section -->

	<!-- START: footer -->
	       <div id="includeFooter"></div>
	<!-- END: footer -->

  <div class="gototop js-top">
    <a href="#" class="js-gotop"><i class="icon-chevron-thin-up"></i></a>
  </div>

  </body>

  <script>
        $("#includeHeader").load('${pageContext.request.contextPath}/includeHeaderController');
        $("#includeFooter").load('${pageContext.request.contextPath}/includeFooterController');
  </script>
  
  <script src="js/scripts.min.js"></script>
  <script src="js/main.min.js"></script>
  <script src="js/custom.js"></script>
  
</html>