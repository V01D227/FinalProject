
<script> alert('username and email does not match. please try again'); </script>

	<label>Username :  </label><br><input type="text"   id="username"  name="username"><br>
	<label>Email :  </label><br><input type="text"   id="email"  name="email"><br>
	<input type="submit" id="forgotpassbtn" value="Submit">
<!-- 	<script>
	
		function show() {
		  var x = document.getElementById("password");
		  if (x.type === "password") {
		    x.type = "text";
		  } else {
		    x.type = "password";
		  }
		}
	</script> -->
	
	
<script src= "js/prototype.js">
var contextPath = '${pageContext.request.contextPath}' + '/';
function forgotpass() {
	try {
		console.log($("username").value + " : " + $("email").value);
		new Ajax.Request(
				contextPath + "actioncontroller",
				{
					method : "POST",
					parameters:{
						action:"forgotpass",
						username:$("username").value,
						email:$("email").value,
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
$("forgotpassbtn").observe("click",forgotpass);
</script>