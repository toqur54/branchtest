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
	<form id="final_form" class="final_form" name="final_form" method="post" action="finalJob">
		<div class="container" style="margin-top: 100px">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-4"></div>
					<div class="input-group mb-3 col-md-4 ">
						<div class="input-group-prepend">
							<span
								style="text-align: center; font-style: inherit; margin-bottom: 20px; font-size: 30px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								&nbsp&nbsp마감 </span>
						</div>
					</div>
					<div class="col-md-4"></div>
				</div>
				
				<div class="row">
					<div class="col-md-4"></div>
					<div class="input-group mb-3 col-md-4 ">
						<div class="input-group-prepend">
	
							<select name="finalyyyy" id="finalyyyy"
								style="margin-left: 10px; width: 80px">
								<c:forEach var="yyyy" items="${yyyys}">
									<option value="${yyyy}" <c:if test="${yyyy == curyyyy}">selected</c:if> >${yyyy}</option>
								</c:forEach>
							</select>

							<select name="finalmm" id="finalmm"
								style="margin-left: 10px; width: 80px">
								<c:forEach begin="1" end="12" var="i">
									<option value="${i}"	  <c:if test="${i == curmm}">selected</c:if>>${i}</option>
								</c:forEach>
							</select>
							
							<select name="finaldd" id="finaldd"
								style="margin-left: 10px; width: 80px">
								<c:forEach begin="0" end="31" var="i">
									<option value="${i}"  <c:if test="${i == curdd}">selected</c:if>	>${i}</option>
								</c:forEach>
							</select>

						</div>
					</div>
					<div class="col-md-4"></div>
				</div>
				
				
				<div class="row">
					<div class="col-md-5"></div>
					<div class="input-group mb-3 col-md-4 ">
						<div class="input-group-prepend btn-group btn-group-toggle" data-toggle="buttons">
							
        				 <label class="btn btn-secondary active">
        				 	<input type="radio" name="finaloption" id="option1" value="dd" autocomplete="off" checked> 일일 마감 </label>
        				 <label class="btn btn-secondary">
        				 	<input type="radio" name="finaloption" id="option2" value="mm" autocomplete="off"> 월말 마감 </label>
        				 <label class="btn btn-secondary">
        				 	<input type="radio" name="finaloption" id="option3" value="yyyy" autocomplete="off"> 년말 마감 </label>

						</div>
					</div>
				</div>
				
				<div class="row" style="margin-bottom: 100px; margin-top: 20px">
				<div class="col-md-5"></div>
				<div class="col-md-4">
					<button id="finalsubmit" name="finalsubmit" type="button" class="btn btn-success" style="margin-right: 10px; color: #000000">확 인</button>
					<button id="cancel_btn" name="cancel_btn"  type="button" onclick="location.href='index'" class="btn btn-primary" style="color: #000000">취 소</button>
				</div>
				<div class="col-md-3"></div>
			</div>
				
				
			<!-- Modal -->
				<div class="modal fade" id="finalModal" role="dialog">
					<div class="modal-dialog modal-sm">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal_title">마감 check</h4>
							</div>
							<div class="modal-body" id="final-modal-body">
								<p><span id="modalmsg">
								확인 후 데이터는 되돌릴수 없습니다.</span>
								<p><span id="modalmsgnew">
								마감 하시겟습니까?</span>
							</div>
							<div class="modal-footer">
								<button type="button" id="final_btn"
									class="btn btn-success modal_btn1" data-dismiss="modal">사용</button>
								<button type="button" id="final_modal_btn2"
									class="btn btn-danger modal_btn2" data-dismiss="modal">취소</button>
							</div>
						</div>
					</div>
				</div>


			</div>
		</div>
	</form>
</body>
</html>