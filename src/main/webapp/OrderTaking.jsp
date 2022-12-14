<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="java.util.ArrayList" %>
<%@page import="ph.com.cpi.model.Product" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%	
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Here</title>
  <title> Sweet Satisfaction </title>

  
  <script src="js/main.js"></script>
  <link rel="stylesheet" type="text/css" href="ordertaking/css/bootstrap.css" />
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
  <link href="ordertaking/css/font-awesome.min.css" rel="stylesheet" />
  <link href="ordertaking/css/style.css" rel="stylesheet" />
  <link href="ordertaking/css/responsive.css" rel="stylesheet" />
  <link href="css/modal.css" rel="stylesheet" />
  
</head>
<body class="sub_page">
  <div class="hero_area">
    <div class="bg-box">
    	<img src="https://img.freepik.com/premium-photo/assortment-baked-bread_87742-8900.jpg?w=2000">
    </div>
    
    <!-- header section strats -->
    <header class="header_section">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="index.html">
            <span>
              <img src="ordertaking/images\SSLogo1.png">
            </span>
          </a>
        </nav>
      </div>
    </header>
    <!-- end header section -->
  </div>
  <section class="food_section layout_padding">
    <div class="container">
      <div class="heading_container heading_center">
        <h2>
          Our Menu
        </h2>
      </div>

      <ul class="filters_menu">
        <li class="active" data-filter="*">All</li>
        <li data-filter=".burger">Cake</li>
        <li data-filter=".pizza">Cheesecake</li>
        <li data-filter=".pasta">Bread</li>
        <li data-filter=".fries">Muffin</li>
      </ul>

      <div class="filters-content">
     	<div class="row grid">
      <%
		try{
			ResultSet resultSet = null;
			Connection conn = null;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:TRNG/cpi12345@training-db.cosujmachgm3.ap-southeast-1.rds.amazonaws.com:1521:ORCL";
			conn = DriverManager.getConnection(url);
			Statement statement = conn.createStatement();
			String sql ="SELECT * FROM PRODUCT_3 WHERE product_status != 'Removed'";
			resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
		%>
        
          <div class="col-sm-6 col-lg-4 all pizza">
            <div class="box">
              <div>
                <div class="img-box">
                  <img src=<%=resultSet.getString("product_picture") %>>
                </div>
                <div class="detail-box">
                  <h5><span class="shop-item-title">
					          <%=resultSet.getString("product_name") %>
                  </span></h5>
                  <p>
                    <%=resultSet.getString("product_description") %>
                  </p>
                  <div class="options">
                    <h6><span class="shop-item-price">
                    ₱<%=resultSet.getString("price") %>
                    </span></h6>
                    <input class="shop-item-button" type="image" src="ordertaking/images/Shopping Cart_128px.png" width="40" height="40"></input>
                  </div>
                </div>
              </div>
            </div>
          </div>
        
        
     <%
		}
		conn.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
		</div>
      </div>
    </div>
  </section>

  <section class="add_cart">
    <h1 class="section-header">Your Cart</h1>
    <div class="cart-row">
        <span class="cart-item cart-header cart-column">ITEM</span>
        <span class="cart-price cart-header cart-column">PRICE</span>
        <span class="cart-quantity cart-header cart-column">QUANTITY</span>
    </div>
    <div class="cart-items">
    </div>
    <div class="cart-total">
        <strong class="cart-total-title">Total</strong>
        <span class="cart-total-price">₱0</span>
    </div>
    <div class="btn-box">
      <button class="btn-purchaser" id="modalBtn" type="button">PURCHASE</button>
    </div>
</section>
 <!-------------------------------- POP-UP WINDOW FOR PURCHASE ---------------------------->
<div id="simpleModal" class="modal">
	<div class="modal-content">
		<span class="closeBtn">&times;</span>
		<div class="row">
  <div class="col-md-8 mb-4">
    <div class="card mb-4">
      <div class="card-header py-3">
        <h5 class="mb-0">Biling details</h5>
      </div>
      <div class="card-body">
        <form>
          <!-- 2 column grid layout with text inputs for the first and last names -->
          <div class="row mb-4">
            <div class="col">
              <div class="form-outline">
                <input type="text" id="fname" class="form-control" />
                <label class="form-label">First name</label>
              </div>
            </div>
            <div class="col">
              <div class="form-outline">
                <input type="text" id="lname" class="form-control" />
                <label class="form-label">Last name</label>
              </div>
            </div>
          </div>

          <!-- Number input -->
          <div class="form-outline mb-4">
            <input type="number" id="mnumber" class="form-control" />
            <label class="form-label">Phone</label>
          </div>
          
          <!-- Text input -->
          <div class="form-outline mb-4">
            <input type="text" id="form7Example3" class="form-control" />
            <label class="form-label">Order Date</label>
          </div>

          <!-- Text input -->
          <div class="form-outline mb-4">
            <input type="text" id="form7Example4" class="form-control" />
            <label class="form-label">Delivery Date</label>
          </div>

          <!-- Email input -->
          <div class="form-outline mb-4">
            <input type="email" id="form7Example5" class="form-control" />
            <label class="form-label">Order Status</label>
          </div>


          <!-- Message input -->
          <div class="form-outline mb-4">
            <textarea class="form-control" id="form7Example7" rows="4"></textarea>
            <label class="form-label">Additional information</label>
          </div>

        </form>
      </div>
    </div>
  </div>

  <div class="col-md-4 mb-4">
    <div class="card mb-4">
      <div class="card-header py-3">
        <h5 class="mb-0">Summary</h5>
      </div>
      <div class="card-body">
        <ul class="list-group list-group-flush">
          <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
            Products
            <span>₱0</span>
          </li>
          <li class="list-group-item d-flex justify-content-between align-items-center px-0">
            Shipping
            <span>Gratis</span>
          </li>
          <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
            <div>
              <strong>Total amount</strong>
            </div>
            <span><strong>₱0</strong></span>
          </li>
        </ul>

        <button id="buttonPurchase" type="button" class="btn btn-primary btn-lg btn-block" >
          Make purchase
        </button>
      </div>
    </div>
  </div>
</div>
	</div>
</div>

   <footer class="footer_section">
    <div class="container">
      <div class="footer-info">
        <p>
          &copy; <span id="displayYear"></span>
        </p>
      </div>
    </div>
  </footer>
    <!-- footer section -->

	<script type="text/javascript">
		var contextPath = '${pageContext.request.contextPath}' + '/';
	</script>
  <script src="ordertaking/js/jquery-3.4.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
  </script>
  <script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
  <script src="ordertaking/js/menu.js"></script>
  
  <script src="ordertaking/js/custom.js"></script>

  <script src="js/modal.js"></script>

</body>
</html>