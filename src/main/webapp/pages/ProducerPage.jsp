<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Title</title>
<style>
	* {
		text-align: center;
	}
</style>
</head>


<!-- 	<label>First Name :  </label><br><input type="text"   id="firstname"  name="firstname"><br>
	<label>Middle Name : </label><br><input type="text"   id="middlename" name="middlename"><br>
	<label>Last Name :   </label><br><input type="text"   id="lastname"   name="lastname"><br><br>
	<label>Age :         </label><br><input type="number" id="age"        name="age"><br><br>
	<label>Birthday :    </label><br><input type="date"   id="birthday"   name="birthday"><br><br>
	<label>Salary :      </label><br><input type="text"   id="salary"     name="salary"><br><br>
	<label>Pets  (separate by period "." if 2 or more):
						 </label><br><input type="text"   id="pets"       name="pets"><br><br> -->
						 
	<!-- <input type="submit" id="infoBtn" value="Submit">
	<br> -->
	<body>
	${ep}
	</body>

<script src= "js/prototype.js">

var contextPath = '${pageContext.request.contextPath}' + '/';

function infoSubmitAjax() {
	try {
		console.log($("firstname").value + " : " + $("middlename").value + " : " + $("lastname").value + " : " + $("age").value + " : " + $("birthday").value + " : " + $("salary").value + " : " + $("pets").value);
		new Ajax.Request(
				contextPath + "actioncontroller",
				{
					method : "POST",
					parameters:{
						action:"info",
						firstname:$("firstname").value,
						middlename:$("middlename").value,
						lastname:$("lastname").value,
						age:$("age").value,
						birthday:$("birthday").value,
						salary:$("salary").value,
						pets:$("pets").value,
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
$("infoBtn").observe("click",infoSubmitAjax);
</script>

<script src= "js/prototype.js">
var contextPath = '${pageContext.request.contextPath}' + '/';
function logoutAjax() {
	try {
		new Ajax.Request(
				contextPath + "actioncontroller",
				{
					method : "POST",
					parameters:{
						action:"logout",
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
$("logoutBtn").observe("click",logoutAjax);

</script>

<br>
<</html>