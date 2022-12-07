package com.entity;

public class Student {
	private int id;
	private String fullName;
	private String rollno;
	private String email;
	private String password;
	

	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Student(String fullName, String rollno, String email, String password) {
		super();
		this.fullName = fullName;
		this.rollno = rollno;
		this.email = email;
		this.password = password;
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

	public String getRollno() {
		return rollno;
	}

	public void setRollno(String rollno) {
		this.rollno = rollno;
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
