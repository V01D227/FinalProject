<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display Info</title>
</head>
<style>
	* {
		font-family: Helvetica;
	}
	span {
		font-weight: bold;
	}
</style>
<body>
	<h1>Your Personal Information</h1>
		<span>Name: </span><c:out value="${personalInfo.firstname} ${personalInfo.middlename} ${personalInfo.lastname}" />
		<br>
		<span>Age: </span><c:out value="${personalInfo.age}" />
		<br>
		
		<span>Birthdate: </span> <c:out value="${personalInfo.birthday}" />
		<br>
		<fmt:parseDate value="${personalInfo.birthday}" pattern="yyyy-MM-dd" var="bday"/>
		Date Format 1: <fmt:formatDate value="${bday}" pattern="MM-dd-yyyy"/>
		<br>
		Date Format 2: <fmt:formatDate type="both" value="${bday}" />
		<br>
		Date Format 3: <fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${bday}" />
		
		<br>
		<fmt:parseNumber value="${personalInfo.salary}" var="sal"/>
		<span>Salary: </span><fmt:formatNumber type="number" pattern="###,###.##" value="${personalInfo.salary}" />
		<c:set var="salary" scope="session" value="${personalInfo.salary}" />
		<c:choose>
			<c:when test="${personalInfo.salary == ''}">
				No Salary
			</c:when>
			<c:when test="${personalInfo.salary <= 20000.00}">
				(Maganda siguro trabaho mo.)
			</c:when>
			<c:when test="${personalInfo.salary > 20000.00 && personalInfo.salary < 50000.00}">
				(Wow, siguro TL ka na.)
			</c:when>
			<c:when test="${personalInfo.salary >= 50000.00}">
				(Tigapag mana ka na siguro ng company)
			</c:when>
			<c:otherwise>
				Incorrect Salary Input.
			</c:otherwise>
		</c:choose>
		<br>
		<span>Pets: </span> 
		<ul>
			<c:forTokens items="${personalInfo.pets}" delims="." var="pet">
				<li><c:out value="${pet}" />
			</c:forTokens>
		</ul>
		<br>
		<input type="button" id="logoutBtn" value="Logout">
</body>

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
</html>
