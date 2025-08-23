	<%@page import="java.util.*"%>
	<%@page import="dao.EventDao"%>
	<%@page import="java.sql.Connection"%>
	<%@page import="connection.DbCon"%>
	<%@page import="model.*"%>
	<%@page import="java.util.List"%>
	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		pageEncoding="ISO-8859-1"%>
	<%
		User auth = (User) request.getSession().getAttribute("auth");
		if (auth != null) {
			request.setAttribute("auth", auth);
		}
		
		EventDao pd = new EventDao(DbCon.getConnection());
		List<Event> evnts = pd.getAllEvents();
	
	%>
	<!DOCTYPE html>
	<html>
	<head>
	<title>Welcome to JAZZ Events</title>
	<%@include file="includes/head.jsp"%>
	    
	<style>
	  body {
	    margin: 0;
	    background-color: #f9f9f9; /* Changed from black to light */
	    font-family: 'Poppins', sans-serif;
	    color: #333; /* Dark text for light background */
	  }
	
	  .hd {
	    background: linear-gradient(to right, #ffffff, #f2f2f2);
	    padding: 60px 0;
	  }
	
	  .hd h1 {
	    color: #ff6600;
	    font-size: 50px;
	    margin-bottom: 20px;
	  }
	
	  .btns {
	    background-color: #ff6600;
	    color: #fff;
	    padding: 10px 30px;
	    font-weight: 600;
	    border-radius: 30px;
	    text-decoration: none;
	    transition: background 0.4s ease;
	  }
	
	  .btns:hover {
	    background-color: #ff8533;
	  }
	
	  .card-header {
	    background-color: #fff3e6;
	    color: #ff6600;
	    font-size: 24px;
	    font-weight: bold;
	    padding: 15px;
	    border-left: 5px solid #ff6600;
	    margin-top: 40px;
	    border-radius: 4px;
	  }
	
	  .product-card {
	    background: #ffffff;
	    border-radius: 10px;
	    overflow: hidden;
	    transition: transform 0.3s ease, box-shadow 0.3s ease;
	    box-shadow: 0 4px 8px rgba(255, 102, 0, 0.15);
	  }
	
	  .product-card:hover {
	    transform: scale(1.03);
	    box-shadow: 0 8px 16px rgba(255, 102, 0, 0.3);
	  }
	
	  .product-card .card-img-top {
	    height: 220px;
	    object-fit: cover;
	  }
	
	  .product-card .card-body {
	    padding: 20px;
	  }
	
	  .product-card h5 {
	    margin-bottom: 10px;
	  }
	
	  .product-card .price,
	  .product-card .category {
	    font-size: 14px;
	    color: #ff6600;
	  }
	
	  .btn-primary {
	    background-color: #ff6600;
	    border: none;
	    padding: 8px 18px;
	    color: white;
	    border-radius: 6px;
	    text-decoration: none;
	    font-weight: bold;
	  }
	
	  .btn-primary:hover {
	    background-color: #e65c00;
	  }
	
	  .col-2 h1 {
	    font-size: 48px;
	    font-weight: bold;
	  }
	
	  .col-2 img {
	    max-width: 100%;
	    border-radius: 10px;
	  }
	
	  .containers {
	    max-width: 1300px;
	    margin: auto;
	    padding: 0 25px;
	  }
	
	  .rows {
	    display: flex;
	    flex-wrap: wrap;
	    align-items: center;
	    justify-content: space-around;
	    padding: 30px 0;
	  }
	
	  .col-2 {
	    flex-basis: 50%;
	    min-width: 300px;
	    padding: 20px;
	  }
	
	  .container {
	    max-width: 1300px;
	    margin: 0 auto;
	    padding: 40px 25px;
	  }
	
	  .row {
	    display: flex;
	    flex-wrap: wrap;
	    margin: 0 -15px;
	  }
	
	  .col-md-3 {
	    flex: 0 0 25%;
	    max-width: 25%;
	    padding: 15px;
	  }
	
	  hr {
	    border: 1px solid #eee;
	    margin: 0;
	  }
	
	  @media (max-width: 768px) {
	    .col-md-3 {
	      flex: 0 0 50%;
	      max-width: 50%;
	    }
	
	    .col-2 {
	      flex: 100%;
	    }
	
	    .rows {
	      flex-direction: column;
	    }
	  }
	</style>
	
	</head>
	<body>
	 <!-- Header -->
	 <%@include file="includes/navbar.jsp"%>
	  
	<div class="hd">
	        <div class="containers">
	            <div class="navbar">
	                <div class="rows">
	                    <div class="col-2">
	                        <h1>Book Your Favourite Events <br>Hearts</h1>
	                        <p></p>
	                        <a href="#" class="btns">Explore Now &#8594;</a>
	                    </div>
	                    <div class="col-2">
	                        <img src="images/eventtkt.jpg" alt="">
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
		<div class="container">
			<div class="card-header my-3">All Events</div>
			<div class="row">
				<%
				if (!evnts.isEmpty()) {
					for (Event p : evnts) {
				%>
				<div class="col-md-3 my-3">
					<div class="card product-card">
						<img src="<%= p.getImage() %>" alt="Event Image" class="card-img-top">
						<div class="card-body">
							<h5 class="card-title"><%=p.getName()%></h5>
							<h5 class="price">Price:<%=p.getPrice()%></h5>
							<h5 class="category">Venue:<%=p.getCategory()%></h5>
								<div class="mt-3 d-flex justify-content-between">
								    <a href="user?action=create" class="btn btn-primary">Book Now</a>
								</div>
	
						</div>
					</div>
				</div>
				<%
				}
				}
				%>
			</div>
		</div>
	
	    <%@include file="includes/footer.jsp"%>
	</body>
	</html>