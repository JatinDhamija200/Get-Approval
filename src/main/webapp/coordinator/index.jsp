
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
<title>Coordinator Home</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<c:if test="${empty coordinatorObj }">
		<c:redirect url="../coordinator_login.jsp"></c:redirect>
	</c:if>
	<%@include file="navbar.jsp"%>
	<div class="container p-5">
		<p class="text-center fs-3">Coordinator Dashboard</p>
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
			<div class="col-md-4 offset-md-2">
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
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="text-center fs-4">
							NOC <br>
							<%=dao.countnoc()%>
						</p>
					</div>
				</div>
			</div>
		</div>
</body>
</html>