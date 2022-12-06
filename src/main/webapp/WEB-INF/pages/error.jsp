
<script> alert('incorrect username/password'); </script>

<jsp:include page="header.jsp"/>
			<label> Username : </label> <input type="text" id="username" name="username">
			<br>
			<label> Password : </label> <input type="password" id="password" name="password">
			<br>
			<input type="button" value="Submit" id="loginBtn">
<jsp:include page="footer.jsp"/>
<script src= "js/prototype.js">
var contextPath = '${pageContext.request.contextPath}' + '/';

function loginAjax() {
	try {
		console.log($("username").value + " : " + $("password").value);
		new Ajax.Request(
				contextPath + "actioncontroller",
				{
					method : "POST",
					parameters:{
						action:"login",
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