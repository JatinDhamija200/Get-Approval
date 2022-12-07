package com.Admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.Coordinator;
import com.dao.CoordinatorDao;
import com.Db.DbConnect;

@WebServlet("/updateCoordinator")
public class UpdateCoordinator extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String fullName = req.getParameter("fullName");
			String department = req.getParameter("department");
			String deptId = req.getParameter("deptId");
			String phoneNo = req.getParameter("phoneNo");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			int id = Integer.parseInt(req.getParameter("id"));
			Coordinator d = new Coordinator(fullName, department, deptId, phoneNo, email, password);
			CoordinatorDao dao = new CoordinatorDao(DbConnect.getConn());
			HttpSession session = req.getSession();
			if (dao.updateCoordinator(d)) {
				session.setAttribute("success", "Coordinator Update Successfully");
				resp.sendRedirect("admin/coordinator.jsp");
			} else {
				session.setAttribute("error", "Server Error");
				resp.sendRedirect("admin/coordinator.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}