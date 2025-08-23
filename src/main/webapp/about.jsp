<%@page import="java.util.*"%>
<%@page import="model.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Support - Event Management</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="includes/head.jsp"%>

    <!-- Bootstrap + Google Fonts -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">

    <style>
        body {
            background-color: #fff8f3;
            font-family: 'Poppins', sans-serif;
        }

        

        .faq-section {
            padding: 50px 0;
        }

        .faq-section h2 {
            font-weight: 700;
            color: #ff6f00;
            text-align: center;
            margin-bottom: 40px;
        }

        .card-header {
            background-color: #ff6f00;
            color: #fff;
            font-weight: bold;
        }

        .support-card {
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            transition: 0.3s ease-in-out;
        }

        .support-card:hover {
            transform: translateY(-5px);
        }

        .support-card h5 {
            font-weight: 600;
            color: #ff6f00;
        }

        .support-card p {
            color: #555;
        }

        .footer {
            background-color: #ff6f00;
            color: #fff;
            padding: 20px 0;
            text-align: center;
            margin-top: 60px;
        }
    </style>
</head>
<body>
 <%@include file="includes/navbar.jsp"%>
<!-- FAQ Section -->
<section class="faq-section container">
    <h2>Frequently Asked Questions</h2>
    <div class="accordion" id="faqAccordion">

        <div class="card mb-3">
            <div class="card-header" id="faq1">
                <h5 class="mb-0">
                    <button class="btn btn-link text-white" type="button" data-toggle="collapse" data-target="#collapse1">
                        How do I book an event?
                    </button>
                </h5>
            </div>
            <div id="collapse1" class="collapse show" data-parent="#faqAccordion">
                <div class="card-body">
                    Simply navigate to the event listing, choose your desired event, and click "Book Now". Fill in the required details and confirm.
                </div>
            </div>
        </div>

        <div class="card mb-3">
            <div class="card-header" id="faq2">
                <h5 class="mb-0">
                    <button class="btn btn-link text-white collapsed" type="button" data-toggle="collapse" data-target="#collapse2">
                        Can I cancel or modify my booking?
                    </button>
                </h5>
            </div>
            <div id="collapse2" class="collapse" data-parent="#faqAccordion">
                <div class="card-body">
                    Yes, modifications are allowed up to 24 hours before the event. Cancellations may be subject to a fee.
                </div>
            </div>
        </div>

        <div class="card mb-3">
            <div class="card-header" id="faq3">
                <h5 class="mb-0">
                    <button class="btn btn-link text-white collapsed" type="button" data-toggle="collapse" data-target="#collapse3">
                        How will I receive my booking confirmation?
                    </button>
                </h5>
            </div>
            <div id="collapse3" class="collapse" data-parent="#faqAccordion">
                <div class="card-body">
                    You’ll receive an email confirmation with all the event details after booking is completed successfully.
                </div>
            </div>
        </div>

    </div>
</section>

<!-- Support Cards -->
<div class="container my-5">
    <div class="row text-center">

        <div class="col-md-4 mb-4">
            <div class="p-4 support-card">
                <h5>Live Chat</h5>
                <p>Chat with our team for real-time assistance on bookings and queries.</p>
            </div>
        </div>

        <div class="col-md-4 mb-4">
            <div class="p-4 support-card">
                <h5>Email Support</h5>
                <p>Send us your issue at <strong>support@jazzevents.com</strong> and we’ll reply within 24 hours.</p>
            </div>
        </div>

        <div class="col-md-4 mb-4">
            <div class="p-4 support-card">
                <h5>Call Us</h5>
                <p>Our hotline is available from 9AM - 6PM: <strong>+1 (800) 123-4567</strong></p>
            </div>
        </div>

    </div>
</div>

  <%@include file="includes/footer.jsp"%>

<!-- JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
