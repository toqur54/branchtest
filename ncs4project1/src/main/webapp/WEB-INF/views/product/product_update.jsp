<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/parsley.min.js"></script>
<script src="resources/js/myquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
	
</head>
<body>
<form id="product_update_form" name="product_update_form" method="post" action="product_update_form" data-parsley-validate="true">
	<input type="hidden" id="confirm_yn" value="n">
		<div class="container" style="margin-top: 100px">
			<div class="row">
				<div class="col-md-4"></div>
				<div class="input-group mb-3 col-md-4 ">
					<div class="input-group-prepend">
						<span style="text-align: center; font-style: inherit; margin-bottom: 20px; font-size: 30px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 상품 수정 </span>
					</div>
				</div>
				<div class="col-md-4"></div>
			</div>
			
			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"> 코 드 </span>
					</div>
					<input type="text" id="code" name="code" class="form-control" value="${product.code}" readonly="readonly" placeholder="barcode" aria-label="Useremail" style="ime-mode:disabled" aria-describedby="basic-addon1" >
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"> 상품명</span>
					</div>
					<input id="name" name="name" type="text" class="form-control" value="${product.name}" placeholder="Name" aria-label="Username" aria-describedby="basic-addon1"	>
					<span class="input-group-text" style="width: 100px"> 상품 규격 </span>
						<input id="capacity" name="capacity" type="text" class="form-control" value="${product.capacity}" placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"> 매입단가 </span>
					</div>
					<input id="buyprice" name="buyprice" type="text" class="form-control" value="${product.buyprice}"
					 data-parsley-type="number" required="true" data-parsley-error-message="매입단가에 숫자만 입력하세요!"  
					 data-parsley-errors-container="div[id='buypriceError']"
					 placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					
						<span class="input-group-text" style="width: 100px"> 매출단가 </span>
						<input id="saleprice" name="saleprice" type="text" class="form-control" value="${product.saleprice}"
						 data-parsley-type="number" required="true" data-parsley-error-message="매입단가에 숫자만 입력하세요!"  
					 	 data-parsley-errors-container="div[id='salepriceError']"
						 placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="buypriceError" style="color: #f00"></div>
					<div id="salepriceError" style="color: #f00"></div>
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"> 상품설명 </span>
					</div>
					<input id="explanation" name="explanation" type="text" class="form-control" value="${product.explanation}" placeholder="" aria-label="Username" aria-describedby="basic-addon1"	>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12" style="text-align: center">
						<span class="label label-info" style="color: black; display: inline-block;width: 550px"><font size="2px">재고 현황</font></span>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend" style="margin-top: 8px"> 
						<span class="input-group-text" style="width: 80px"> 전년말재고 </span>
						<input id="preyystock" name="preyystock" type="text" class="form-control"
						data-parsley-type="number" required="true" data-parsley-error-message="전년재고에 숫자만 입력하세요!"  
					 	data-parsley-errors-container="div[id='preyystockError']"
						 value="${product.preyystock}" style="width: 100px" placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
						<span class="input-group-text" style="width: 80px"> 전월말재고 </span>
						<input id="premmstock" name="premmstock" type="text" class="form-control"
						data-parsley-type="number" required="true" data-parsley-error-message="전년재고에 숫자만 입력하세요!"  
					 	data-parsley-errors-container="div[id='premmstockError']"
						 value="${product.premmstock}" style="width: 100px" placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
						<span class="input-group-text" style="width: 80px"> 전일재고 </span>
						<input id="preddstock" name="preddstock" type="text" class="form-control" 
						data-parsley-type="number" required="true" data-parsley-error-message="전년재고에 숫자만 입력하세요!"  
					 	data-parsley-errors-container="div[id='preddstockError']"
						 value="${product.preddstock}" style="width: 100px" placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
						<span class="input-group-text" style="width: 80px"> 현재재고 </span>
						<input id="stock" name="stock" type="text" class="form-control"
						data-parsley-type="number" required="true" data-parsley-error-message="전년재고에 숫자만 입력하세요!"  
					 	data-parsley-errors-container="div[id='stockError']"
						 value="${product.stock}" style="width: 100px" placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="preyystockError" style="color: #f00"></div>
					<div id="premmstockError" style="color: #f00"></div>
					<div id="preddstockError" style="color: #f00"></div>
					<div id="stockError" style="color: #f00"></div>
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<div class="row">
				<div class="col-md-12" style="text-align: center">
					<span class="label label-info"  style="color: black; display: inline-block;width: 550px"><font size="2px">매입 매출 현황</font></span>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend" style="margin-top: 8px">
						<span class="input-group-text" style="width: 80px"> 1월 매입 </span>
						<input id="buy01" name="buy01" type="text" class="form-control" value="${product.buy01}"
						 data-parsley-type="number" required="true" data-parsley-error-message="1월 매출에 숫자만 입력하세요!"  
					 	 data-parsley-errors-container="div[id='buy01Error']" style="width: 100px" placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
						<span class="input-group-text" style="width: 80px"> 1월 매출 </span>
						<input id="sale01" name="sale01" type="text" class="form-control" value="${product.sale01}"
						 data-parsley-type="number" required="true" data-parsley-error-message="1월 매출에 숫자만 입력하세요!"  
					 	 data-parsley-errors-container="div[id='sale01Error']" style="width: 100px" placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
						<span class="input-group-text" style="width: 80px"> 7월 매입 </span>
						<input id="buy07" name="buy07" type="text" class="form-control" value="${product.buy07}"
						 data-parsley-type="number" required="true" data-parsley-error-message="7월 매출에 숫자만 입력하세요!"  
					 	 data-parsley-errors-container="div[id='buy07Error']" style="width: 100px" placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
						<span class="input-group-text" style="width: 80px"> 7월 매출 </span>
						<input id="sale07" name="sale07" type="text" class="form-control" value="${product.sale07}"
						 data-parsley-type="number" required="true" data-parsley-error-message="7월 매출에 숫자만 입력하세요!"  
					 	 data-parsley-errors-container="div[id='sale07Error']" style="width: 100px" placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 80px"> 2월 매입 </span>
						<input id="buy02" name="buy02" type="text" class="form-control" value="${product.buy02}"
						 data-parsley-type="number" required="true" data-parsley-error-message="2월 매출에 숫자만 입력하세요!"  
					 	 data-parsley-errors-container="div[id='buy02Error']" style="width: 100px" placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
						<span class="input-group-text" style="width: 80px"> 2월 매출 </span>
						<input id="sale02" name="sale02" type="text" class="form-control" value="${product.sale02}"
						 data-parsley-type="number" required="true" data-parsley-error-message="2월 매출에 숫자만 입력하세요!"  
					 	 data-parsley-errors-container="div[id='sale02Error']" style="width: 100px" placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
						<span class="input-group-text" style="width: 80px"> 8월 매입 </span>
						<input id="buy08" name="buy08" type="text" class="form-control" value="${product.buy08}"
						 data-parsley-type="number" required="true" data-parsley-error-message="8월 매출에 숫자만 입력하세요!"  
					 	 data-parsley-errors-container="div[id='buy08Error']" style="width: 100px" placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
						<span class="input-group-text" style="width: 80px"> 8월 매출 </span>
						<input id="sale08" name="sale08" type="text" class="form-control" value="${product.sale08}"
						 data-parsley-type="number" required="true" data-parsley-error-message="8월 매출에 숫자만 입력하세요!"  
					 	 data-parsley-errors-container="div[id='sale08Error']" style="width: 100px" placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 80px"> 3월 매입 </span>
						<input id="buy03" name="buy03" type="text" class="form-control" value="${product.buy03}"
						 data-parsley-type="number" required="true" data-parsley-error-message="3월 매출에 숫자만 입력하세요!"  
					 	 data-parsley-errors-container="div[id='buy03Error']"  style="width: 100px" placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
						<span class="input-group-text" style="width: 80px"> 3월 매출 </span>
						<input id="sale03" name="sale03" type="text" class="form-control" value="${product.sale03}"
						 data-parsley-type="number" required="true" data-parsley-error-message="3월 매출에 숫자만 입력하세요!"  
					 	 data-parsley-errors-container="div[id='sale03Error']" style="width: 100px" placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
						<span class="input-group-text" style="width: 80px"> 9월 매입 </span>
						<input id="buy09" name="buy09" type="text" class="form-control" value="${product.buy09}"
						 data-parsley-type="number" required="true" data-parsley-error-message="9월 매출에 숫자만 입력하세요!"  
					 	 data-parsley-errors-container="div[id='buy09Error']" style="width: 100px" placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
						<span class="input-group-text" style="width: 80px"> 9월 매출 </span>
						<input id="sale09" name="sale09" type="text" class="form-control" value="${product.sale09}"
						 data-parsley-type="number" required="true" data-parsley-error-message="9월 매출에 숫자만 입력하세요!"  
					 	 data-parsley-errors-container="div[id='sale09Error']" style="width: 100px" placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 80px"> 4월 매입 </span>
						<input id="buy04" name="buy04" type="text" class="form-control" value="${product.buy04}"
						 data-parsley-type="number" required="true" data-parsley-error-message="4월 매출에 숫자만 입력하세요!"  
					 	 data-parsley-errors-container="div[id='buy04Error']" style="width: 100px" placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
						<span class="input-group-text" style="width: 80px"> 4월 매출 </span>
						<input id="sale04" name="sale04" type="text" class="form-control" value="${product.sale04}"
						 data-parsley-type="number" required="true" data-parsley-error-message="4월 매출에 숫자만 입력하세요!"  
					 	 data-parsley-errors-container="div[id='sale04Error']" style="width: 100px" placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
						<span class="input-group-text" style="width: 80px"> 10월 매입 </span>
						<input id="buy10" name="buy10" type="text" class="form-control" value="${product.buy10}"
						 data-parsley-type="number" required="true" data-parsley-error-message="10월 매출에 숫자만 입력하세요!"  
					 	 data-parsley-errors-container="div[id='buy10Error']" style="width: 100px" placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
						<span class="input-group-text" style="width: 80px"> 10월 매출 </span>
						<input id="sale10" name="sale10" type="text" class="form-control" value="${product.sale10}"
						 data-parsley-type="number" required="true" data-parsley-error-message="10월 매출에 숫자만 입력하세요!"  
					 	 data-parsley-errors-container="div[id='sale10Error']" style="width: 100px" placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 80px"> 5월 매입 </span>
						<input id="buy05" name="buy05" type="text" class="form-control" value="${product.buy05}"
						 data-parsley-type="number" required="true" data-parsley-error-message="5월 매출에 숫자만 입력하세요!"  
					 	 data-parsley-errors-container="div[id='buy05Error']" style="width: 100px" placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
						<span class="input-group-text" style="width: 80px"> 5월 매출 </span>
						<input id="sale05" name="sale05" type="text" class="form-control" value="${product.sale05}"
						 data-parsley-type="number" required="true" data-parsley-error-message="5월 매출에 숫자만 입력하세요!"  
					 	 data-parsley-errors-container="div[id='sale05Error']" style="width: 100px" placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
						<span class="input-group-text" style="width: 80px"> 11월 매입 </span>
						<input id="buy11" name="buy11" type="text" class="form-control" value="${product.buy11}"
						 data-parsley-type="number" required="true" data-parsley-error-message="11월 매출에 숫자만 입력하세요!"  
					 	 data-parsley-errors-container="div[id='buy11Error']" style="width: 100px" placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
						<span class="input-group-text" style="width: 80px"> 11월 매출 </span>
						<input id="sale11" name="sale11" type="text" class="form-control" value="${product.sale11}"
						 data-parsley-type="number" required="true" data-parsley-error-message="11월 매출에 숫자만 입력하세요!"  
					 	 data-parsley-errors-container="div[id='sale11Error']" style="width: 100px" placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 80px"> 6월 매입 </span>
						<input id="buy06" name="buy06" type="text" class="form-control" value="${product.buy06}"
						 data-parsley-type="number" required="true" data-parsley-error-message="6월 매출에 숫자만 입력하세요!"  
					 	 data-parsley-errors-container="div[id='buy06Error']" style="width: 100px" placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
						<span class="input-group-text" style="width: 80px"> 6월 매출 </span>
						<input id="sale06" name="sale06" type="text" class="form-control" value="${product.sale06}"
						 data-parsley-type="number" required="true" data-parsley-error-message="6월 매출에 숫자만 입력하세요!"  
					 	 data-parsley-errors-container="div[id='sale06Error']" style="width: 100px" placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
						<span class="input-group-text" style="width: 80px"> 12월 매입 </span>
						<input id="buy12" name="buy12" type="text" class="form-control" value="${product.buy12}"
						 data-parsley-type="number" required="true" data-parsley-error-message="12월 매출에 숫자만 입력하세요!"  
					 	 data-parsley-errors-container="div[id='buy12Error']" style="width: 100px" placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
						<span class="input-group-text" style="width: 80px"> 12월 매출 </span>
						<input id="sale12" name="sale12" type="text" class="form-control" value="${product.sale12}"
						 data-parsley-type="number" required="true" data-parsley-error-message="12월 매출에 숫자만 입력하세요!"  
					 	 data-parsley-errors-container="div[id='sale12Error']" style="width: 100px" placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					</div>
				</div>
			</div>
			
				<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="buy01Error" style="color: #f00"></div>
					<div id="sale01Error" style="color: #f00"></div>
					<div id="buy02Error" style="color: #f00"></div>
					<div id="sale02Error" style="color: #f00"></div>
					<div id="buy03Error" style="color: #f00"></div>
					<div id="sale03Error" style="color: #f00"></div>
					<div id="buy04Error" style="color: #f00"></div>
					<div id="sale04Error" style="color: #f00"></div>
					<div id="buy05Error" style="color: #f00"></div>
					<div id="sale05Error" style="color: #f00"></div>
					<div id="buy06Error" style="color: #f00"></div>
					<div id="sale06Error" style="color: #f00"></div>
					<div id="buy07Error" style="color: #f00"></div>
					<div id="sale07Error" style="color: #f00"></div>
					<div id="buy08Error" style="color: #f00"></div>
					<div id="sale08Error" style="color: #f00"></div>
					<div id="buy09Error" style="color: #f00"></div>
					<div id="sale09Error" style="color: #f00"></div>
					<div id="buy10Error" style="color: #f00"></div>
					<div id="sale10Error" style="color: #f00"></div>
					<div id="buy11Error" style="color: #f00"></div>
					<div id="sale11Error" style="color: #f00"></div>
					<div id="buy12Error" style="color: #f00"></div>
					<div id="sale12Error" style="color: #f00"></div>
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<div class="row" style="margin-bottom: 100px; margin-top: 20px">
				<div class="col-md-5"></div>
				<div class="col-md-4">
					<button id="product_update_btn" name="product_update_btn" type="submit" class="btn btn-success save" style="margin-right: 10px; color: #000000">수 정</button>
					<button id="product_delete_btn" name="product_delete_btn" type="button" class="btn btn-danger delete" style="margin-right: 10px; color: #000000">삭 제</button>
					<button id="cancel_btn" name="cancel_btn"  type="reset" class="btn btn-primary" style="color: #000000">취 소</button>
				</div>
				<div class="col-md-3"></div>
			</div>
			
		</div>
</form>
</body>
</html>