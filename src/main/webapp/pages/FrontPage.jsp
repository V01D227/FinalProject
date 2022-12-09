<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="submit" id="orderNow" value="Order Now">
	<input type="submit" id="signIn" value="Sign in">
</body>
<script src= "js/prototype.js">

var contextPath = '${pageContext.request.contextPath}' + '/';

function SignInAjax() {
	try {
		new Ajax.Request(
				contextPath + "actioncontroller",
				{
					method : "POST",
					parameters:{
						action:"signin",
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
$("signIn").observe("click",SignInAjax);

function OrderNowAjax() {
	try {
		new Ajax.Request(
				contextPath + "productcontroller",
				{
					method : "POST",
					//parameters:{
						//action:"order",
					//},
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
$("orderNow").observe("click",OrderNowAjax);
</script>
</html>
