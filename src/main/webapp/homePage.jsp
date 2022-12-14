<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="htmlclass">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<script type="text/javascript">
		var contextPath = '${pageContext.request.contextPath}' + '/';
	</script>
	<title>Login</title>

	<link rel="stylesheet" type="text/css" href="css/homePageCSS.css"> 
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nunito&display=swap" rel="stylesheet"> 
	<link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
	
	<script src="js/main.js"></script>
	<script src="js/jquery-2.2.4.js"></script>
</head>

<body>
	<div class="homeTitleContainer">
		<p class="homeTitle">Sweet Satisfaction</p>
	</div>
	<div class ="homeOrderContainer">
		<button class="homeOrderButton" id="orderNowButton">ORDER NOW</button>
	</div>
</body>
<script>
$( document ).ready(function() {
	initOrderNow();
});
</script>
</html>
