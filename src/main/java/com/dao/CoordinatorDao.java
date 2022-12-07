package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Coordinator;

public class CoordinatorDao {
	private Connection conn;

	public CoordinatorDao(Connection conn) {
		super();
		this.conn = conn;
	}
	public boolean registerCoordinator(Coordinator d) {
		boolean f = false;
		try {
			String sql = "insert into coordinator(fullName, department, deptId, phoneNo, email, password) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, d.getFullName());
			ps.setString(2, d.getDepartment());
			ps.setString(3, d.getDeptId());
			ps.setString(4, d.getPhoneNo());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getPassword());
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
	public List<Coordinator> getAllCoordinators() {
		List<Coordinator> list = new ArrayList<Coordinator>();
		Coordinator d = null;
		try {
			String sql = "select * from coordinator order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				d = new Coordinator();
				d.setId(rs.getInt(1));
				d.setFullName(rs.getString(2));
				d.setDepartment(rs.getString(3));
				d.setDeptId(rs.getString(4));
				d.setPhoneNo(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setPassword(rs.getString(7));
				list.add(d);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	public Coordinator getCoordinatorsByID(int id) {
		Coordinator d = null;
		try {
			String sql = "select * from coordinator where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				d = new Coordinator();
				d.setId(rs.getInt(1));
				d.setFullName(rs.getString(2));
				d.setDepartment(rs.getString(3));
				d.setDeptId(rs.getString(4));
				d.setPhoneNo(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setPassword(rs.getString(7));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return d;
	}
	public boolean updateCoordinator(Coordinator d) {
		boolean f = false;
		try {
			String sql = "update coordinator set fullname=?, department=?, deptId=?, phoneNo=?, email=?, password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, d.getFullName());
			ps.setString(2, d.getDepartment());
			ps.setString(3, d.getDeptId());
			ps.setString(4, d.getPhoneNo());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getPassword());
			ps.setInt(7, d.getId());
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
	public boolean deleteCoordinator(int id) {
		boolean f = false;
		try {
			String sql = "delete from coordinator where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
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
	public Coordinator login(String email, String psw) {
		Coordinator d = null;
		try {
			String sql = "select * from coordinator where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, psw);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				d = new Coordinator();
				d.setId(rs.getInt(1));
				d.setFullName(rs.getString(2));
				d.setDepartment(rs.getString(3));
				d.setDeptId(rs.getString(4));
				d.setPhoneNo(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setPassword(rs.getString(7));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return d;
	}
	public int countcoordinator() {
		int i = 0;
		try {
			String sql = "select * from coordinator";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return i;
	}
	public int countcompany() {
		int i = 0;
		try {
			String sql = "select * from companylist";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return i;
	}

	public int countstudent() {
		int i = 0;
		try {
			String sql = "select * from student_details";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return i;
	}

	public int countcourses() {
		int i = 0;
		try {
			String sql = "select * from courses";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return i;
	}

	public int countnoc() {
		int i = 0;
		try {
			String sql = "select * from noc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return i;
	}

	public int countnocByCoordinatorid(int cid) {
		int i = 0;
		try {
			String sql = "select * from noc where coordinatorid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, cid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return i;
	}

	public int countCompany(int comid) {
		int i = 0;
		try {
			String sql = "select * from noc where companylist=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, comid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return i;
	}
	public boolean checkOldPassword(int coordinatorId, String oldPassword) {
		boolean f = false;
		try {
			String sql = "select * from coordinator where id=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, coordinatorId);
			ps.setString(2, oldPassword);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return f;
	}

	public boolean changePassword(int coordinatorId, String newPassword) {
		boolean f = false;
		try {
			String sql = "update coordinator set password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, newPassword);
			ps.setInt(2, coordinatorId);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return f;
	}

	public boolean editCoordinatorProfile(Coordinator d) {
		boolean f = false;
		try {
			String sql = "update coordinator set fullname=?, department=?, deptId=?, phoneNo=?, email=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, d.getFullName());
			ps.setString(2, d.getDepartment());
			ps.setString(3, d.getDeptId());
			ps.setString(4, d.getPhoneNo());
			ps.setString(5, d.getEmail());
			ps.setInt(6, d.getId());
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
}
