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
	<title>Title</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dashboardCSS.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/popupCSS.css" /> 
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<script src= "js/pop.js"></script>
	<script src= "js/sidebar.js"></script>
	<script src="js/prototype.js"></script>
</head>
<style>

		
    	h1 {
    		font-size: 25px;
    	}

    	.text {
    		text-align: right;
    		padding-right: 10px;
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
  		tr:hover {
  			color: #D7B19D;
  			background-color: #402218;
  		}
  		
        td {
      		width: 250px;
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
        #listTitle {
        margin: 0px 0px 0px 25px;
        }
</style>
<body class="dbBody" id="dbBody">
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
 		</div>

		<div class="dbMain">
			<div class="dbTopbar">
				<div class="dbToggle">
		
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
			  <h1 id="listTitle">Products</h1>
				 <table>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Description</th>
							<th>Picture</th>
							<th>Status</th>
							<th>Price</th>
							<th>Edit</th>
						</tr>
						<%
							for(Product p : pl) {
								%>
								<tr>
									<td><%=p.getProductID() %></td>
									<td><%=p.getProductName() %></td>
									<td><%=p.getProductDesc() %></td>
									<td><img src="<%=p.getProductPic() %>"></td>
									<td><%=p.getProductStatus() %></td>
									<td><%=p.getPrice() %> PHP</td>
									<td>
										<form>
											<input type="text" value="<%=p.getProductName() %>">
											<input type="text" value="<%=p.getProductDesc() %>">
											<input type="text" value="<%=p.getProductPic() %>">
											<input type="text" value="<%=p.getProductStatus() %>">
											<input type="text" value="<%=p.getPrice() %>">
											<button><input type="submit" value="Edit"></button><button><input type="submit" value="Delete"></button>
										</form>
									</td>
								</tr>
								<%
							}
						%>
				</table> 
			</div>
		</div>	
	</div>
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
