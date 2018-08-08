<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/parsley.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<script src="//cdn.ckeditor.com/4.6.2/standard/ckeditor.js"></script>
</head>

<body>
<form  id="boardupdate_form" name="boardupdate_form" method="post" action="boardUpdate" 
	enctype="multipart/form-data">
	<input type="hidden" id="boardb_seq" name="b_seq" value="${board.b_seq}">
	<input type="hidden" id="b_ref" name="b_ref" value="${board.b_ref}">
	
	<div class="container" style="margin-top: 100px">
		<div class="row">
			<div class="col-md-5"></div>
			<div class="input-group mb-3 col-md-4 ">
				<div class="input-group-prepend">
					<span style="text-align: center; font-style: inherit; margin-bottom: 20px; font-size: 30px"> 게 시 판 </span>
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
				
				<c:choose>
					<c:when test="${sessionemail == null}">
						<input id="b_title" name="b_title" type="text" readonly="readonly" class="form-control" placeholder="title" aria-label="Username" aria-describedby="basic-addon1"
						value="${board.b_title}">
					</c:when>
					<c:otherwise>
						<input id="b_title" name="b_title" type="text" class="form-control" placeholder="title" aria-label="Username" aria-describedby="basic-addon1"
						value="${board.b_title}">
					</c:otherwise>
				</c:choose>
				
			</div>
			<div class="col-md-3"></div>
		</div>

		<div class="row">
			<div class="col-md-3"></div>
			<div class="input-group mb-3 col-md-6 ">
				<div class="input-group-prepend">
					<span class="input-group-text" style="width: 100px;color: black;"> 첨 부 </span>
				</div>
				
				<input id="file" name="file" type="file" class="form-control" aria-label="Username" aria-describedby="basic-addon1"
				value="${board.b_attach}">
				<input id="b_beforeattach" name="b_beforeattach" type="text" class="form-control" aria-label="Username" aria-describedby="basic-addon1"
				value="${board.b_attach}">
			</div>
			<div class="col-md-3"></div>
		</div>

		<div class="row">
			<div class="col-md-3"></div>
			<div class="input-group mb-3 col-md-6 ">
				<div class="input-group-prepend">
				</div>
				<c:choose>
					<c:when test="${sessionemail == null}">
						<textarea rows="10" cols="60" id="b_content" name="b_content" readonly="readonly" autocomplete="off" style="text-align: left"> ${board.b_content}</textarea>
					</c:when>
					<c:otherwise>
						<textarea rows="10" cols="60" id="b_content" name="b_content" autocomplete="off" style="text-align: left"> ${board.b_content}</textarea>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="col-md-3"></div>
		</div>
			
		<div class="row" style="margin-bottom: 100px; margin-top: 20px">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<button id="list_btn" name="list_btn" type="button" class="btn btn-primary " style="color: #000000">글 목록</button>
				<c:if test="${sessionemail == 'admin@a.com' || sessionemail == board.b_email }">
					<button  id="update_btn" name="update_btn"  type="submit" class="btn btn-success " style="color: #000000">글 수정</button>
					<button  id="board_delete_btn" name="delete_btn"  type="button" class="btn btn-warning " style="color: #000000">글 삭제</button>
				</c:if>
				<c:if test="${sessionemail != null}">
				
				<c:choose>
					<c:when test="${board.b_step ==0}">
						<button  id="boardreply" name="boardreply" type="button" class="btn btn-info"
					 	onclick="location.href='boardReplyForm?b_title=${board.b_title}&b_seq=${board.b_seq}' "
					 	style="margin-right: 10px; color: #000000">댓 글</button>
					</c:when>
					<c:otherwise>
						<button  id="boardreply" name="boardreply" type="button" class="btn btn-info"
					 	onclick="location.href='boardReplyForm?b_title=${board.b_title}&b_seq=${board.b_ref}'"
					 	style="margin-right: 10px; color: #000000">댓 글</button>
					</c:otherwise>
				</c:choose>
					
				</c:if>
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