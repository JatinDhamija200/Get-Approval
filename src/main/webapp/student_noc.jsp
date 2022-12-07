<%@page import="com.entity.Company"%>
<%@page import="com.dao.CompanyDao"%>
<%@page import="com.entity.Courses"%>
<%@page import="com.dao.CourseDao"%>
<%@page import="com.entity.Coordinator"%>
<%@page import="java.util.List"%>
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
<title>Student NOC</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("img/img2.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 ">
				<img alt="" src="img/img4.jpg" width="550" height="390">
			</div>
			<div class="col-md-6 ">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-3">Student NOC</p>
						
						<c:if test="${not empty success}">
							<p class="text-center text-success fs-5">${success }</p>
							<c:remove var="success" scope="session" />
						</c:if>
						<c:if test="${not empty error}">
							<p class="text-center text-danger fs-5">${error}</p>
							<c:remove var="error" scope="session" />
						</c:if>
						
						<form class="row g-3" action="add_NOC" method="post" enctype="multipart/form-data">
							<input type="hidden" name="studentid" value="${studentObj.id }">

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Full Name</label> <input
									required type="text" class="form-control" name="fullName">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Roll_No</label> <input
									required type="number" class="form-control" name="rollNo">
							</div>
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Branch</label> <select
									required class="form-control" name="branch">
									<option value="">--select--</option>
									<%
									CourseDao dao1 = new CourseDao(DbConnect.getConn());
									List<Courses> list1 = dao1.getAllCourse();
									for (Courses d : list1) {
									%>
									<option><%=d.getCourseName()%>
									</option>
									<%
									}
									%>
								</select>
							</div>
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Coordinator</label>
								<select required class="form-control" name="coordinator_id">
									<option value="">--select--</option>
									<%
									CoordinatorDao dao = new CoordinatorDao(DbConnect.getConn());
									List<Coordinator> list = dao.getAllCoordinators();
									for (Coordinator d : list) {
									%>
									<option value="<%=d.getId()%>"><%=d.getFullName()%>(<%=d.getDepartment()%>)
									</option>
									<%
									}
									%>
								</select>
							</div>
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Company</label> <select
									required class="form-control" name="company">
									<option value="">--select--</option>
									<%
									CompanyDao dao3 = new CompanyDao(DbConnect.getConn());
									List<Company> list3 = dao3.getAllCompany();
									for (Company d : list3) {
									%>
									<option><%=d.getCompanyName()%>
									</option>
									<%
									}
									%>
								</select>
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Duration(in
									Month)</label> <input required type="text" class="form-control"
									name="duration">
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Email</label> <input
									required type="email" class="form-control" name="email">
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Phone No</label> <input
									maxlength="10" required type="number" class="form-control"
									name="phone">
							</div>
							<div class="col-md-6">
								<label>Letter(in pdf)</label> <input type="file" name="letter"
									class="form-control">
							</div>
							<button class="col-md-6 offset-md-3 btn btn-success">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="component/footer.jsp"%>
</body>
</html>