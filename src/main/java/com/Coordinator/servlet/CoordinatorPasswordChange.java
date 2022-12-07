package com.Coordinator.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Db.DbConnect;
import com.dao.CoordinatorDao;
import com.dao.StudentDao;
@WebServlet("/CoorChangePassword")
public class CoordinatorPasswordChange extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int cid = Integer.parseInt(req.getParameter("cid"));
		String oldPassword = req.getParameter("oldPassword");
		String newPassword = req.getParameter("newPassword");
		CoordinatorDao dao = new CoordinatorDao(DbConnect.getConn());
		HttpSession session = req.getSession();
		if (dao.checkOldPassword(cid, oldPassword)) {
			if(dao.changePassword(cid, newPassword)) {
				session.setAttribute("success", "Password Change Sucessfully");
				resp.sendRedirect("coordinator/editProfile.jsp");
			}else {
				session.setAttribute("error", "Server Error");
				resp.sendRedirect("coordinator/editProfile.jsp");
			}
		} else {
			session.setAttribute("error", "Old Password Incorrect");
			resp.sendRedirect("coordinator/editProfile.jsp");
		}
	}
}
