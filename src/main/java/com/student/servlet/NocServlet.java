package com.student.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.Db.DbConnect;
import com.dao.NocDao;
import com.entity.NOC;

@WebServlet("/add_NOC")
@MultipartConfig
public class NocServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Part p = req.getPart("letter");
		int studentid = Integer.parseInt(req.getParameter("studentid"));
		String fullname = req.getParameter("fullName");
		String rollNo = req.getParameter("rollNo");
		String branch = req.getParameter("branch");
		int coordinator_id = Integer.parseInt(req.getParameter("coordinator_id"));
		String company = req.getParameter("company");
		String duration = req.getParameter("duration");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		
		String letter = p.getSubmittedFileName();

		NOC noc = new NOC(studentid, fullname, rollNo, branch, coordinator_id, company, duration, email, phone, letter,
				"Pending");
		NocDao dao = new NocDao(DbConnect.getConn());
		HttpSession session = req.getSession();
		if (dao.addNOC(noc)) {
			String path = getServletContext().getRealPath("")+ "imgs";
			File file = new File(path);
			p.write(path + File.separator + letter);
			
			session.setAttribute("success", "NOC Succesfully Added");
			resp.sendRedirect("student_noc.jsp");
		} else {
			session.setAttribute("error", "Server Error");
			resp.sendRedirect("student_noc.jsp");
		}
	}

}