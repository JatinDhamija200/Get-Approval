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
<title>Courses</title>
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
			<div class=" col-md-2 offset-md-5">
				<div class="card paint-card">
					<div class="card-body">
						<table class="table table-success table-striped">
							<thead>
								<tr>
									<th scope="col" class="text-center">Department</th>

								</tr>
							</thead>
							<tbody class="text-center">
								<%
								CourseDao dao = new CourseDao(DbConnect.getConn());
								List<Courses> list = dao.getAllCourse();
								for (Courses noc : list) {
								%>
								<tr>
								<td><%=noc.getCourseName() %></td>
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