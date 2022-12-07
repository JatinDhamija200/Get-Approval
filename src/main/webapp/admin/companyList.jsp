
<%@page import="com.entity.Company"%>
<%@page import="com.dao.CompanyDao"%>
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
<title>Add Company</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="../admin/navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-3 offset-md-2">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Add Company</p>
						<c:if test="${not empty success}">
							<p class="text-center text-success fs-5">${success }</p>
							<c:remove var="success" scope="session" />
						</c:if>
						<c:if test="${not empty error}">
							<p class="text-center text-danger fs-5">${error}</p>
							<c:remove var="error" scope="session" />
						</c:if>
						<form action="../addCompany" method="post">
							<div class="mb-3">
								<label class="form-label">Add Company </label> <input
									type="text" required name="companyName" class="form-control">
							</div>
							<button type="submit" class="btn btn-primary ">Submit</button>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-3 offset-md-2">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Listed Company</p>
						<c:if test="${not empty success}">
							<p class="text-center text-success fs-5">${success }</p>
							<c:remove var="success" scope="session" />
						</c:if>
						<c:if test="${not empty error}">
							<p class="text-center text-danger fs-5">${error}</p>
							<c:remove var="error" scope="session" />
						</c:if>
						<table class="table table-success table-striped">
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
</body>
</html>