<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- 반응형 웹 -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<!-- <script src="resources/bootstrap/js/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
</head>
<body>

<div class="container">
	<div class="row">
      <div class="col-md-3"></div>
         <div class= "input-group mb-3 col-md-6 ">
        	<div class="input-group-prepend">
            	<span class="input-group-text" style="width: 100px"><i class="fas fa-address-card" style="font-size: 15px;color: #ff0000"> Name</i></span>
         	</div>
         	<input type="text" class= "form-control" placeholder="username" aria-label="Username" aria-describedby="basic-addon1">
      	</div>
    	<div class="col-md-3"></div>
   	</div>
   	<div class="row">
      <div class="col-md-3"></div>
         <div class= "input-group mb-3 col-md-6 ">
        	<div class="input-group-prepend">
            	<span class="input-group-text" style="width: 100px"><i class="fas fa-address-card" style="font-size: 15px;color: #ff0000"> I D</i></span>
         	</div>
         	<input type="text" class= "form-control" placeholder="userid" aria-label="Userid" aria-describedby="basic-addon1">
      	</div>
    	<div class="col-md-3"></div>
   	</div>
</div>


	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-2" style="background-color: #0fff00;text-align: center">A1</div>
		<div class="col-md-6" style="background-color: #ff0000;text-align: center">A2</div>
		<div class="col-md-2"></div>
	</div>
	
	<div class="row" style="margin-top: 20px; text-align: center">
		<div class="col-md-2"></div>
		<div class="col-md-2" style="text-align: right"><label> I  D</label></div>
		<div class="col-md-6" style="text-align: center"><textarea style="width: 300px; height: 25px"></textarea></div>
		<div class="col-md-2"></div>
	</div>
	
	<div class="row" style="margin-top: 20px; text-align: center">
		<div class="col-md-2"></div>
		<div class="col-md-2" style="text-align: right"><label>Pass</label></div>
		<div class="col-md-6" style="text-align: center"><textarea style="width: 300px; height: 25px"></textarea></div>
		<div class="col-md-2"></div>
	</div>	

	<hr style="margin-left: 300px; margin-right: 300px">
	
	<div class="row" style="margin-top: 20px">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<button type="button" class="btn btn-primary">Primary</button>
			<button type="button" class="btn btn-danger">Danger</button>
			<button type="button" class="btn btn-success">Success</button>
		</div>
		<div class="col-md-4"></div>
	</div>
	
	
		<div class="input-group col-md-4">
    		<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
   			<input id="email" type="text" class="form-control" name="email" placeholder="Email">
  		</div>
  		<div class="input-group col-md-4">
    		<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
    		<input id="password" type="password" class="form-control" name="password" placeholder="Password">
  		</div>
  		<div class="input-group col-md-4">
    		<span class="input-group-addon">Text</span>
    		<input id="msg" type="text" class="form-control" name="msg" placeholder="Additional Info">
  		</div>
	
	
</body>
</html>
