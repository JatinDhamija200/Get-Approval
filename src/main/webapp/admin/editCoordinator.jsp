
<%@page import="com.entity.Courses"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.CourseDao"%>
<%@page import="com.entity.Coordinator"%>
<%@page import="com.Db.DbConnect"%>
<%@page import="com.dao.CoordinatorDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Coordinator</title>
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
			<div class="col-md-4 offset-md-4 ">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Edit Coordinator Details</p>
						
						<c:if test="${not empty success}">
							<p class="text-center text-success fs-5">${success }</p>
							<c:remove var="success" scope="session" />
						</c:if>
						<c:if test="${not empty error}">
							<p class="text-center text-danger fs-5">${error}</p>
							<c:remove var="error" scope="session" />
						</c:if>
						
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						CoordinatorDao dao2 = new CoordinatorDao(DbConnect.getConn());
						Coordinator d = dao2.getCoordinatorsByID(id);
						%>
						
						<form action="../updateCoordinator" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name </label> <input type="text"
									required name="fullname" class="form-control"
									value="<%=d.getFullName()%>">
							</div>
							<div class="mb-3">
								<label class="form-label">Department</label> <select name="dept"
									required class="form-contol">

									<option><%=d.getDepartment()%></option>
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
									required name="deptId" class="form-control"
									value="<%=d.getDeptId()%>">
							</div>
							<div class="mb-3">
								<label class="form-label">Phone No.</label> <input type="text"
									required name="phone" class="form-control"
									value="<%=d.getPhoneNo()%>">
							</div>
							<div class="mb-3">
								<label class="form-label">Email</label> <input type="email"
									required name="email" class="form-control"
									value="<%=d.getEmail()%>">
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input type="text"
									required name="password" class="form-control"
									value="<%=d.getPassword()%>">
							</div>
							<input type="hidden" name="id" value="<%=d.getId()%>">
							<button type="submit" class="btn btn-primary col-md-12">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>