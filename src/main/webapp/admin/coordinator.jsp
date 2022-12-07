<%@page import="com.entity.Coordinator"%>
<%@page import="com.dao.CoordinatorDao"%>
<%@page import="com.entity.Courses"%>
<%@page import="java.util.List"%>
<%@page import="com.Db.DbConnect"%>
<%@page import="com.dao.CourseDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Coordinator</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Add Coordinator</p>

						<c:if test="${not empty success}">
							<p class="text-center text-success fs-5">${success }</p>
							<c:remove var="success" scope="session" />
						</c:if>
						<c:if test="${not empty error}">
							<p class="text-center text-danger fs-5">${error}</p>
							<c:remove var="error" scope="session" />
						</c:if>

						<form action="../addCoordinator" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name </label> <input type="text"
									required name="fullName" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Department</label> <select
									name="department" required class="form-contol">

									<option>--Select--</option>
									<%
									CourseDao dao = new CourseDao(DbConnect.getConn());
									List<Courses> list = dao.getAllCourse();
									for (Courses s : list) {
									%>
									<option>
										<%=s.getCourseName()%>
									</option>
									<%
									}
									%>
								</select>
							</div>
							<div class="mb-3">
								<label class="form-label">Dept_ID</label> <input type="text"
									required name="deptId" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Phone No.</label> <input type="text"
									required name="phoneNo" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Email</label> <input type="email"
									required name="email" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input
									type="password" required name="password" class="form-control">
							</div>

							<button type="submit" class="btn btn-primary ">Submit</button>
						</form>
					</div>
				</div>
			</div>
			<div class=" col-md-8 ">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Coordintor Details</p>
						<c:if test="${not empty Success}">
							<p class="text-center text-success fs-5">${Success }</p>
							<c:remove var="Success" scope="session" />
						</c:if>
						<c:if test="${not empty Error}">
							<p class="text-center text-danger fs-5">${Error}</p>
							<c:remove var="Error" scope="session" />
						</c:if>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Department</th>
									<th scope="col">DeptID</th>
									<th scope="col">Phone No.</th>
									<th scope="col">Email</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								CoordinatorDao dao2 = new CoordinatorDao(DbConnect.getConn());
								List<Coordinator> list2 = dao2.getAllCoordinators();
								for (Coordinator d : list2) {
								%>
								<tr>
									<td><%=d.getFullName()%></td>
									<td><%=d.getDepartment()%></td>
									<td><%=d.getDeptId()%></td>
									<td><%=d.getPhoneNo()%></td>
									<td><%=d.getEmail()%></td>
									<td><a href="../deleteCoordinator?id=<%=d.getId()%>"
										class="btn btn-sm btn-danger">Delete</a></td>
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
</body>
</html>