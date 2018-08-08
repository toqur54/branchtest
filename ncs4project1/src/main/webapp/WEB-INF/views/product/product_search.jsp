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
<form id="product_search" name="product_search" method="get" action="product_search">
		<div class="container" style="margin-top: 100px">
			<div class="row">
				<div class="col-md-4"></div>
				<div class="input-group mb-3 col-md-4 ">
					<div class="input-group-prepend">
						<span style="text-align: center; font-style: inherit; margin-bottom: 20px; font-size: 30px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 물류 검색 </span>
					</div>
				</div>
				<div class="col-md-4"></div>
			</div>
			
			<table id="exampleproduct" class="table table-dark table-striped table-bordered" style="width:100%;">
				<thead>
					<tr>
						<th scope="col" style="text-align: center;">바코드</th>
						<th scope="col" style="text-align: center;">상품명</th>
						<th scope="col" style="text-align: center;">상품규격</th>
						<th scope="col" style="text-align: center;">매입단가</th>
						<th scope="col" style="text-align: center;">매출단가</th>
						<th scope="col" style="text-align: center;">전년말재고</th>
						<th scope="col" style="text-align: center;">전월말재고</th>
						<th scope="col" style="text-align: center;">전일재고</th>
						<th scope="col" style="text-align: center;">1월매입</th>
						<th scope="col" style="text-align: center;">1월매출</th>
						<th scope="col" style="text-align: center;">2월매입</th>
						<th scope="col" style="text-align: center;">2월매출</th>
						<th scope="col" style="text-align: center;">3월매입</th>
						<th scope="col" style="text-align: center;">3월매출</th>
						<th scope="col" style="text-align: center;">4월매입</th>
						<th scope="col" style="text-align: center;">4월매출</th>
						<th scope="col" style="text-align: center;">5월매입</th>
						<th scope="col" style="text-align: center;">5월매출</th>
						<th scope="col" style="text-align: center;">6월매입</th>
						<th scope="col" style="text-align: center;">6월매출</th>
						<th scope="col" style="text-align: center;">7월매입</th>
						<th scope="col" style="text-align: center;">7월매출</th>
						<th scope="col" style="text-align: center;">8월매입</th>
						<th scope="col" style="text-align: center;">8월매출</th>
						<th scope="col" style="text-align: center;">9월매입</th>
						<th scope="col" style="text-align: center;">9월매출</th>
						<th scope="col" style="text-align: center;">10월매입</th>
						<th scope="col" style="text-align: center;">10월매출</th>
						<th scope="col" style="text-align: center;">11월매입</th>
						<th scope="col" style="text-align: center;">11월매출</th>
						<th scope="col" style="text-align: center;">12월매입</th>
						<th scope="col" style="text-align: center;">12월매출</th>
						<th scope="col" style="text-align: center;">현재재고</th>
						<th scope="col" style="text-align: center;">상품설명</th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach var="products" items="${productfind}" varStatus="status">
							<tr>
								<td style="text-align: center; vertical-align: middle;">
									<a href="product_update?code=${products.code}">${products.code}</a>
								</td>
								<td style="text-align: center; vertical-align: middle;">${products.name}</td>
								<td style="text-align: center; vertical-align: middle;">${products.capacity}</td>
								<td style="text-align: center; vertical-align: middle;">${products.buyprice}</td>
								<td style="text-align: center; vertical-align: middle;">${products.saleprice}</td>
								<td style="text-align: center; vertical-align: middle;">${products.preyystock}</td>
								<td style="text-align: center; vertical-align: middle;">${products.premmstock}</td>
								<td style="text-align: center; vertical-align: middle;">${products.preddstock}</td>
								<td style="text-align: center; vertical-align: middle;">${products.buy01}</td>
								<td style="text-align: center; vertical-align: middle;">${products.sale01}</td>
								<td style="text-align: center; vertical-align: middle;">${products.buy02}</td>
								<td style="text-align: center; vertical-align: middle;">${products.sale02}</td>
								<td style="text-align: center; vertical-align: middle;">${products.buy03}</td>
								<td style="text-align: center; vertical-align: middle;">${products.sale03}</td>
								<td style="text-align: center; vertical-align: middle;">${products.buy04}</td>
								<td style="text-align: center; vertical-align: middle;">${products.sale04}</td>
								<td style="text-align: center; vertical-align: middle;">${products.buy05}</td>
								<td style="text-align: center; vertical-align: middle;">${products.sale05}</td>
								<td style="text-align: center; vertical-align: middle;">${products.buy06}</td>
								<td style="text-align: center; vertical-align: middle;">${products.sale06}</td>
								<td style="text-align: center; vertical-align: middle;">${products.buy07}</td>
								<td style="text-align: center; vertical-align: middle;">${products.sale07}</td>
								<td style="text-align: center; vertical-align: middle;">${products.buy08}</td>
								<td style="text-align: center; vertical-align: middle;">${products.sale08}</td>
								<td style="text-align: center; vertical-align: middle;">${products.buy09}</td>
								<td style="text-align: center; vertical-align: middle;">${products.sale09}</td>
								<td style="text-align: center; vertical-align: middle;">${products.buy10}</td>
								<td style="text-align: center; vertical-align: middle;">${products.sale10}</td>
								<td style="text-align: center; vertical-align: middle;">${products.buy11}</td>
								<td style="text-align: center; vertical-align: middle;">${products.sale11}</td>
								<td style="text-align: center; vertical-align: middle;">${products.buy12}</td>
								<td style="text-align: center; vertical-align: middle;">${products.sale12}</td>
								<td style="text-align: center; vertical-align: middle;">${products.stock}</td>
								<td style="text-align: center; vertical-align: middle;">${products.explanation}</td>
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