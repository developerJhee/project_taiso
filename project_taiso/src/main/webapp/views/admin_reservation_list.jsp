<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
   <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="shortcut icon" type="image/x-icon" href="./images/logo.png">
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="./css/animate.css">
    <link rel="stylesheet" href="./css/owl.carousel.min.css">
    <link rel="stylesheet" href="./css/owl.theme.default.min.css">
    <link rel="stylesheet" href="./css/magnific-popup.css">
    <link rel="stylesheet" href="./css/aos.css">
    <link rel="stylesheet" href="./css/ionicons.min.css">
    <link rel="stylesheet" href="./css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="./css/jquery.timepicker.css">
    <link rel="stylesheet" href="./css/flaticon.css">
    <link rel="stylesheet" href="./css/icomoon.css">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/adminReservation.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
  
  <!-- sweetalert -->
  		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
		
  <!-- 자동완성api -->
  	  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
 	  <link rel="stylesheet" href="/resources/demos/style.css">
  
  <!-- 블로그 로딩 코드 start -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
#waiting {
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    position: fixed;
    display: flex;
    background: white;
    z-index: 999;
    opacity: 0.9;
}
#waiting > img {
    display: flex;
    width: fit-content;
    height: fit-content;
    margin: auto;
}
</style>
<div id="waiting">
   <img src="./img/loading.gif">
</div>

<script type="text/javascript">
    $(window).on('load', function() {
        setTimeout(function(){
            $("#waiting").fadeOut();
        }, 300);
    });
</script>
<!-- 블로그 로딩 코드 end -->
  
 <script type="text/javascript">
 function fun1(){
	 
 if(document.fr.type.value==""){
	 
	 Swal.fire({   
         title : '검색유형을 선택하세요!',
          icon: 'info',
         confirmButtonText: '확인'
      })
		document.fr.type.focus();
		return false;
	}
 
 }
 </script>
  
</head>
 <body>
  <div id="wrap">
	<!-- 헤더들어가는 곳 -->
	<jsp:include page="../inc/top.jsp"/>
	    
    <section class="hero-wrap hero-wrap-2 js-fullheight"  style="background-image: url('images/bg_6.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
      	<div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="./AdminMain.mb">admin <i class="ion-ios-arrow-forward"></i></a></span> 
						<span>admin Reservation <i class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-3 bread">관리자 예약 조회 리스트</h1>
				</div>
			</div>
      	</div>
    </section>
	<!-- 헤더들어가는 곳 -->
	
	<!-- 메인 -->
	
	
  	<div class="adminReservation_wrap2">
        <div class="adminReservation_title">
            <strong><a href="./AdminReservationList.rez">관리자 예약 조회 리스트</a></strong>
            
				<!--  검색 폼 -->
					<div class="n_search" border="1" width="90%" >
		      			<p> 전체 글 개수 : ${requestScope.totalCnt } 개 </p>
<!-- 						<div class="n_search" border="1" width="90%"> -->
							<div align="right">
							<form action="./SearchList.rez" name="fr" onsubmit="return fun1()">
								<select name="type" id="type">
									<option value="">::검색유형::</option>
									<option value="1">아이디</option>
									<option value="2">예약번호</option>
								</select>
								<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요" >  
								<input type="submit" value="검색" class="btn btn-outline-primary">
							</form>
							</div> 
<!-- 						</div> -->
					</div>
            
        </div>
        
        <div class="adminReservation_list_wrap">
            <div class="adminReservation_list">
                <div class="top">
			<div class="count">고객아이디</div>
			<div class="num2">예약번호</div>
			<div class="num">예약상태</div>
			 <div class="date3">대여일시</div>
			 <div class="date3">반납일시</div>
			<div class="num1">총 예약일시</div>
			 <div class="count2">관리</div>
		</div>

        <c:choose>
        <c:when test="${adminRezList.size() != 0 }">
			<c:forEach var="rezDTO" items="${adminRezList }">
				  <div>
					<div class="count">${rezDTO.mem_id }</div>
					<div class="num2">${rezDTO.rez_uqNum }</div>
					<div class="num">${rezDTO.rez_status }</div>
				    <div class="date3">${rezDTO.rez_rentalDate }</div>
				    <div class="date3">${rezDTO.rez_returnDate }</div>
					<div class="num1">${rezDTO.rez_totalDate }</div>
					<div class="count2">
	
					 <a href="./AdminReservationDetailList.rez?rez_uqNum=${rezDTO.rez_uqNum }&pageNum=${pageNum }">예약정보상세조회</a>
	
					</div>
				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<div class="col-md-15">
           	<h1>
           		<div class="caricon"></div>
           	</h1>
           		<br> <h5>예약정보가 없습니다.</h5> <br>
           		<input class="btn btn-primary" type="button" value = "뒤로가기" onclick="javascript:history.back();">
           	</div>
		</c:otherwise>
		</c:choose>
	</div>
	
		<br>

			<!-- 페이징처리 -->
    			<c:if test="${totalCnt != 0 }">

			<div class="col text-center">
				<div class="block-27">
					<ul>
			<!-- 이전 -->
			<c:if test="${startPage > pageBlock }">
				<a href="./AdminReservationList.rez?pageNum=${startPage-pageBlock }">[이전]</a>
			</c:if>
						<!-- 페이지 번호(1,2,3...) -->
					<c:forEach var="i" begin="${startPage }" end="${endPage }"
						step="1">
							<li <c:if test="${pageNum == i }">class="active" </c:if>
								
							>
						<span>
						<a href="./AdminReservationList.rez?pageNum=${i }">${i }</a>
						</span>
						</li>
						

						</c:forEach>
					<!-- 다음 -->
			<c:if test="${endPage < pageCount }">
				<a href="./AdminReservationList.rez?pageNum=${startPage+pageBlock }">[다음]</a>
			</c:if>
					</ul>
					
				</div>
			</div>

		</c:if>
		<div id="table_search">
			<input type="button" value="관리자메인페이지로이동" class="btn btn-primary py-2 mr-1" 
				onclick=" location.href='./AdminMain.mb';"
			>
		</div>
  
      </div><br>
      
        </div>
    </div>
<div class="clear"></div>
<div id="page_control">
</div>
	<script src="./js/jquery.min.js"></script>
	<script src="./js/jquery-migrate-3.0.1.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	<script src="./js/jquery.easing.1.3.js"></script>
	<script src="./js/jquery.waypoints.min.js"></script>
	<script src="./js/jquery.stellar.min.js"></script>
	<script src="./js/owl.carousel.min.js"></script>
	<script src="./js/jquery.magnific-popup.min.js"></script>
	<script src="./js/aos.js"></script>
	<script src="./js/jquery.animateNumber.min.js"></script>
	<script src="./js/bootstrap-datepicker.js"></script>
	<script src="./js/jquery.timepicker.min.js"></script>
	<script src="./js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="./js/google-map.js"></script>
	<script src="./js/main.js"></script>
</body>
</html>