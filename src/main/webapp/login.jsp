<!DOCTYPE html>
<html class="htmlclass">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<title>Login</title>

	<link rel="stylesheet" type="text/css" href="css/loginCSS.css"> 
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nunito&display=swap" rel="stylesheet"> 
	<link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" crossorigin="anonymous">
</head>
<style>
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
		font-family: 'Nunito', sans-serif;
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
					<input type="text" placeholder="Username" class="loginInput" id="username" name="username">
					<i class = "fa fa-user"></i>
				</div>
				<div class="formControl">
					<input type="password" placeholder="Password" class="loginInput" id="password" name="password">
					<i class="fa fa-lock"></i>
				</div>
				
				<input type="button" value="Submit" id="loginBtn" class="loginBtn">
				<a href="#" class="loginForgotPw">Forgot Password?</a>
			</form>
		</div>
	</section>
	<section class="loginSide"></section>
</body>
</html>

<script src= "js/prototype.js">

var contextPath = '${pageContext.request.contextPath}' + '/';
function loginAjax() {
	try {
		console.log($("username").value + " : " + $("password").value);
		new Ajax.Request(
				contextPath + "logincontroller",
				{
					method : "POST",
					parameters:{
						username:$("username").value,
						password:$("password").value,
					},
					evalScripts: true,
					asynchronous: true,
					onComplete : function(response) {
						$("mainDiv").update(response.responseText);	
					}
				});
	} catch (e) {
		console.log("Error " + e);
	}
}
$("loginBtn").observe("click",loginAjax);


</script>