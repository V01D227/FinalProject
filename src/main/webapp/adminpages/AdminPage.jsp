<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<%@page import="java.util.ArrayList" %>
	<%@page import="ph.com.cpi.model.Product" %>
	<%ArrayList<Product> pl = (ArrayList<Product>)request.getAttribute("productData"); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dashboardCSS.css" /> 
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<script src= "js/prototype.js"></script>
	<script src= "js/sidebar.js"></script>
<title>Title</title>
</head>

<body class="dbBody">
	<div class="dbContainer">
		<div class="dbSidebar">
		<ul>
				<li>
					<a href="#">
					<span class="dbSidebarIcon"><i class = "fa fa-bread-slice"></i></span>
					<span class="dbMenu">Sweet Satisfaction</span></a>
				</li>
				<li id="showUsers">
					<a href="#">
					<span class="dbSidebarIcon"><i class = "fa fa-users"></i></span>
					<span class="dbMenu">Users</span></a>
				</li>
				<li id="showProducts">
					<a href="#">
					<span class="dbSidebarIcon"><i class = "fa fa-boxes"></i></span>
					<span class="dbMenu">Products</span></a>
				</li>
				<li>
					<a href="#">
					<span class="dbSidebarIcon"><i class = "fa fa-th-list"></i></span>
					<span class="dbMenu">Orders</span></a>
				</li>
				<li>
					<a href="#">
					<span class="dbSidebarIcon"><i class = "fa fa-cube"></i></span>
					<span class="dbMenu">Production</span></a>
				</li>
				<li>
					<a href="#">
					<span class="dbSidebarIcon"><i class="fa fa-clipboard-list"></i></span>
					<span class="dbMenu">Reporting</span></a>
				</li>
			</ul>
 			<!-- <input type="submit" id="orderNow" value="Show Products"> <input type="submit" id="orderNow" value="Show Products">  -->
 		</div>
 	<!-- main -->
		<div class="dbMain">
			<div class="dbTopbar">
				<div class="dbToggle">
					<span id="bars"><i class="fa fa-bars"></i></span>
				</div>
				<div>
					<h1>Hello ${ep} ${user.username}</h1>
				</div>
				<div>
					<button class="dbEditProfileBtn">Edit Profile</button>
					<button class="dbLogoutBtn">Log out</button>
				</div>
			</div>
			
			
			<div class="dbUserListTable">
				<table>
					
				</table> 
			</div>
		</div>	
	</div>

<script>
		//Toggle Sidebar
		let dbToggle = document.querySelector('.dbToggle');
		let dbSidebar = document.querySelector('.dbSidebar');
		let dbMain = document.querySelector('.dbMain');

		dbToggle.onclick = function() {
			dbSidebar.classList.toggle('active');
			dbMain.classList.toggle('active');
		}
		//hovering Menus
		let list = document.querySelectorAll('.db-sidebar li');
		function activeLink() {
			list.forEach((item) =>
			item.classList.remove('hovered'));
			this.classList.add('hovered');			
		}
		list.forEach((item) =>
		item.addEventListener('mouseover',activeLink));
</script>

</body>

<script src= "js/prototype.js">

var contextPath = '${pageContext.request.contextPath}' + '/';

function ShowProductsAjax() {
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
$("showProducts").observe("click",ShowProductsAjax);

function ShowUsersAjax() {
	try {
		new Ajax.Request(
				contextPath + "userlistcontroller",
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
$("showUsers").observe("click",ShowUsersAjax);
</script>

</html>
