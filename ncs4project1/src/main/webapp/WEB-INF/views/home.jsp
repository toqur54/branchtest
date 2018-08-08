<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/parsley.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"	crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>

</head>

<body>
<div class="container" style="margin-top: 20px">
		<div class="row">
				<div class="col-md-8"></div>
				<div class="input-group mb-3 col-md-2 ">
					<div class="input-group-prepend">
						<div>
						<c:choose>
							<c:when test="${sessionemail == null }">
								<a href="boardPageList"><button type="button" class="btn btn-info" style="color: #FFFFFF">게시판</button></a>
								<a href="loginForm"><button type="button" class="btn btn-info" style="color: #FFFFFF">Login</button></a>
							</c:when>
							<c:otherwise>
								<label class="btn btn-info" role="button" style="color: #fff">
								
										<a href="#" class="dropdown-toggle" id="ddlmenuItem" 	data-toggle="dropdown">
										<img src="${sessionphoto}" class="rounded-circle" style="border: 1px solid; width: 30px" height="30px">
									 	<font color="#FFFFFF"> ${sessionname} 	</font>
									 	</a>
										<ul class="dropdown-menu" role="menu" aria-labelledby="ddlmenuItem">
											<li role="presentation"><a role="menuitem" tabindex="-1" href="member_update?email=${sessionemail}">정보수정</a></li>
											<li role="presentation"><a role="menuitem" tabindex="-1" href="boardPageList?email=${sessionemail}">게시판</a></li>
											<li role="presentation"><a role="menuitem" tabindex="-1" href="logout">logout</a></li>
										</ul>
								</label>
							</c:otherwise>
						</c:choose>
						</div>
					</div>
				</div>
			</div>
			
	<c:forEach begin="1" end="1" var="x" step="1">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-2" id="aaa${x}">
					<img id="image11" name="image" src="resources/img/image11.png" class="rounded-circle" style="border: 1px solid; margin-top: 10px" width="140px" height="140px"> 
					<img id="image12" name="image" src="resources/img/image12.jpg" class="rounded-circle" style="border: 1px solid; margin-top: 10px" width="140px" height="140px"> 
			</div>
			
			<div class="col-md-2" id="bbb${x}">
					<img id="image21" name="image" src="resources/img/registe.png" class="rounded-circle" style="border: 1px solid; margin-top: 10px" width="140px" height="140px"> 
					<img id="image22" name="image" src="resources/img/member.png" class="rounded-circle" style="border: 1px solid; margin-top: 10px;" width="140px" height="140px"> 
			</div>
			
			<div class="col-md-2" id="ccc${x}">
					<img id="image31" name="image" src="resources/img/search.jpg" class="rounded-circle" style="border: 1px solid; margin-top: 10px" width="140px" height="140px"> 
					<img id="image32" name="image" src="resources/img/img2.gif" class="rounded-circle" style="border: 1px solid; margin-top: 10px" width="140px" height="140px"> 
			</div>
			<div class="col-md-2"></div>
		</div> 
	</c:forEach>

<!-- 	<a href="target"> target </a><br> -->
<!-- 	<p><a href="bootstrap"> bootstrap </a></p> -->
<!-- 	<p><a href="member_insert_form"> 회원가입 Member </a></p> -->
<!-- 	<p><a href="user_insert_form"> 회원가입 User </a></p> -->
</div>
</body>
</html>
