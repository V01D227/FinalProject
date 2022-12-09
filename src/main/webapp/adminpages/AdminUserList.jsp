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
	
	<title>Title</title>
	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dashboardCSS.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/popupCSS.css" />
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	
	
	
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
 			<!-- <input type="submit" id="orderNow" value="Show Products"> <input type="submit" id="orderNow" value="Show Products">  -->
 		</div>
 	<!-- main -->
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
			  <h1 id="listTitle">Users</h1>
				 <table>
						<tr>
							<th>ID</th>
							<th>Username</th>
							<th>Role</th>
							<th>Edit</th>
							
						</tr>
						<%
							for(UserList u : ul) {
								%>
								<tr>
									<td><%=u.getUserID() %></td>
									<td><%=u.getUsername() %></td>
									<td><%=u.getEndpoint() %></td>
									
									<td>
									<button data-modal-target="#modal">Open Modal</button>
									  <div class="modal" id="modal">
									    <div class="modal-header">
									      <div class="title">Example Modal</div>
									      <button data-close-button class="close-button">&times;</button>
									    </div>
									    <div class="modal-body">
									      Lorem ipsum dolor sit amet consectetur adipisicing elit. Esse quod alias ut illo doloremque eum ipsum obcaecati distinctio debitis reiciendis quae quia soluta totam doloribus quos nesciunt necessitatibus, consectetur quisquam accusamus ex, dolorum, dicta vel? Nostrum voluptatem totam, molestiae rem at ad autem dolor ex aperiam. Amet assumenda eos architecto, dolor placeat deserunt voluptatibus tenetur sint officiis perferendis atque! Voluptatem maxime eius eum dolorem dolor exercitationem quis iusto totam! Repudiandae nobis nesciunt sequi iure! Eligendi, eius libero. Ex, repellat sapiente!
									    </div>
									  </div>
									  <div id="overlay"></div>
									</td>
								</tr>
								<%
							}
						%>
				</table> 
			</div>
		</div>	
	</div>
<script>
const openModalButtons = document.querySelectorAll('[data-modal-target]')
const closeModalButtons = document.querySelectorAll('[data-close-button]')
const overlay = document.getElementById('overlay')

openModalButtons.forEach(button => {
  button.addEventListener('click', () => {
    const modal = document.querySelector(button.dataset.modalTarget)
    openModal(modal)
  })
})

overlay.addEventListener('click', () => {
  const modals = document.querySelectorAll('.modal.active')
  modals.forEach(modal => {
    closeModal(modal)
  })
})

closeModalButtons.forEach(button => {
  button.addEventListener('click', () => {
    const modal = button.closest('.modal')
    closeModal(modal)
  })
})

function openModal(modal) {
  if (modal == null) return
  modal.classList.add('active')
  overlay.classList.add('active')
}

function closeModal(modal) {
  if (modal == null) return
  modal.classList.remove('active')
  overlay.classList.remove('active')
}
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
