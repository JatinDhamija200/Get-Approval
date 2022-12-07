package com.Admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Db.DbConnect;
import com.dao.CourseDao;
import com.entity.Student;

@WebServlet("/addCourse")
public class AddCourse extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String coursename = req.getParameter("courseName");
		CourseDao dao = new CourseDao(DbConnect.getConn());
		boolean f = dao.addCourses(coursename);
		HttpSession session = req.getSession();
		if (f) {
			session.setAttribute("success", "Course Added");
			resp.sendRedirect("admin/index.jsp");
		}
		else {
			session.setAttribute("error", "Server Error");
			resp.sendRedirect("admin/index.jsp");
		}
	}

}