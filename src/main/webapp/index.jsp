<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<script type="text/javascript">
	var contextPath = '${pageContext.request.contextPath}' + '/';
</script>
<head>
<script src="js/jquery-2.2.4.js"></script>
<script src="js/main.js"></script>

<meta charset="ISO-8859-1">

<title>Title</title>
</head>
<body>
	<div id="mainDiv">
	</div>
</body>

<script type="text/javascript">
$( document ).ready(function() {
	checkSession();
});
</script>
</html>