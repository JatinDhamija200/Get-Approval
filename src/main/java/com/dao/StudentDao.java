package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.Student;

public class StudentDao {
	private Connection conn;

	public StudentDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean Register(Student s) {
		boolean f = false;
		try {
			String sql = "insert into student_details(fullName, rollNo, email, password) values(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, s.getFullName());
			ps.setString(2, s.getRollno());
			ps.setString(3, s.getEmail());
			ps.setString(4, s.getPassword());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

	public Student login(String em, String psw) {
		Student s = null;
		try {
			String sql = "select * from student_details where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, em);
			ps.setString(2, psw);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				s = new Student();
				s.setId(rs.getInt(1));
				s.setFullName(rs.getString(2));
				s.setRollno(rs.getString(3));
				s.setEmail(rs.getString(4));
				s.setPassword(rs.getString(5));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return s;
	}

}
