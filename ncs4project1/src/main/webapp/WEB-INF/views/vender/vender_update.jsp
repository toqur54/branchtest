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
<script src="resources/js/myquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
	
<!--우편번호 	 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script><script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/180619/1529384927473/180619.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script><script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/180619/1529384927473/180619.js"></script>
<!--autoload=false 파라미터를 이용하여 자동으로 로딩되는 것을 막습니다.-->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>

</head>
<body>
	<form id="vender_update_form" name="vender_update_form" method="post"	action="vender_update" data-parsley-validate="true">
		<input type="hidden" id="confirm_yn" value="n">
		<div class="container" style="margin-top: 100px">
			
			<div class="row">
				<div class="col-md-4"></div>
				<div class="input-group mb-3 col-md-4 ">
					<div class="input-group-prepend">
						<span style="text-align: center; font-style: inherit; margin-bottom: 20px; font-size: 30px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 거래처 수정 </span>
					</div>
				</div>
				<div class="col-md-4"></div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"> 상호 코드 </span>
					</div>
					<input type="text" id="code" name="code" class="form-control" placeholder="barcode" aria-label="Useremail" value="${vender.code}" readonly="readonly"
					required="true" data-parsley-error-message="코드를 입력하세요."	data-parsley-errors-container="div[id='CodeError']"
						style="ime-mode:disabled" aria-describedby="basic-addon1">
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="CodeError" style="color: #f00"></div>
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"> 상호</span>
					</div>
					<input id="name" name="name" type="text" class="form-control"  value="${vender.name}" placeholder="Name" aria-label="Username" aria-describedby="basic-addon1"	>
					<span class="input-group-text" style="width: 100px"> 대표자명 </span>
					<input id="ceoname" name="ceoname" type="text" class="form-control"  value="${vender.ceoname}" placeholder="" aria-label="Username" aria-describedby="basic-addon1"	>
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend"> 
						<span class="input-group-text" style="width: 100px"> 업태</span>
					</div>
					<input id="bustype" name="bustype" type="text" class="form-control"  value="${vender.bustype}" placeholder="Name" aria-label="Username" aria-describedby="basic-addon1"	>
					<span class="input-group-text" style="width: 100px"> 종목 </span>
					<input id="busconditions" name="busconditions" type="text" class="form-control"  value="${vender.busconditions}" placeholder="" aria-label="Username" aria-describedby="basic-addon1"	>
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"> 사업자번호</span>
					</div>
					<input id="busno1" name="busno1" type="text" class="form-control"
					 required="true" data-parsley-type="number"  data-parsley-error-message="사업자번호에 숫자만 입력하세요."	data-parsley-errors-container="div[id='busno1Error']"
					 value="${vender.busno1}"  placeholder="" aria-label="Username" aria-describedby="basic-addon1" readonly="readonly"> 
					<input id="busno2" name="busno2" type="text" class="form-control"
					 required="true" data-parsley-type="number"  data-parsley-error-message="사업자번호에 숫자만 입력하세요."	data-parsley-errors-container="div[id='busno2Error']"
					 value="${vender.busno2}" placeholder="" aria-label="Username" aria-describedby="basic-addon1" readonly="readonly">  
					<input id="busno3" name="busno3" type="text" class="form-control"
					 required="true" data-parsley-type="number" data-parsley-error-message="사업자번호에 숫자만 입력하세요."	data-parsley-errors-container="div[id='busno3Error']"
					 value="${vender.busno3}" placeholder="" aria-label="Username" aria-describedby="basic-addon1" readonly="readonly">
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="busno1Error" style="color: #f00"></div>
					<div id="busno2Error" style="color: #f00"></div>
					<div id="busno3Error" style="color: #f00"></div>
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"> 우편번호</span>
					</div>
					<input id="zipcode" name="zipcode" type="text" class="form-control" value="${vender.zipcode}" placeholder="Zipcode" aria-label="Usernzipcode" aria-describedby="basic-addon1">
					<button onclick="ZipcodevenderFind()" type="button" class="btn btn-info" style="color: #000000">검색</button>
				</div>
				<div class="col-md-3"></div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"> 신 주소 </span>
					</div>
					<input id="newaddr" name="newaddr" type="text" class="form-control" value="${vender.newaddr}" placeholder="Address" aria-label="UsernAddress" aria-describedby="basic-addon1">
				</div>
				<div class="col-md-3"></div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"> 구 주소 </span>
					</div>
					<input id="oldaddr" name="oldaddr" type="text" class="form-control" value="${vender.oldaddr}" placeholder="Address" aria-label="UsernAddress" aria-describedby="basic-addon1">
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"> 상세주소 </span>
					</div>
					<input id="detailaddr" name="detailaddr" type="text" class="form-control" value="${vender.detailaddr}" placeholder="Address" aria-label="UsernAddress" aria-describedby="basic-addon1">
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"> 상호 전화번호 </span>
					</div>
					<select name="officeno1" id="officeno1">
					<option value="02" <c:if test="${vender.officeno1 == '02'}">selected</c:if> >02<option>
					<option value="041" <c:if test="${vender.officeno1 == '041'}">selected</c:if> >041<option>
					<option value="042" <c:if test="${vender.officeno1 == '042'}">selected</c:if> >042<option>
					<option value="010" <c:if test="${vender.officeno1 == '010'}">selected</c:if> >010<option>
					<option value="011" <c:if test="${vender.officeno1 == '011'}">selected</c:if> >011<option>
					<option value="012" <c:if test="${vender.officeno1 == '012'}">selected</c:if> >012<option>
					<option value="017" <c:if test="${vender.officeno1 == '017'}">selected</c:if> >017<option>
					</select> 
						<input name="officeno2" id="officeno2" onkeyup="officeno2_lengthchk(this)" value="${vender.officeno2}"
						required="true" data-parsley-type="number"  data-parsley-error-message="전화번호에 숫자만 입력하세요."	data-parsley-errors-container="div[id='officeno2Error']"
						maxlength="4" type="text" class="form-control" placeholder="1234"
						aria-label="Userphone1" aria-describedby="basic-addon1">
						 <input name="officeno3" id="officeno3"
						type="text" class="form-control" placeholder="5678" maxlength="4" value="${vender.officeno3}"
						required="true" data-parsley-type="number"  data-parsley-error-message="전화번호에 숫자만 입력하세요."	data-parsley-errors-container="div[id='officeno3Error']"
						aria-label="Userphone1" aria-describedby="basic-addon1">
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="officeno2Error" style="color: #f00"></div>
					<div id="officeno3Error" style="color: #f00"></div>
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<div class="row" style="margin-bottom: 100px; margin-top: 20px">
				<div class="col-md-5"></div>
				<div class="col-md-4">
					<button id="vender_update_btn" name="vender_update_btn" type="submit" class="btn btn-success save" style="margin-right: 10px; color: #000000">수 정</button>
					<button id="vender_delete_btn" name="vender_delete_btn" type="button" class="btn btn-danger delete" style="margin-right: 10px; color: #000000">삭 제</button>
					<button id="cancel_btn" name="cancel_btn"  type="reset" class="btn btn-primary" style="color: #000000">취 소</button>
				</div>
				<div class="col-md-3"></div>
			</div>
			
		</div>
	</form>
</body>
</html>