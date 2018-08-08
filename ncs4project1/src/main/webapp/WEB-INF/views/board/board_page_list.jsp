<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Board List</title>
<content tag="local_script">

	<script type="text/javascript">

		alert('list..');
	</script>
</content>
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous"> -->
<!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous"> -->
<!-- <script src="resources/js/jquery.min.js"></script> -->
<!-- <script src="resources/js/parsley.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"	crossorigin="anonymous"></script> -->
<!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script> -->

</head>


<body>
<form action="boardPageList" method="get">
	<div class="container" style="margin-top: 100px">
		<div class="row">
			<div class="col-md-5"></div>
			<div class="input-group mb-3 col-md-4 ">
				<div class="input-group-prepend">
					<span style="text-align: center; font-style: inherit; margin-bottom: 20px; font-size: 30px">	게 시 판 </span>
				</div>
			</div>
			<div class="col-md-3"></div>
		</div>
		
		<table class="table">
			<thead>
				<tr>
					<th scope="col" style="text-align: center;"> 글번호 </th>
					<th scope="col" style="text-align: center;"> E-Mail</th>
					<th scope="col" style="text-align: center;"> 작성자 </th>
					<th scope="col" style="text-align: center;"> 제목 </th>
					<th scope="col" style="text-align: center;"> 첨부파일 </th>
					<th scope="col" style="text-align: center;"> 작성일 </th>
					<th scope="col" style="text-align: center;"> 조회수 </th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${boards}" varStatus="status">
					<tr>
						<td style="text-align: center; vertical-align: middle;">${board.b_ref}</td>
						<td style="text-align: center; vertical-align: middle;">${board.b_email}</td>
						<td style="text-align: center; vertical-align: middle;">${board.b_name}</td>
						<td style="text-align: left; vertical-align: middle;">
							<a href="board_detail?b_seq=${board.b_seq}">
							<c:if test="${board.b_step ge 1}">
								<img src="resources/img/reply.png" width="15" height="15">
							</c:if>
								${board.b_title}
							</a>
						</td>
				
						<td style="text-align: center; vertical-align: middle;">
						<c:if test="${(board.b_attach != null) && (board.b_attach != ' ')}">
							<a href="boardDownload?b_attach=${board.b_attach}"><i class="fas fa-file" id="attach_file" aria-hidden="true"></i></a>
						</c:if>
						</td>
						<td style="text-align: center; vertical-align: middle;">${board.b_date}</td>
						<td style="text-align: center; vertical-align: middle;">${board.b_hit}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
			<!--페이지 클릭 링크  -->
			<div class="row" style="margin-top: 10px">
				<div class="col-md-1"></div>
				<div class="col-md-10" style="text-align: center">
					<c:forEach var="page" items="${pages}">
						<a href="boardPageListSelected?page=${page}">[${page}]&nbsp</a>
					</c:forEach>
				</div>
				<div class="col-md-1"></div>
			</div>

			<div class="row" style="margin-top: 10px">
			<div class="col-md-3"></div>
			<div class="input-group mb-3 col-md-6 ">
				<div class="input-group-prepend">
					<input type="text" id="find" name="find" style="margin-right: 10px" value="${find}">
					<button id="search_btn" name="search_btn" type="submit" class="btn btn-info save" style="margin-right: 10px; color: #000000">검 색</button>
					<button  id="cancel_btn" name="cancel_btn"  type="button" class="btn btn-danger save" style="margin-right: 10px; color: #000000">취 소</button>
					<c:if test="${sessionemail !=null}">
						<button  id="insert_btn" name="insert_btn"  type="button" class="btn btn-info insert" style="color: #000000">글쓰기</button>
					</c:if>
				</div>
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>
</form>
</body>
</html>