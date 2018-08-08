<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/parsley.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</head>
<script type="text/javascript">
	
	$(document).ready(function(){
		
	});
</script>

<body>
	<form id="member_search" name="member_search" method="post" action="member_search">
		<div class="container" style="margin-top: 20px">
			<div class="row">
				<div class="col-md-4"></div>
				<div class="input-group mb-3 col-md-4 ">
					<div class="input-group-prepend">
						<span
							style="text-align: center; font-style: inherit; margin-bottom: 20px; font-size: 30px"><i
							class="fas fa-info-circle"> User Search </i></span>
					</div>
				</div>
				<div class="col-md-4"></div>
			</div>
			<table class="table" style="background-color: black; color: white;">
				<thead>
					<th scope="col" style="text-align: center;" >Code</th>
					<th scope="col" style="text-align: center;">Name</th>
					<th scope="col" style="text-align: center;">Age</th>
					<th scope="col" style="text-align: center;">Gender</th>
					<th scope="col" style="text-align: center;">Number</th>
				</thead>
				<tbody>
					<c:forEach var="user" items="${users}" varStatus="status">
						<tr>
							<td style="text-align: center; vertical-align: middle;"><a href="user_update?code=${user.code}">${user.code}</a></td>
							<td style="text-align: center; vertical-align: middle;">${user.name}</td>
							<td style="text-align: center; vertical-align: middle;">${user.age}</td>
							<td style="text-align: center; vertical-align: middle;">${user.gender}</td>
							<td style="text-align: center; vertical-align: middle;">${status.count}</td>
<%-- 							<td style="text-align: left; vertical-align: middle;"><c:out value="${status.count}" /></td> --%>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</div>
	</form>
</body>
</html>