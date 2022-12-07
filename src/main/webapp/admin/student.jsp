
<%@page import="com.entity.NOC"%>
<%@page import="com.entity.Coordinator"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.CoordinatorDao"%>
<%@page import="com.Db.DbConnect"%>
<%@page import="com.dao.NocDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin | Student Details</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="col-md-12">
		<div class="card paint-card">
			<div class="card-body">
				<p class="fs-3 text-center">Student Details</p>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Full Name</th>
							<th scope="col">Roll No.</th>
							<th scope="col">Branch</th>
							<th scope="col">Coordinator</th>
							<th scope="col">Company</th>
							<th scope="col">Duration</th>
							<th scope="col">Email</th>
							<th scope="col">Phone</th>
							<th scope="col">Letter</th>
							<th scope="col">Status</th>
						</tr>
					</thead>
					<tbody>
						<%
						NocDao dao = new NocDao(DbConnect.getConn());
						CoordinatorDao dao2 = new CoordinatorDao(DbConnect.getConn());
						List<NOC> list = dao.getAllNoc();
						for (NOC noc : list) {
							Coordinator d = dao2.getCoordinatorsByID(noc.getCoordinator_id());
						%>
						<tr>
							<th><%=noc.getFullName()%></th>
							<td><%=noc.getRoll_no()%></td>
							<td><%=noc.getBranch()%></td>
							<td><%=d.getFullName()%></td>
							<td><%=noc.getCompany()%></td>
							<td><%=noc.getDuration()%></td>
							<td><%=noc.getEmail()%></td>
							<td><%=noc.getPhone()%></td>
							<td><%=noc.getLetter()%></td>
							<td><%=noc.getStatus()%></td>
						</tr>
						<%
						}
						%>

					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>