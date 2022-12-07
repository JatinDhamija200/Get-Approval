package com.student.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.StudentDao;
import com.Db.DbConnect;
import com.entity.Student;

@WebServlet("/Student_register")
public class StudentRegister extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String fullName = req.getParameter("fullName");
			String roll_no = req.getParameter("roll_no");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			Student s = new Student(fullName, roll_no, email, password);
			StudentDao dao = new StudentDao(DbConnect.getConn());
			HttpSession session =  req.getSession();
			if (dao.Register(s)) {
				session.setAttribute("success" , "Register Sucessfully");
				resp.sendRedirect("signup.jsp");
				//System.out.println("Data Insert Successfully");
			} else {
				session.setAttribute("error" , "Server Error");
				resp.sendRedirect("signup.jsp");
				//System.out.println("Server Error");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
