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
	<form id="buy_insert_form" class="buyinsert_form" name="buy_insert_form" method="post" action="buy_insert">
	<input type="hidden" name="vendname" id="vendname">
	<input type="hidden" name="seq" id="seq" value="0">
	<input type="hidden" name="beforeqty" id="beforeqty" value="0">
	<input type="hidden" name="beforeprocode" id="beforeprocode">
	<input type="hidden" name="beforeprice" id="beforeprice" value="0">
		<div class="container" style="margin-top: 100px">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-4"></div>
					<div class="input-group mb-3 col-md-4 ">
						<div class="input-group-prepend">
							<span
								style="text-align: center; font-style: inherit; margin-bottom: 20px; font-size: 30px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								&nbsp&nbsp매입 </span>
						</div>
					</div>
					<div class="col-md-4"></div>
				</div>
				
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-2"></div>
						<div class="input-group mb-3 col-md-8 ">
							<div class="input-group-prepend">
								<span class="input-group-text" style="width: 80px"> 거래처</span>
							</div>
							<select name="vendcode" id="selectvender" style="width: 280px">
								<c:forEach var="vender" items="${vender}">
									<option value="${vender.code}"<c:if test="${vender.code == buy.vendcode}">selected</c:if> >${vender.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class="row">
						<div class="col-md-2"></div>
						<div class="input-group mb-3 col-md-8 ">
							<div class="input-group-prepend">
								<span class="input-group-text" style="width: 80px"> 매입 번호</span>
							</div>
							<input id="yyyy" name="yyyy" type="text"	class="form-control" placeholder="" readonly="readonly"	 value="${buy.yyyy}" aria-label="UsernAddress" aria-describedby="basic-addon1">
							<input id="mm" name="mm" type="text"	class="form-control" placeholder="" readonly="readonly" value="${buy.mm}" 	aria-label="UsernAddress" aria-describedby="basic-addon1">
							<input id="dd" name="dd" type="text"	class="form-control" placeholder="" readonly="readonly"	 value="${buy.dd}" aria-label="UsernAddress" aria-describedby="basic-addon1">
							<input id="no" name="no" type="text"	class="form-control" placeholder="" readonly="readonly"	 value="${buy.no}" aria-label="UsernAddress" aria-describedby="basic-addon1">
							<input id="hang" name="hang" type="text"	class="form-control" placeholder="" readonly="readonly" value="${buy.hang}"	aria-label="UsernAddress" aria-describedby="basic-addon1">
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-2"></div>
						<div class="input-group mb-3 col-md-10 ">
							<div class="input-group-prepend">
								<span class="input-group-text" style="width: 80px"> 상품명</span>
							</div>
							<select name="productcode" id="selectproduct" style="width: 280px">
								<c:forEach var="product" items="${product}">
									<option value="${product.code}">${product.name}&nbsp&nbsp ${product.capacity}</option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class="row">
						<div class="col-md-2"></div>
						<div class="input-group mb-3 col-md-10 ">
							<div class="input-group-prepend">
								<span class="input-group-text" style="width: 80px"> 상품코드</span>
							</div>
							<input id="procode" name="procode" type="text"	class="form-control" placeholder=""	aria-label="UsernAddress" aria-describedby="basic-addon1">
							<span class="input-group-text" style="width: 80px"> 현재재고 </span>
							<input id="stock" name="stock" type="text"	class="form-control" placeholder=""	aria-label="UsernAddress" aria-describedby="basic-addon1">
						</div>
					</div>

					<div class="row">
						<div class="col-md-2"></div>
						<div class="input-group mb-3 col-md-10 ">
							<div class="input-group-prepend">
								<span class="input-group-text" style="width: 80px"> 단가</span>
							</div>
							<input id="price" name="price" type="text"	class="form-control" placeholder=""	aria-label="UsernAddress" aria-describedby="basic-addon1">
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-2"></div>
						<div class="input-group mb-3 col-md-10">
							<div class="input-group-prepend">
								<span class="input-group-text" style="width: 80px"> 수량</span>
							</div>
							<input id="qty" name="qty" type="text"	class="form-control" placeholder=""	aria-label="UsernAddress" aria-describedby="basic-addon1">
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-2"></div>
						<div class="input-group mb-3 col-md-10 ">
							<div class="input-group-prepend">
								<span class="input-group-text" style="width: 80px"> 금액</span>
							</div>
							<input id="amount" name="amount" type="text"	class="form-control" placeholder=""	aria-label="UsernAddress" aria-describedby="basic-addon1">
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-2"></div>
						<div class="input-group mb-3 col-md-10 ">
							<div class="input-group-prepend">
								<span class="input-group-text" style="width: 80px"> 비고</span>
							</div>
							<input id="memo" name="memo" type="text"	class="form-control" placeholder=""	aria-label="UsernAddress" aria-describedby="basic-addon1">
						</div>
					</div>

					<div class="row" style="margin-bottom: 100px; margin-top: 20px">
					
						<div class="col-md-12" align="center">
							<button id="buy_save_btn" name="buy_save_btn" type="button" class="btn btn-success save" style="margin-right: 10px; color: #000000">저 장</button>
							<button id="buy_reset_btn" name="buy_reset_btn" type="reset"	class="btn btn-info" style="margin-right: 10px; color: #000000">리 셋</button>
							<button id="buyupdate" name="buyupdate" type="button" class="btn btn-success " style="display: none;color: #000000">Update</button>
							<button id="cancel_btn" name="cancel_btn" type="reset" class="btn btn-danger" style="margin-left: 10px; color: #000000">취 소</button>
							<button id="new_btn" name="new_btn" type="button" class="btn btn-info" style="margin-left: 10px; color: #000000"
							 onclick="location.href='buy_insert_form'">New</button>
							<button id="buydelete" name="buydelete" type="button" class="btn btn-danger " style="display: none;color: #000000;margin-left: 10px">Delete</button>
						</div>
					</div>

				</div>
				</form>
				
				<div class="col-md-6">
					<div class="row pre-scrollable" >
						<div class="input-group mb-3 col-md-12 ">
							<div class="input-group-prepend">
							<span style="width: 260px">
								<input id="" name="" type="text" value=" ${buy.vendname} (${buy.vendcode})"	class="form-control" placeholder="" readonly="readonly"	aria-label="UsernAddress" aria-describedby="basic-addon1">
							</span>
							<span style="width: 260px">
								<input id="" name="" type="text" value="${buy.yyyy}-${buy.mm}-${buy.dd}"	class="form-control" placeholder="" readonly="readonly" aria-label="UsernAddress" aria-describedby="basic-addon1">
							</span>
							</div>
						</div>
						<table id="examplebuy" class="table table-striped table-bordered" style="width: 100%;  ">
							<thead>
								<tr>
									<th scope="col" style="text-align: center;">yyyy-mm-dd</th>
									<th scope="col" style="text-align: center;">No</th>
									<th scope="col" style="text-align: center;">항번</th>
									<th scope="col" style="text-align: center;">품명</th>
									<th scope="col" style="text-align: center;">단가</th>
									<th scope="col" style="text-align: center;">수량</th>
									<th scope="col" style="text-align: center;">금액</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="buys" items="${buys}" varStatus="status">
									<tr>
										<c:choose>
											<c:when test="${buys.hang==0 && buys.no !=0}">
												<td style="vertical-align: middle"></td>
												<td style="vertical-align: middle"></td>
												<td style="vertical-align: middle"></td>
												<td style="vertical-align: middle; background-color: #90a4ae; color: #fff">소	계</td>
												<td style="vertical-align: middle; background-color: #90a4ae; color: #fff"></td>
												<td style="vertical-align: middle; background-color: #90a4ae; color: #fff">${buys.qty}</td>
												<td style="vertical-align: middle; background-color: #90a4ae; color: #fff">${buys.total}</td>
											</c:when>
											<c:when test="${buys.hang==0 && buys.no ==0}">
												<td style="vertical-align: middle"></td>
												<td style="vertical-align: middle"></td>
												<td style="vertical-align: middle"></td>
												<td style="vertical-align: middle; background-color: #3E4551; color: #fff">총	계</td>
												<td style="vertical-align: middle; background-color: #3E4551; color: #fff"></td>
												<td style="vertical-align: middle; background-color: #3E4551; color: #fff">${buys.qty}</td>
												<td style="vertical-align: middle; background-color: #3E4551; color: #fff">${buys.total}</td>
											</c:when>
											<c:otherwise>
												<td style="vertical-align: middle">${buys.yyyy}-${buys.mm}-${buys.dd}</td>
												<td style="vertical-align: middle">${buys.no}</td>
												<td style="vertical-align: middle">${buys.hang}</td>
												<td style="vertical-align: middle">
													<a href="#" onclick="selectedSeq(${buys.seq});">${buys.proname}</a>
												</td>
												<td style="vertical-align: middle">${buys.price}</td>
												<td style="vertical-align: middle">${buys.qty}</td>
												<td style="vertical-align: middle">${buys.total}</td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						</div>

					<div class="row">
						<div class="col-md-2"></div>
						<div class="input-group mb-3 col-md-10 ">
						<form id="buysearch_form" action="buySearch" method="get">
							<div class="input-group-prepend">
								<!-- 오른쪽 검색부분 -->							
								<select name="searchvender" id="searchvender" style="width: 180px">
									<c:forEach var="vender" items="${vender}">
										<option value="${vender.code}">${vender.name}</option>
									</c:forEach>
								</select>
								<input id="searchyyyy" name="searchyyyy" type="text" style="margin-left: 10px" value="${buy.yyyy}" class="form-control" placeholder="" aria-label="UsernAddress" aria-describedby="basic-addon1">	 
								<select name="searchmm" id="searchmm" style="margin-left: 10px; width: 80px">
									<c:forEach begin="1" end="12" var="i">
										<option value="${i}"<c:if test="${i == buy.mm}">selected</c:if> >${i}</option>
									</c:forEach>
								</select>
								<select name="searchdd" id="searchmmdd" style="margin-left: 10px; width: 80px">
									<c:forEach begin="0" end="31" var="i" >
										<option value="${i}"<c:if test="${i == buy.dd}">selected</c:if> >${i}</option>
									</c:forEach>
								</select>
								<button id="buysearch_btn" name="buysearch_btn" type="button" class="btn btn-info save" style="margin-left: 10px; color: #000000">검 색</button>
							</div>
						</div>
						</form>
					</div>

					<!-- Modal -->
					<div class="modal fade" id="buyModal" role="dialog">
						<div class="modal-dialog modal-sm">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>
								<div class="modal-body" id="buy-modal-body">
									<p>
										<span id="modalmsgvender"></span>
									<p>
										<span id="modalmsgproduct"></span>
									<p>
										<span id="modalmsg"></span>
								</div>
								<div class="modal-footer">
									<button type="button" id="buy_modal_btn1"
										class="btn btn-success modal_btn1" data-dismiss="modal">사용</button>
									<button type="button" id="buy_modal_btn2"
										class="btn btn-danger modal_btn2" data-dismiss="modal">취소</button>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	
</body>
</html>