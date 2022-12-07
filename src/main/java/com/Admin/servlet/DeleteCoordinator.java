package com.Admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CoordinatorDao;
import com.Db.DbConnect;
@WebServlet("/deleteCoordinator")
public class DeleteCoordinator extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		CoordinatorDao dao = new CoordinatorDao(DbConnect.getConn());
		HttpSession session = req.getSession();
		if(dao.deleteCoordinator(id)) {
			session.setAttribute("Success", "Coordinator Delete Successfully");
			resp.sendRedirect("admin/coordinator.jsp");
		}else {
			session.setAttribute("Error", "Server Error");
			resp.sendRedirect("admin/coordinator.jsp");
		}
	}

}