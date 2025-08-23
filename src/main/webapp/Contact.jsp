<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
<style>
 
 
 
  body {
/*     background-image: url("images/img10.webp"); /* Use the correct file name */ */
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
    font-family: Arial, sans-serif;
  }

 
 
 
 body {
    font-family: Arial, sans-serif;
    background-color:#F2EDEA;
    color:#BEAD96;
    }
    #header{
    color:black;
    
    
    }
    #second{
    margin-bottom:50px;
    }
.form-container {
    width: 350px;
    margin: auto;
    background: white;
    padding: 20px;
    padding-right: 40px;
    border-radius: 10px;
    box-shadow: 0 0 10px #ccc;
}

input, textarea {
    width: 100%;
    margin: 8px 0;
    padding: 8px;
}
input[type=submit] {
    background-color: black;
    color: white;
    border: none;
    cursor: pointer;
}
input[type=submit]:hover {
    background-color: black;
}
.stats {
    display: flex;
    justify-content: space-between;
    margin-bottom: 30px;
}

.stat {
    background-color: #f5f5f5;
    padding: 20px;
    text-align: center;
    border-radius: 8px;
    width: 22%;
}

.stat h3 {
    margin-bottom: 10px;
    color:black;
}

  img{
  width:100%;
  height:100%;
  }  
#last{
margin-top:100px;
}
</style>


</head>
<body>

<div>
<!-- <img src="images/img3.jpg" alt="Logo"/> -->

</div>

<div id="header">
<h1 align="center" >Contact Us</h1>
</div>



<div><h2 align="center">Let's get in touch</h2>

<div id="second" align="center">We are open for any suggestion or just to have a chat</div>
</div>

 <section class="stats">
                <div class="stat">
                    <h3>Our Address </h3>
                    <p>Address : 101/1 Old Road, Ambathale, SriLanka</p>
                </div>
                <div class="stat">
                    <h3>Call Us</h3>
                    <p>+94 777 070 070</p>
                </div>
                <div class="stat">
                    <h3>Email Us</h3>
                    <p>jazzeventbooking@gmail.com</p>
                </div>
                <div class="stat">
                    <h3>Follow Us on Instagram</h3>
                    <p>jazz_eventhere</p>
                </div>
            </section>


<div align="center">
<h2 align="center">FOR INQUIRIES</h2>
<div class="form-container">
<form action="ContactServlet" method="post" >
        <label>Name:</label>
        <input type="text" name="name" id="name" required>
		
        <label>Email:</label>
        <input type="email" name="email" id="email" required>
		<br><br>
        <label>Message:</label>
        <textarea name="message" id="message" rows="5" required></textarea>
		<br><br>
        <input type="submit" value="Send Message">
    </form>
</div>
</div>
<div id="last" align="center">
<p style="color: black;">STAY SOCIAL</p>
<h2>Follow Us on Instagram</h2>
<br><br>
</div>
</body>
</html>