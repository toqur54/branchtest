<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap core CSS -->
    <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <link href="resources/css/agency.min.css" rel="stylesheet">
</head>
<body>
	   <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="index">My Templete</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fa fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse row" id="navbarResponsive">
        
          <ul class="navbar-nav text-uppercase ml-auto">
          
			<li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="jfreeChart" style="color: olive;">통계</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="finalForm" style="color: olive;">마감</a>
            </li>
			<li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="buy_insert_form" style="color: olive;">매입</a>
            </li>
			<li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="pay_insert_form" style="color: olive;">대금지불</a>
            </li>
			<li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="balance_search" style="color: olive;">거래현황</a>
            </li>
			<li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="vender_insert_form" style="color: olive;">거래처등록</a>
            </li>
			<li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="vender_search" style="color: olive;">거래처관리</a>
            </li>
			<li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="product_insert_form" style="color: olive;">상품등록</a>
            </li>
			<li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="product_search" style="color: olive;">상품검색</a>
            </li>
			<li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="salary_search" style="color: olive;">급여관리</a>
            </li>
			<li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="salary_insert_form" style="color: olive;">급여등록</a>
            </li>
			<li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="salaryTaxForm" style="color: olive;">급여계산</a>
            </li>
			<li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="salary_list_form" style="color: olive;">급여년도</a>
            </li>
			<li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="salaryroll_search" style="color: olive;">급여리스트</a>
            </li>
			<li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="member_insert_form" style="color: olive;">회원가입</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="member_search" style="color: olive;">회원검색</a>
            </li>
            
			<li class="nav-item" style="color: gray;"> 
			
				<c:choose>
						<c:when test="${sessionemail == null }">
						 <li class="nav-item" style="color: gray;"> 
							<a href="boardPageList" class="nav-link js-scroll-trigger" style="color: olive;">게시판</a>
						</li>
						<li class="nav-item" style="color: gray;"> 
							<a href="loginForm" class="nav-link js-scroll-trigger" style="color: olive;">Login</a>
						</li>
						</c:when>
						<c:otherwise>
							<li class="nav-item">
								<a class="nav-link js-scroll-trigger" href="member_update?email=${sessionemail}" style="color: olive;">정보 수정</a>
							</li>
							<li class="nav-item" style="color: olive;"> 
								<a href="boardPageList" class="nav-link js-scroll-trigger" style="color: olive;">게시판</a>
							</li>
							<li class="nav-item">
								<a class="nav-link js-scroll-trigger" href="logout" style="color: olive;">logout</a>
							</li>
							<label class="btn" role="button" style="color: #000">
								<img src="${sessionphoto}" class="rounded-circle" style="border: 1px solid; width: 30px" height="30px">
								<font color="olive"> ${sessionname} </font>
							</label>
							
						</c:otherwise>
					</c:choose>
				</li>
					
          </ul>
          		
        </div>
      </div>
    </nav>
    
    <!-- Bootstrap core JavaScript -->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Contact form JavaScript -->
    <script src="resources/js/jqBootstrapValidation.js"></script>
    <script src="resources/js/contact_me.js"></script>

    <!-- Custom scripts for this template -->
    <script src="resources/js/agency.min.js"></script>
    
    <script src="resources/js/jquery.min.js"></script>
<!--     <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script> -->
    
</body>
</html>