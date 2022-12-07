<%@page import="com.Db.DbConnect"%>
<%@page import="com.dao.CoordinatorDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Home</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty adminObj }">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>

	<!-- ...........Main......... -->
	<div class="container p-5">
		<p class="text-center fs-3">Admin Dashboard</p>
		<c:if test="${not empty success}">
			<p class="text-center text-success fs-3">${success }</p>
			<c:remove var="success" scope="session" />
		</c:if>
		<c:if test="${not empty error}">
			<p class="text-center text-danger fs-5">${error}</p>
			<c:remove var="error" scope="session" />
		</c:if>
		<%
		CoordinatorDao dao = new CoordinatorDao(DbConnect.getConn());
		%> 
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="text-center fs-4">
							Coordinator <br>
							<%=dao.countcoordinator()%>
						</p>
					</div>
				</div>
			</div>


			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-circle fa-3x"></i><br>
						<p class="text-center fs-4">
							Student <br>
							<%=dao.countstudent()%> 
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="text-center fs-4">
							NOC <br>
							<%=dao.countnoc()%> 
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4 mt-3">
				<div class="card paint-card" data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<div class="card-body text-center text-success">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="text-center fs-4">
							Courses <br>
							<%=dao.countcourses()%> 
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4 mt-3">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="text-center fs-4">
							Company <br>
							<%=dao.countcompany()%>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- .....................Modal......................... -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<form action="../addCourse" method="post">
						<div class="form-goup">
							<div class="text-center fs-4">
								<label> Enter Course</label><input type="text" name="courseName"
									class="form-control">
							</div>
						</div>
						<div class="text-center mt-3">
							<button type="submit" class="btn btn-primary">Add</button>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>