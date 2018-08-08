<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댓글</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/parsley.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<script src="//cdn.ckeditor.com/4.6.2/standard/ckeditor.js"></script>
</head>

<body onload="boardreply_form.b_content.focus()">
<form  id="boardreply_form" name="boardreply_form" method="post" action="boardReply_insert" data-parsley-validate="true"
	enctype="multipart/form-data">
	
	<input type="hidden" name="b_ref" value="${board.b_seq}">
	<div class="container" style="margin-top: 100px">
		<div class="row">
			<div class="col-md-5"></div>
			<div class="input-group mb-3 col-md-4 ">
				<div class="input-group-prepend">
					<span style="text-align: center; font-style: inherit; margin-bottom: 20px; font-size: 30px"> Reply 게시판 </span>
				</div>
			</div>
			<div class="col-md-3"></div>
		</div>
			
		<div class="row">
			<div class="col-md-3"></div>
			<div class="input-group mb-3 col-md-6 ">
				<div class="input-group-prepend">
					<span class="input-group-text" style="width: 100px;color: black;"> E-Mail </span>
				</div>
				<input type="text" id="b_email" name="b_email" class="form-control" readonly="readonly"
					placeholder="E-Mail" aria-label="Useremail" value="${board.b_email}"
					style="ime-mode:disabled"
					aria-describedby="basic-addon1">
			</div>
			<div class="col-md-3"></div>
		</div>
			
		<div class="row">
			<div class="col-md-3"></div>
			<div class="input-group mb-3 col-md-6 ">
				<div class="input-group-prepend">
					<span class="input-group-text" style="width: 100px;color: black;"> 이 름 </span>
				</div>
				<input id="b_name" name="b_name" type="text" class="form-control" readonly="readonly" placeholder="Name" value="${board.b_name}" aria-label="Username" aria-describedby="basic-addon1">
			</div>
			<div class="col-md-3"></div>
		</div>

		<div class="row">
			<div class="col-md-3"></div>
			<div class="input-group mb-3 col-md-6 ">
				<div class="input-group-prepend">
					<span class="input-group-text" style="width: 100px;color: black;"> 제 목 </span>
				</div>
				<input id="b_title" name="b_title" type="text" class="form-control" placeholder="title" aria-label="Username" aria-describedby="basic-addon1"
				value="${board.b_title}"
				required="true" data-parsley-error-message="제목을 입력하세요." data-parsley-errors-container="div[id='titleError']">
			</div>
			<div class="col-md-3"></div>
		</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="titleError" style="color: #f00"></div>
				</div>
				<div class="col-md-3"></div>
			</div>

			<div class="row">
			<div class="col-md-3"></div>
			<div class="input-group mb-3 col-md-6 ">
				<div class="input-group-prepend">
					<span class="input-group-text" style="width: 100px;color: black;"> 첨 부 </span>
				</div>
				<input id="file" name="file" type="file" class="form-control" aria-label="Username" aria-describedby="basic-addon1">
			</div>
			<div class="col-md-3"></div>
		</div>

		<div class="row">
			<div class="col-md-3"></div>
			<div class="input-group mb-3 col-md-6 ">
				<div class="input-group-prepend">
				</div>
				<textarea rows="10" cols="60" id="b_content" name="b_content" autocomplete="off" style="text-align: left"
				required="true" data-parsley-error-message="내용을 입력하세요." data-parsley-errors-container="div[id='contentError']"></textarea>
				
			</div>
			<div class="col-md-3"></div>
		</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="contentError" style="color: #f00"></div>
				</div>
				<div class="col-md-3"></div>
			</div>
			
		<div class="row" style="margin-bottom: 100px; margin-top: 20px">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<button id="save_btn" name="save_btn" type="submit" class="btn btn-primary save" style="margin-right: 10px; color: #000000">저  장</button>
				<button  id="reset_btn" name="reset_btn"  type="reset" class="btn btn-danger save" style="margin-right: 10px; color: #000000">리  셋</button>
				<button  id="cancel_btn" name="cancel_btn"  type="button" class="btn btn-danger save" style=" color: #000000">취  소</button>
			</div>
			<div class="col-md-4"></div>
		</div>
			
		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
					</div>
					<div class="modal-footer">
					<button type="button" class="btn btn-success modal_btn1" data-dismiss="modal">사용</button>
					<button type="button" class="btn btn-danger modal_btn2"	data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>