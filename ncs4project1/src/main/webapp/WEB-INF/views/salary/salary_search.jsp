<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<body>
	<form id="salary_search" name="salary_search" method="get" action="salary_search">
		<div class="container" style="margin-top: 100px">
			<div class="row">
				<div class="col-md-4"></div>
				<div class="input-group mb-3 col-md-4 ">
					<div class="input-group-prepend">
						<span style="text-align: center; font-style: inherit; margin-bottom: 20px; font-size: 30px">&nbsp&nbsp&nbsp Salary Search </span>
					</div>
				</div>
				<div class="col-md-4"></div>
			</div>
			
			<table id="examplesalary" class="table table-striped table-bordered" style="width:100%;">
				<thead>
					<tr>
						<th scope="col" style="text-align: center;">사원번호</th>
						<th scope="col" style="text-align: center;">이름</th>
						<th scope="col" style="text-align: center;">부서명</th>
						<th scope="col" style="text-align: center;">입사일</th>
						<th scope="col" style="text-align: center;">기본급</th>
						<th scope="col" style="text-align: center;">수당</th>
						<th scope="col" style="text-align: center;">배우자</th>
						<th scope="col" style="text-align: center;">자녀</th>
						<th scope="col" style="text-align: center;">부양자</th>
						<th scope="col" style="text-align: center;">장애인</th>
						<th scope="col" style="text-align: center;">부녀가장</th>
						<th scope="col" style="text-align: center;">처리유무</th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach var="salary" items="${salary}" varStatus="status">
							<tr>
								<td style="text-align: center; vertical-align: middle;">
									<a href="salary_update?empno=${salary.empno}">${salary.empno}</a>
								</td>
								<td style="text-align: center; vertical-align: middle;">${salary.name}</td>
								<td style="text-align: center; vertical-align: middle;">${salary.dept}</td>
								<td style="text-align: center; vertical-align: middle;">${salary.birth_date}</td>
								<td style="text-align: center; vertical-align: middle;">${salary.pay}</td>
								<td style="text-align: center; vertical-align: middle;">${salary.extra}</td>
								<td style="text-align: center; vertical-align: middle;">${salary.parter}</td>
								<td style="text-align: center; vertical-align: middle;">${salary.dependent20}</td>
								<td style="text-align: center; vertical-align: middle;">${salary.dependent60}</td>
								<td style="text-align: center; vertical-align: middle;">${salary.desabled}</td>
								<td style="text-align: center; vertical-align: middle;">${salary.womanpower}</td>
								<td style="text-align: center; vertical-align: middle;">${salary.yn}</td>
							</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div class="row" style="margin-top: 10px">
			<div class="col-md-3"></div>
			<div class="input-group mb-3 col-md-6 ">
				<div class="input-group-prepend">
					<input type="text" id="find" name="find" style="margin-right: 10px" value="${find}">
					<button id="search_btn" name="search_btn" type="submit" class="btn btn-info save" style="margin-right: 10px; color: #000000">검 색</button>
					<button id="reset_btn" name="reset_btn" type="reset" class="btn btn-info"	style="margin-right: 10px; color: #000000">리 셋</button>
					<button  id="cancel_btn" name="cancel_btn"  type="button" class="btn btn-danger save" style="margin-right: 10px; color: #000000">취 소</button>
				</div>
			</div>
			<div class="col-md-3"></div>
		</div>
		
		</div>
	</form>
</body>
</html>