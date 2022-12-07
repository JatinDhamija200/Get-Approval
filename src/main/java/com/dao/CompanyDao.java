package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Company;
import com.entity.Courses;

public class CompanyDao {
	private Connection conn;

	public CompanyDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addCompany(String Company) {
		boolean f = false;
		try {
			String sql = "insert into companylist(companyName) values(?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, Company);

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
	public List<Company> getAllCompany() {
		List<Company> list = new ArrayList<Company>();
		Company s = null;
		try {
			String sql = "select * from companylist";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				s = new Company();
				s.setId(1);
				s.setCompanyName(rs.getString(2));
				list.add(s);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

}
