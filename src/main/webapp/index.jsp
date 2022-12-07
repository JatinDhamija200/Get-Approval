<%@page import="com.entity.Company"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.CompanyDao"%>
<%@page import="com.Db.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	
	<%-- <%
	Connection conn = DbConnect.getConn();
	out.print(conn);
	%>  --%>
	
	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-9 ">
				<div class="card paint-card">
					<div class="card-body">
						<!-- .............................Carousel....................... -->
						<div id="carouselExampleIndicators" class="carousel slide"
							data-bs-ride="carousel">
							<div class="carousel-indicators">
								<button type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide-to="0" class="active" aria-current="true"
									aria-label="Slide 1"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide-to="1" aria-label="Slide 2"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide-to="2" aria-label="Slide 3"></button>
							</div>
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img src="img/img1.jpeg" class="d-block w-100" alt="..."
										height="500px">
								</div>
								<div class="carousel-item">
									<img src="img/img2.jpg" class="d-block w-100" alt="..."
										height="500px">
								</div>
								<div class="carousel-item">
									<img src="img/img3.jpg" class="d-block w-100" alt="..."
										height="500px">
								</div>
							</div>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
					</div>
				</div>
			</div>
			
			<!-- ................Listed Company............... -->
			<div class=" col-md-3 ">
				<div class="card paint-card">
					<div class="card-body">
						<table class="table table-success table-striped">
							<thead>
								<tr>
									<th scope="col" class="text-center">Listed Company</th>

								</tr>
							</thead>
							<tbody>
								<%
								CompanyDao dao = new CompanyDao(DbConnect.getConn());
								List<Company> list = dao.getAllCompany();
								for (Company noc : list) {
								%>
								<tr>
									<td class="text-center"><%=noc.getCompanyName()%></td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<hr>
	<!-- ............Footer............. -->
	<%@include file="component/footer.jsp"%>
</body>
</html>