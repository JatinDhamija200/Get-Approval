package com.entity;

public class Courses {
	private int id;
	private String courseName;

	public Courses(int id, String courseName) {
		super();
		this.id = id;
		this.courseName = courseName;
	}

	public Courses() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

}
