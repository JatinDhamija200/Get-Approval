package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Courses;

public class CourseDao {

	private Connection conn;

	public CourseDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addCourses(String course) {
		boolean f = false;
		try {
			String sql = "insert into courses(courseName) values(?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, course);

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

	public List<Courses> getAllCourse() {
		List<Courses> list = new ArrayList<Courses>();
		Courses s = null;
		try {
			String sql = "select * from courses";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				s = new Courses();
				s.setId(1);
				s.setCourseName(rs.getString(2));
				list.add(s);
			}
		} catch (Exception e) { // TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
}
