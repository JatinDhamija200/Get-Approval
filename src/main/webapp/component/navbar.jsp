<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"> <img
			src="data:image/png;base64,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"
			alt="Girl in a jacket" width="50px" height="50px"> Get Approval
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">


				<c:if test="${empty studentObj }">

					<div class="dropdown">
						<button class="btn btn-success dropdown-toggle" type="button"
							id="dropdownMenuButton1" data-bs-toggle="dropdown"
							aria-expanded="false">Login</button>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
							<li><a class="dropdown-item" href="admin_login.jsp">Admin</a></li>
							<li><a class="dropdown-item" href="coordinator_login.jsp">Coordinator</a></li>
							<li><a class="dropdown-item" href="student_login.jsp">Student</a></li>
						</ul>
					</div>

				</c:if>


				<c:if test="${not empty studentObj }">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="student_noc.jsp">NOC</a></li>

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="view_noc.jsp"> View NOC</a></li>

					<div class="dropdown">
						<button class="btn btn-success dropdown-toggle" type="button"
							id="dropdownMenuButton1" data-bs-toggle="dropdown"
							aria-expanded="false">
							<i class="fa-solid fa-circle-user"></i> ${studentObj.fullName }
						</button>

						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
							<li><a class="dropdown-item" href="change_password.jsp">Change
									Password</a></li>
							<li><a class="dropdown-item" href="StudentLogout">Logout</a></li>
						</ul>

					</div>
				</c:if>
			</ul>
		</div>
	</div>
</nav>