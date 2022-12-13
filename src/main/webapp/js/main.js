/************************************************************************* CHECK SESSION **********/
function checkSession(){
	$.ajax({
		url: contextPath + "checksessioncontroller",
		method: "POST",
		success: function(result){
			$("#mainDiv").html(result);
		}
	});
}

/************************************************************************* LOGIN **********/

function initLoginPage(){
	$("#loginButton").click(function(){
		var username = $('#username').val();
		var password = $('#password').val();
		if (username == "" || username == null) {
			alert('Please Enter Username!')
		} else if (password == "" || password == null) {
			alert('Please Enter Password!')
		} else {
			login(username, password);
		}
	})
}

function login(username, password){
	$.ajax({
		url: contextPath + "logincontroller",
		method: "POST",
		data : {
			action:"login",
			username: username,
			password: password
		},
		success: function(result){
			$("#mainDiv").html(result);
		}
	});
}


/************************************************************************* LOGOUT **********/

function initLogout(){
	$("#logoutButton").click(function(){
		var answer = confirm('Do you want to Logout?');
		if (answer){
			logout();
		} else {
			e.preventDefault();
		}
	})
}

function logout(){
	$.ajax({
		url: contextPath + "logoutcontroller",
		method: "POST",
		success: function(result){
			$("#mainDiv").html(result);
		}
	});
}



/************************************************************************* SHOW PRODUCTS **********/
function initAdminProductsPage(){
	$('#showProducts').click(function(){
		ShowProductsAjax();
	})
}

function ShowProductsAjax() {
	$.ajax({
		url: contextPath + "productcontroller",
		method: "POST",
		success: function(result){
			$("#mainDiv").html(result);
		}
	});
}

/************************************************************************* SHOW USERS **********/
function initAdminUserlistPage(){
	$('#showUsers').click(function(){
		ShowUsersAjax();
	})
}
function ShowUsersAjax() {
	$.ajax({
		url: contextPath + "userlistcontroller",
		method: "POST",
		success: function(result){
			$("#mainDiv").html(result);
		}
	});
}

/************************************************************************* ADD USER **********/
function initAddUser(){
	$("#addUserButton").click(function(){
		var username = $('#username').val();
		var email = $('#email').val();
		var password = $('#password').val();
		var role = $('#role').val();
		var regex = /^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/
		
		if (username == "" || username == null) {
			alert('Please Enter Username!')
		} else if (email == "" || email == null) {
			alert('Please Enter Email!')
		} else if (password == "" || password == null) {
			alert('Please Enter Password!')
		} else if ($('#emailEdit').val().match(regex)) { 
			var answer = confirm('Add user ' + username + '?');
			if (answer){
				AddUserAjax(username, password, email, role)();
			} else {
				e.preventDefault();
			}
		} else {
			alert('Your input is not a valid email address!');
		}
	})
}

function AddUserAjax(username, password, email, role) {
	console.log(username);
	console.log(password);
	console.log(email);
	console.log(role);
	
	var roleid;
	if (role == 'Administrator') {
		roleid = 101;
	} else if (role == 'Producer') {
		roleid = 102;
	} else if (role == 'Order Taker') {
		roleid = 103;
	} else if (role == 'Auditor') {
		roleid = 104;
	}
	console.log(roleid);
	$.ajax({
		url: contextPath + "addusercontroller",
		method: "POST",
		data : {
			username: username,
			password: password,
			email: email,
			role: roleid
		},
		success: alert('Added Successfully!')
	});
	closeModal(modal)
}

/************************************************************************* EDIT USER **********/
function initEditUser(){
	$("#editUserButton").click(function(){
		var userid = document.getElementById("uid").textContent;
		var username = $('#uname').val();
		var email = $('#emailEdit').val();
		var status = $('#statusEdit').val();
		var role = $('#roleEdit').val();
		var regex = /^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/
		
		if (username == "" || username == null) {
			alert('Please Enter a Username!')
		} else if (role == "" || role == null) {
			alert('Please Enter a Role!')
		} else if ($('#emailEdit').val().match(regex)) { 
			var answer = confirm('Save changes on user ' + userid + '?');
			if (answer){
				EditUserAjax(userid, username, email, status, role)();
			} else {
				e.preventDefault();
			}
		} else {
			alert('Your input is not a valid email address!');
		}
	})
}

function closeModal(modal) {
  if (modal == null) return
  modal.classList.remove('active')
  overlay.classList.remove('active')
}

function EditUserAjax(userid, username, email, status, role) {
	console.log(userid);
	console.log(username);
	console.log(email);
	console.log(status);
	console.log(role);
	
	var roleid;
	if (role == 'Administrator') {
		roleid = 101;
	} else if (role == 'Producer') {
		roleid = 102;
	} else if (role == 'Order Taker') {
		roleid = 103;
	} else if (role == 'Auditor') {
		roleid = 104;
	}
	console.log(roleid);
	
	$.ajax({
		url: contextPath + "editusercontroller",
		method: "POST",
		data : {
			action: "edituser",
			userid: userid,
			username: username,
			email: email,
			status: status,
			role: roleid
		},
	});
	
	alert('Updated User Successfully!');
	closeModal(modal)
}

/************************************************************************* FORGOT PASSWORD **********/
function initForgotPassword(){
	$("#forgotpassbtn").click(function(){
		var username = $('#usernameFPW').val();
		var email = $('#emailFPW').val();
		
		var regex = /^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/
		
		if($('#emailFPW').val().match(regex)) {
			console.log($('#emailFPW').val());
			ForgotPasswordAjax(username, email)();
		} else {
			alert('Your input is not a valid email address!');
		}
	})
}

function ForgotPasswordAjax(username, email) {
	$.ajax({
		url: contextPath + "logincontroller",
		method: "POST",
		data : {
			action: "forgotpass",
			username: username,
			email: email
		},
		success: function(result){
			$("#mainDiv").html(result);
		}
	});
}

/************************************************************************* EDIT PRODUCT **********/

function initEditProduct(){
	$("#editProductButton").click(function(){
		var pid = document.getElementById("pidEdit").textContent;
		var pname = $('#pnameEdit').val();
		var pdesc = $('#pdescEdit').val();
		var ppic = $('#ppicEdit').val();
		var pstatus = $('#pstatusEdit').val();
		var pprice = $('#ppriceEdit').val();
		
		if (pname == "" || pname == null) {
			alert('Please Enter a Product Name!')
		} else if (pprice == "" || pprice == null) {
			alert('Please Enter a Role!')
		} else { 
			var answer = confirm('Save changes on product ' + pid + '?');
			if (answer){
				EditProductAjax(pid, pname, pdesc, ppic, pstatus, pprice);
			} else {
				e.preventDefault();
			}
		}
	})
}

function closeModal(modal) {
  if (modal == null) return
  modal.classList.remove('active')
  overlay.classList.remove('active')
}

function EditProductAjax(pid, pname, pdesc, ppic, pstatus, pprice) {
	console.log(pid);
	console.log(pname);
	console.log(pdesc);
	console.log(ppic);
	console.log(pstatus);
	
	$.ajax({
		url: contextPath + "editproductcontroller",
		method: "POST",
		data : {
			productID: pid,
			productName: pname,
			productDesc: pdesc,
			productPic: ppic,
			productStatus: pstatus,
			productPrice: pprice
		},
		success: alert('Updated Product Successfully!')
	});
	
	closeModal(modal)
}

/************************************************************************* ADD PRODUCT **********/
function initAddProduct(){
	$("#addProductButton").click(function(){
		var pname = $('#pnameAdd').val();
		var pdesc = $('#pdescAdd').val();
		var ppic = $('#ppicAdd').val();
		var pstatus = $('#pstatusAdd').val();
		var pprice = $('#ppriceAdd').val();
		
		if (pname == "" || pname == null) {
			alert('Please Enter Product Name!')
		} else if (pprice == "" || pprice == null) {
			alert('Please Enter Product Price!')
		}  else { 
			var answer = confirm('Do you want to add product' + pname + '?');
			if (answer){
				AddProductAjax(pname, pdesc, ppic, pstatus, pprice)();
			} else {
				e.preventDefault();
			}
		}
	})
}

function AddProductAjax(pname, pdesc, ppic, pstatus, pprice){
	console.log(pname);
	console.log(pdesc);
	console.log(ppic);
	console.log(pstatus);
	console.log(pprice);
	
	$.ajax({
		url: contextPath + "addproductcontroller",
		method: "POST",
		data : {
			pname: pname,
			pdesc: pdesc,
			ppic: ppic,
			pstatus: pstatus,
			pprice: pprice
		},
		success: alert('Added Successfully!')
	});
	closeModal(modal)
}