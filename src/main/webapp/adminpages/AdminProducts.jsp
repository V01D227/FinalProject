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
  		.dataRows:hover {
  			color: #D7B19D;
  			background: #402218;
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
        #addbutton {
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
				<li id="showProducts" class="dbSelectedSidebar">
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
					<button class="dbLogoutBtn" id="logoutButton">Log out</button>
				</div>
			</div>
			
			
			<div class="dbUserListTable">
			  <button class="dbLogoutBtn" id="addbutton" data-modal-target="#modalAddProduct">Add Product</button>
				 <table id="table">
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Description</th>
							<th>Picture</th>
							<th>Status</th>
							<th>Price</th>
						</tr>
						<%
							for(Product p : pl) {
								%>
								<tr  data-modal-target="#modal" class="dataRows">
									<td><%=p.getProductID() %></td>
									<td><%=p.getProductName() %></td>
									<td><%=p.getProductDesc() %></td>
									<td><img src="<%=p.getProductPic() %>"></td>
									<td><%=p.getProductStatus() %></td>
									<td><%=p.getPrice() %> PHP</td>
								</tr>
								<%
							}
						%>
				</table> 
			</div>
		</div>	
	</div>
	
<!-------------------------------- POP-UP WINDOW FOR ADD PRODUCTS ---------------------------->
	<div class="modal" id="modalAddProduct">
	    <div class="modal-header">
	      <div class="title">Add User</div>
	      <button data-close-button class="close-button">&times;</button>
	    </div>
	    <div class="modal-body">
	    <form>
	    	Product Name:        <input     class="modal-input" id="pnameAdd"><br><br>
	    	Product Description: <textarea  class="modal-textarea" id="pdescAdd"></textarea><br><br>
	    	Product Picture:  	 <input     class="modal-input" id="ppicAdd" type="text" ><br><br>
	    	Product Status:	  	 <select    class="modal-input" id="pstatusAdd">
						    		  <option>Available</option>
						    		  <option>Disabled</option>
						    		  <option>Removed</option>
	    			  			 </select>
	    	<br>
	    	<br>
	    	Product Price: <input  class="modal-input" type="number" id="ppriceAdd"><br><br>
	    	<input type="button" class="dbLogoutBtn" id="addProductButton" value="Add">
	    </form>
	    </div>
	  </div>
<!-------------------------------- POP-UP WINDOW FOR EDIT/DELETE PRODUCTS ---------------------------->
	<div class="modal" id="modal">
	    <div class="modal-header">
	      <div class="title">Editing product</div>
	      <button data-close-button class="close-button">&times;</button>
	    </div>
	    <div class="modal-body">
	    	Product ID:   		 <span id="pidEdit"></span><br><br>
	    	Product Name: 		 <input     class="modal-input" id="pnameEdit"><br><br>
	    	Product Description: <textarea  class="modal-textarea" id="pdescEdit"></textarea><br><br>
	    	Product Picture:	 <input 	class="modal-input" id="ppicEdit"><br><br>
	    	Product Status:		 <select    class="modal-input" id="pstatusEdit">
	    				 			  <option>Available</option>
						    		  <option>Disabled</option>
						    		  <option>Removed</option>
	    		   		  		 </select><br><br>
	    	Product Price:  	 <input type="number" class="modal-input" id="ppriceEdit">
	    	<br>
	    	<br>
	    	<button class="dbLogoutBtn" value="Update" id="editProductButton" >Update</button>
	    </div>
	  </div>
<!-------------------------------- POP-UP WINDOW FOR EDIT PROFILE ---------------------------->
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
	  </div>
	 <div id="overlay"></div>
</body>

<script type="text/javascript">
$( document ).ready(function() {
	initAdminProductsPage();
	initAdminUserlistPage();
	initAddProduct();
	initEditProduct();
	initLogout();
});
</script>
</html>
