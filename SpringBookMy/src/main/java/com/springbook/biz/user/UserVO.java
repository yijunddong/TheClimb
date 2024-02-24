package com.springbook.biz.user;

import java.sql.Date;

public class UserVO {
	private int no;
    private String id;
    private String username;
    private String password;
    private String password2;
    private String phoneNumber;
    private String birthday;
    private String address;
    private String email;
    
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "UserVO [no=" + no + ", id=" + id + ", username=" + username + ", password=" + password + ", password2="
				+ password2 + ", phoneNumber=" + phoneNumber + ", birthday=" + birthday + ", address=" + address + "]";
	}

}
