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
	<form id="vender_search" name="vender_search" method="get" action="vender_search">
		<div class="container" style="margin-top: 100px">
			<div class="row">
				<div class="col-md-4"></div>
				<div class="input-group mb-3 col-md-4 ">
					<div class="input-group-prepend">
						<span style="text-align: center; font-style: inherit; margin-bottom: 20px; font-size: 30px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 거래처 검색 </span>
					</div>
				</div>
				<div class="col-md-4"></div>
			</div>
			
			<table id="examplepvender" class="table table-dark table-striped table-bordered" style="width:100%;">
				<thead>
					<tr>
						<th scope="col" style="text-align: center;">코드</th>
						<th scope="col" style="text-align: center;">상호</th>
						<th scope="col" style="text-align: center;">대표자명</th>
						<th scope="col" style="text-align: center;">업태</th>
						<th scope="col" style="text-align: center;">종목</th>
						<th scope="col" style="text-align: center;">사업자번호</th>
						<th scope="col" style="text-align: center;">우편번호</th>
						<th scope="col" style="text-align: center;">구주소</th>
						<th scope="col" style="text-align: center;">신주소</th>
						<th scope="col" style="text-align: center;">상세주소</th>
						<th scope="col" style="text-align: center;">상호 전화번호</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="venders" items="${venderfind}" varStatus="status">
							<tr>
								<td style="text-align: center; vertical-align: middle;">
									<a href="vender_update_form?code=${venders.code}">${venders.code}</a>
								</td>
								<td style="text-align: center; vertical-align: middle;">${venders.name}</td>
								<td style="text-align: center; vertical-align: middle;">${venders.ceoname}</td>
								<td style="text-align: center; vertical-align: middle;">${venders.bustype}</td>
								<td style="text-align: center; vertical-align: middle;">${venders.busconditions}</td>
								<td style="text-align: center; vertical-align: middle;">${venders.busno1}-${venders.busno2}-${venders.busno3}</td>
								<td style="text-align: center; vertical-align: middle;">${venders.zipcode}</td>
								<td style="text-align: center; vertical-align: middle;">${venders.newaddr}</td>
								<td style="text-align: center; vertical-align: middle;">${venders.oldaddr}</td>
								<td style="text-align: center; vertical-align: middle;">${venders.detailaddr}</td>
								<td style="text-align: center; vertical-align: middle;">${venders.officeno1}-${venders.officeno2}-${venders.officeno3}</td>
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