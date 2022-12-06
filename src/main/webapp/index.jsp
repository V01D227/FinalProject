<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Personal Info Login</title>
<script src= "js/prototype.js"> </script>
</head>
<div id="mainDiv">
</div>
<div id="infoDiv">
</div>

<script>
var contextPath = '${pageContext.request.contextPath}' + '/';
function sampleAjax() {
	try {
		new Ajax.Request(
				contextPath + "checksessioncontroller",
				{
					method : "POST",
					onComplete : function(response) {
						$("mainDiv").update(response.responseText);
					}
				});
	} catch (e) {
		console.log("Error " + e);
	}
}

sampleAjax();
	
</script>
</html>
