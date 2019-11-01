<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="stylesheet" type="text/css" href="../LoginForm/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../LoginForm/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="../LoginForm/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="../LoginForm/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="../LoginForm/vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="../LoginForm/vendor/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="../LoginForm/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="../LoginForm/vendor/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="../LoginForm/css/util.css">
	<link rel="stylesheet" type="text/css" href="../LoginForm/css/main.css">
	
	<style>

</style>
	
	</head>

<body style="background-color: #c6f1ff;">
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" name="f" action="${pageContext.request.contextPath }/LoginMemberController?passtype=0" method="post">


					<span class="login100-form-title p-b-43">
					<img src="https://img.icons8.com/ios/50/000000/brain.png">
						BrainViewer Login
					</span>
					
					
					<div class="wrap-input100 validate-input">
						<input class="input100" type="text" name="id">
						<span class="focus-input100"></span>
						<span class="label-input100">ID</span>
					</div>
					
					
					<div class="wrap-input100 validate-input">
						<input class="input100" type="password" name="pwd">
						<span class="focus-input100"></span>
						<span class="label-input100">Password</span>
					</div>

					<div class="flex-sb-m w-full p-t-3 p-b-32">
					
						<div>
							<a href="#" class="txt1">
								Forgot Password?
							</a>
						</div>
						
						<div>
						<a href="#" class="txtJoin">
							Create account?
							</a>
						</div>
					</div>
			

					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Login
						</button>
					</div>
					

				</form>

				<!-- <div class="login100-more" style="background-image: url('LoginForm/images/brain1.gif');"> -->
				<div class="login100-more" style="background-image">
					<ul class="slide_ul">
					<li><a href="#"><img src="../slide/images/BRAIN1.jpg" alt="dane"></a></li>
					<li><a href="#"><img src="../slide/images/BRAIN2.jpg" alt="dane"></a></li>
					<li><a href="#"><img src="../slide/images/BRAIN3.jpg" alt="dane"></a></li>
					<li><a href="#"><img src="../slide/images/BRAIN4.jpg" alt="dane"></a></li>
				</ul>
				</div>
			</div>
		</div>
	</div>
	
	

	
	<link rel="stylesheet" type="text/css" href="../slide/css/main.css">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<script type="text/javascript" src="../slide/js/main.js"></script>
	<script src="../LoginForm/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="../LoginForm/vendor/animsition/js/animsition.min.js"></script>
	<script src="../LoginForm/vendor/bootstrap/js/popper.js"></script>
	<script src="../LoginForm/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="../LoginForm/vendor/select2/select2.min.js"></script>
	<script src="../LoginForm/vendor/daterangepicker/moment.min.js"></script>
	<script src="../LoginForm/vendor/daterangepicker/daterangepicker.js"></script>
	<script src="../LoginForm/vendor/countdowntime/countdowntime.js"></script>
	<script src="../LoginForm/js/main.js"></script>

</body>
</html>