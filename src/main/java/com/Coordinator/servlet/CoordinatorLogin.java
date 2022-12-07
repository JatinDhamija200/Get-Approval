package com.Coordinator.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.Coordinator;
import com.dao.CoordinatorDao;
import com.dao.StudentDao;
import com.Db.DbConnect;
import com.entity.Student;
@WebServlet("/CoordinatorLogin")
public class CoordinatorLogin extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			HttpSession session = req.getSession();
			CoordinatorDao dao =new CoordinatorDao(DbConnect.getConn());
			Coordinator coordinator =  dao.login(email, password);
			if (coordinator != null) {
				session.setAttribute("coordinatorObj", coordinator);
				resp.sendRedirect("coordinator/index.jsp");
			}
			else {
				session.setAttribute("error", "Invalid Email & Password");
				resp.sendRedirect("coordinator_login.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
