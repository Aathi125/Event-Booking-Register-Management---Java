<!-- Custom Navigation Style -->
<style>
  nav.navbar {
    background-color: #000;
    padding: 20px 0;
    box-shadow: 0 2px 6px rgba(255, 102, 0, 0.3);
  }

  .navbar .container {
    display: flex;
    align-items: center;
    justify-content: space-between;
  }

  .navbar .logo img {
    width: 140px;
    height: auto;
  }

  .navbar-brand {
    color: #ff6600 !important;
    font-size: 1.5rem;
    font-weight: bold;
    margin-left: 15px;
    transition: color 0.3s ease;
  }

  .navbar-brand:hover {
    color: #ffaa33 !important;
  }

  .navbar-nav {
    display: flex;
    gap: 20px;
    align-items: center;
  }

  .navbar-nav .nav-item {
    position: relative;
  }

  .navbar-nav .nav-link {
    color: #fff !important;
    font-weight: 600;
    font-size: 1rem;
    position: relative;
    padding: 8px 12px;
    transition: color 0.3s ease;
  }

  .navbar-nav .nav-link::before {
    content: "";
    position: absolute;
    width: 0%;
    height: 3px;
    background-color: #ff6600;
    bottom: 0;
    left: 0;
    transition: all 0.3s ease-in-out;
  }

  .navbar-nav .nav-link:hover::before {
    width: 100%;
  }

  .navbar-nav .nav-link:hover {
    color: #ff6600 !important;
  }

  .navbar-toggler {
    background-color: #ff6600;
    border: none;
  }

  .navbar-toggler-icon {
    background-image: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgba%28255, 255, 255, 1%29' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E");
  }

  @media (max-width: 768px) {
    .navbar-nav {
      flex-direction: column;
      background: #111;
      padding: 15px;
      border-radius: 10px;
    }

    .navbar-nav .nav-item {
      width: 100%;
      text-align: left;
    }

    .navbar .container {
      flex-direction: column;
    }
  }
</style>

<!-- Navigation HTML -->
<nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container">
    <div class="logo">
      <img src="images/logo.png" alt="Logo">
    </div>
    <a class="navbar-brand" href="EventIndex.jsp">JAZZ Event Booking</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse"
      data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
      aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active"><a class="nav-link" href="EventIndex.jsp">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="Contact.jsp">Contact Us</a></li>
 		<li class="nav-item"><a class="nav-link" href="about.jsp">FAQ</a></li>
        <% if (auth != null) { %>
        <li class="nav-item"><a class="nav-link" href="profile.jsp"><i class="fa fa-user"></i> Profile</a></li>
        <li class="nav-item"><a class="nav-link" href="log-out">Logout</a></li>
        <% } else { %>
        <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
        <% } %>

      </ul>
    </div>
  </div>
</nav>