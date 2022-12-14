<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<%@page import="java.util.ArrayList" %>
	<%@page import="ph.com.cpi.model.AuditOrder" %>
	<%ArrayList<AuditOrder> ul = (ArrayList<AuditOrder>)request.getAttribute("auditOrderData"); %>
	
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Title</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script type="text/javascript">
		var contextPath = '${pageContext.request.contextPath}' + '/';
	</script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dashboardCSS.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/popupCSS.css" /> 
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	
	<script src="js/jquery-2.2.4.js"></script>
	<script src="js/modalProductsPage.js"></script>
	<script src="js/main.js"></script>
	
</head>
<style>

    	h1 {
    		font-size: 25px;
    	}
    	
        table {
       		border: 1px solid;
        	border-radius: 30px;
            margin: 25px;
            width: 1000px;
            border-collapse: collapse;
            
        }
  		tr {
  			border: solid;
  			border-width: 1px 0;
  		}
  		
  		.dataRows:hover {
  			color: #D7B19D;
  			background: #402218;
  		}
  		
        td {
      		width: 333px;
            padding: 10px;
            text-align: center;
            
        }
  		th {
  			width: 250px;
            padding: 10px;
            text-align: center;
  			border: none
  			
  		}
        img {
        	width: 100px;
        	height: 100px;
        }
        
</style>

<body class="dbBody" id="dbBody">
	<div class="dbContainer">
		<div class="dbSidebar">
		<ul>
				<li class="dbNotSelectedSidebar">
					<a href="#">
					<span class="dbSidebarIcon"><i class = "fa fa-bread-slice"></i></span>
					<span class="dbMenu">Sweet Satisfaction</span></a>
				</li>
				<li id="showUsers" class="dbNotSelectedSidebar">
					<a href="#">
					<span class="dbSidebarIcon"><i class = "fa fa-users"></i></span>
					<span class="dbMenu">Users</span></a>
				</li>
				<li id="showProducts" class="dbNotSelectedSidebar">
					<a href="#">
					<span class="dbSidebarIcon"><i class = "fa fa-boxes"></i></span>
					<span class="dbMenu">Products</span></a>
				</li>
				<li id="showOrders" class="dbNotSelectedSidebar">
					<a href="#">					
					<span class="dbSidebarIcon"><i class = "fa fa-th-list"></i></span>
					<span class="dbMenu">Orders</span></a>
				</li>
				<li id="showProduction" class="dbNotSelectedSidebar">
					<a href="#">
					<span class="dbSidebarIcon"><i class = "fa fa-cube"></i></span>
					<span class="dbMenu">Production</span></a>
				</li>
				<li id="showReporting" class="dbSelectedSidebar">
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
					<i class = "fa fa-ellipsis-h"></i>
				</div>
				<div class="dbGreeting">
					<h1>Hello ${ep} ${user.username}</h1>
				</div>
				<div class="dbProfile">
					<!-- <button data-modal-target="#modalProfile" class="dbProfileButton">Edit Profile</button> 
					  <div class="modal" id="modalProfile">
					    <div class="modal-header">
					      <div class="title">Edit Profile</div>
					      <button data-close-button class="close-button">&times;</button>
					    </div>
					    <div class="modal-body">
	   						Username: 			 <input class="modal-input" type="text" value="${user.username}"><br><br>
					    	Email:				 <input class="modal-input" type="text"><br><br>
					    	New Password:		 <input class="modal-input" type="text"><br><br>
					    	Old Password:		 <input class="modal-input" type="text" value="${user.password}"><br><br>
					    	Retype New Password: <input class="modal-input" type="text"><br><br>
					    	<button class="dbLogoutBtn" value="Update">Update</button>
					    </div>
					  </div>-->
					<button class="dbProfileButton" id="logoutButton">Log out</button>
				</div>
			</div> 
			
			
			<div class="dbInfos">
			  <h1 class="dbAddButton">TEST</h1>
				 
			</div>
		</div>	
	</div>
	<div class="modal" id="modal">
	    <div class="modal-header">
	      <div class="title">Edit User</div>
	      <button data-close-button class="close-button">&times;</button>
	    </div>
	    <div class="modal-body">
	    	ID: 	  <input type="text" name="uid" id="uid"><br><br>
	    	Username: <input type="text" name="uname" id="uname"><br><br>
	    	Role:     <input type="text" name="role" id="role"><br><br>
	    	<button value="Update">Update</button><button value="Delete">Delete</button>
	    
	    </div>
	  </div>
	 <div id="overlay"></div>
</body>

<script type="text/javascript">
$( document ).ready(function() {
	initAdminProductsPage();
	initAdminUserlistPage();
	initAuditorPage();
	initLogout();
});
</script>
</html>
