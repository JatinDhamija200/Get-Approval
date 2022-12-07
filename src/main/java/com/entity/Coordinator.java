package com.entity;

public class Coordinator {
	private int id;
	private String fullName;
	private String department;
	private String deptId;
	private String phoneNo;
	private String email;
	private String password;

	public Coordinator(String fullName, String department, String deptId, String phoneNo, String email,
			String password) {
		super();
		this.fullName = fullName;
		this.department = department;
		this.deptId = deptId;
		this.phoneNo = phoneNo;
		this.email = email;
		this.password = password;
	}

	public Coordinator() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
