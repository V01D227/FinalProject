<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	var contextPath = '${pageContext.request.contextPath}' + '/';
</script>
<head>
<script src="js/jquery-2.2.4.js"></script>
<script src="js/main.js"></script>
<script src="js/pop.js"></script>
<script src="js/sidebar.js"></script>
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