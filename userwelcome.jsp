<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
HttpSession httpSession = request.getSession();
if (httpSession == null || httpSession.getAttribute("user") == null) {
	response.sendRedirect("login.jsp");
	return;

}

String user = (String) httpSession.getAttribute("user");
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet">
<title>Bootstrap Example</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


<!-- Example Code -->


<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<title>Ministore</title>

					<style>
.profile-icon {
	display: inline-block;
	font-size: 1.5em; /* Adjust size as needed */
}

        .card-img-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 200px; /* Ensure this matches the height of the image */
            overflow: hidden;
        }

        .card-img-container img {
            max-width: 100%;
            max-height: 100%;
            object-fit: cover;
        }
    </style><!-- Bootstrap CSS -->
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Ministore</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav">

					<li class="nav-item"><a class="nav-link" href="#"> Home</a></li>

					<li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
					<li class="nav-item"><a class="nav-link" href="#">My
							Orders</a></li>
				</ul>
				<ul class="navbar-nav ms-auto">


					<li class="nav-item dropdown"><a class="nav-link" href="#"
						id="navbarDropdown" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
							<div class="profile-icon">
								<i class="fas fa-user-circle"></i>
							</div>
					</a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdown">
							<span class="dropdown-item-text"><b><%=user%></b></span> <a
								class="dropdown-item" href="#">Edit Profile</a> <a
								class="dropdown-item" href="logout.jsp">Logout</a>
						</div></li>


				</ul>



			</div>
		</div>
	</nav>


 <div class="container">
        <div class="row">
            <%
                // Database connection parameters
                String url = "jdbc:mysql://localhost:3306/ministore";
                String username = "root";
                String password = "";
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    // Load the JDBC driver
                    Class.forName("com.mysql.jdbc.Driver");

                    // Establish the connection
                    conn = DriverManager.getConnection(url, username, password);

                    // Create a statement
                    stmt = conn.createStatement();

                    // Execute the query
                    String sql = "SELECT name, price, size, colour, storage, ram, image_url FROM products";
                    rs = stmt.executeQuery(sql);

                    // Iterate through the result set and display the data
                    while (rs.next()) {
                        String name = rs.getString("name");
                        double price = rs.getDouble("price");
                        String size = rs.getString("size");
                        String colour = rs.getString("colour");
                        String storage = rs.getString("storage");
                        String ram = rs.getString("ram");
                        String image = rs.getString("image_url");

            %>
          <div class="col-md-4">
    <div class="card mb-4 shadow-sm bg-light">
        <div class="card-img-container">
            <img alt="<%= name %>" src="<%= image %>">
        </div>
        <div class="card-body">
            <h5 class="card-title"><%= name %></h5>
            <p class="card-text">
                <strong>Price:</strong> $<%= price %><br>
                <strong>Size:</strong> <%= size %><br>
            </p>
        </div>
    </div>
</div>

            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    // Close the resources
                    if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                    if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                    if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
                }
            %>
        </div>
    </div>





	<!-- Bootstrap JS and dependencies -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/js/bootstrap.min.js"></script>
</body>
</html>



<!-- End Example Code -->
</body>
</html>