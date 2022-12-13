<!DOCTYPE html>
<html class="htmlclass">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<script type="text/javascript">
		var contextPath = '${pageContext.request.contextPath}' + '/';
	</script>
	<title>Login</title>

	<link rel="stylesheet" type="text/css" href="css/loginCSS.css"> 
	<link rel="stylesheet" type="text/css" href="css/popupCSS.css" />
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nunito&display=swap" rel="stylesheet"> 
	<link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" crossorigin="anonymous">
	
	<script src="js/main.js"></script>
	<script src="js/modalUserlistPage.js"></script>
	
</head>
<style>
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
		font-family: 'Nunito', sans-serif;
	}
	@media (max-width: 780px) {
		body {
			display: flex;
			justify-content: center;
			align-items:center;		
		}
		.loginSide { 
			display: none;
		}
	}
</style>
<body>
	<section class="loginMain">
		<div class="loginContainer">
			<p class="loginTitle">Sweet Satisfaction</p>
			<form class="loginForm">
				<button class="loginOrder">ORDER NOW</button>
				
				<div class="loginSeparator"></div>
				
				<p class="loginText">Login</p>
				
				<div class="formControl">
					<input type="text" placeholder="Username" class="loginInput" id="username">
					<i class = "fa fa-user"></i>
				</div>
				<div class="formControl">
					<input type="password" placeholder="Password" class="loginInput" id="password">
					<i class="fa fa-lock"></i>
				</div>
				
				<input type="button" value="Submit" id="loginButton" class="loginBtn">
				<a href="#" class="loginForgotPw" data-modal-target="#modalForgotPW">Forgot Password?</a>
			</form>
		</div>
	</section>
	<section class="loginSide"></section>

<!------------------------------------------ FORGOT PASSWORD MODAL ---------------------------------------->
<div class="modal" id="modalForgotPW">
	    <div class="modal-header">
	      <div class="title">Add User</div>
	      <button data-close-button class="close-button">&times;</button>
	    </div>
	    <div class="modal-body">
	    
	    	<label>Username :  </label><br><input type="text" id="usernameFPW" name="username"><br>
			<label>Email :     </label><br><input type="text" id="emailFPW" name="email"><br>
			<input type="button" class="dbLogoutBtn" id="forgotpassbtn" value="Reset">
	    
	    </div>
	  </div>
<div id="overlay"></div>
<script type="text/javascript">
$( document ).ready(function() {
	initLoginPage();
	initForgotPassword();
});
</script>
</body>
</html>