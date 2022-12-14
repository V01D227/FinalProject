<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<%@page import="java.util.ArrayList" %>
	<%@page import="ph.com.cpi.model.UserList" %>
	<%ArrayList<UserList> ul = (ArrayList<UserList>)request.getAttribute("userData"); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<script type="text/javascript">
		var contextPath = '${pageContext.request.contextPath}' + '/';
	</script>
	<title>User List</title>
	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="css/dashboardCSS.css" />
	<link rel="stylesheet" type="text/css" href="css/popupCSS.css" />
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	
	<script src="js/jquery-2.2.4.js"></script>
	<script src="js/main.js"></script>
	<script src="js/modalUserlistPage.js"></script>
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
		
		<jsp:include page="sidebar.jsp" />
		
		<div class="dbMain">
			<div class="dbTopbar">
				<div class="dbToggle">
					<i class = "fa fa-ellipsis-h"></i>
				</div>
				<div class="dbGreeting">
					<h1>Hello ${ep} ${user.username}</h1>
				</div>
				<div class="dbProfile">
					<button class="dbProfileButton" data-modal-target="#modalProfile">Edit Profile</button>
					<button class="dbProfileButton" id="logoutButton">Log out</button>
				</div>
			</div>
			
			<div class="dbInfos">
			  <button class="dbAddButton" id="addbutton" data-modal-target="#modalAddUser">Add user</button>
				 <table id="table">
						<tr>
							<th>ID</th>
							<th>Username</th>
							<th>Email</th>
							<th>Role</th>
							<th>Status</th>
						</tr>
						<%
						for(UserList u : ul) {
						%>
						<tr data-modal-target="#modal" class="dataRows">
							<td><%=u.getUserID() %></td>
							<td><%=u.getUsername() %></td>
							<td><%=u.getEmail() %></td>
							<td><%=u.getEndpoint() %></td>
							<td><%=u.getUserStatus() %></td>
						</tr>
						<%
						}
						%>
				</table> 
			</div>
		</div>	
	</div>
	
<!-------------------------------- POP-UP WINDOW FOR ADD USERS ---------------------------->
	<div class="modal" id="modalAddUser">
	    <div class="modal-header">
	      <div class="title">Add User</div>
	      <button data-close-button class="close-button">&times;</button>
	    </div>
	    <div class="modal-body">
	    <form>
	    	<label>Username:</label><input  class="modal-input" type="text" id="username"><br><br>
	    	<label>Email:</label><input  class="modal-input" type="email" id="email"  pattern=".+@globex\.com"><br><br>
	    	<label>Password:</label><input  class="modal-input" type="text" id="password"><br><br>
	    	<label>Role:</label><select class="modal-input" id="role">
			    		  <option>Administrator</option>
			    		  <option>Producer</option>
			    		  <option>Order Taker</option>
			    		  <option>Auditor</option>
	    			  </select>
	    	<br>
	    	<br>
	    	<div class="buttonContainer">
	    		<input type="button" class="dbButton" id="addUserButton" value="Add">
	    	</div>
	    </form>
	    </div>
	  </div>
<!-------------------------------- POP-UP WINDOW FOR EDIT/DELETE USERS ---------------------------->
	<div class="modal" id="modal">
	    <div class="modal-header">
	      <div class="title">Editing user</div>
	      <button data-close-button class="close-button">&times;</button>
	    </div>
	    <div class="modal-body">
	    	<label>ID:</label><span id="uid"></span><br><br>
	    	<label>Username:</label><input class="modal-input" type="text" id="uname"><br><br>
	    	<label>Email:</label><input class="modal-input" type="email" id="emailEdit"><br><br>
	    	<label>Status:</label><select class="modal-input" id="statusEdit">
	    				<option>Enabled</option>
	    	       		<option>Disabled</option>
	    		   </select><br><br>
	    	<label>Role:</label><select class="modal-input" id="roleEdit">
	    	       		<option>Administrator</option>
	    	       		<option>Producer</option>
	    	       		<option>Order Taker</option>
	    	       		<option>Auditor</option>
	    		   </select>
	    	<br>
	    	<br>
	    	<div class="buttonContainer">
	    		<button class="dbButton" value="Update" id="editUserButton" >Update</button>
	    		<button class="dbButton" value="Delete">Delete</button>
	    	</div>
	    </div>
	  </div>
<!-------------------------------- POP-UP WINDOW FOR EDIT PROFILE ---------------------------->
	 <div class="modal" id="modalProfile">
	    <div class="modal-header">
	      <div class="title">Edit Profile</div>
	      <button data-close-button class="close-button">&times;</button>
	    </div>
	    <div class="modal-body">
			<label>Username:</label><input class="modal-input" type="text" value="${user.username}"><br><br>
	    	<label>Email:</label><input class="modal-input" type="text"><br><br>
	    	<label>New Password:</label><input class="modal-input" type="text"><br><br>
	    	<label>Old Password:</label><input class="modal-input" type="text" value="${user.password}"><br><br>
	    	<label>Retype New Password:</label><input class="modal-input" type="text"><br><br>
	    	<div class="buttonContainer">
	    		<button class="dbButton" value="Update">Update</button>
	    	</div>
	    </div>
	  </div>
	 <div id="overlay"></div>
</body>

<script type="text/javascript">
$( document ).ready(function() {
	initAdminProductsPage();
	initAdminUserlistPage();
	initAddUser();
	initEditUser();
	initLogout();
});
 </script>
</html>
