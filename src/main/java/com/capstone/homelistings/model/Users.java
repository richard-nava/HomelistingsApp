package com.capstone.homelistings.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.data.annotation.Transient;

@Entity
@Table(name="users")
public class Users {
	
	@Id
	@Column
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@Column(name="last_name")
	private String lname;
	
	@Column(name="first_name")
	private String fname;
	
	@Column(name="password")
	private String password;
	
	@Column(name="email")
	private String email;
	private String address;
	private String city;
	private String state;
	private String phone;
	private String role;
	private String image;
	
	@Transient
	private String password2; 
	
	
	
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}


	
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getPassword2() {
		return password2;
	}
	public void setPassword2(String password2) {
		this.password2 = password2;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	@Override
	public String toString() {
		return "Users [id=" + id + ", lname=" + lname + ", fname=" + fname + ", password=" + password + ", email="
				+ email + ", address=" + address + ", city=" + city + ", state=" + state + ", phone=" + phone
				+ ", role=" + role + ", image=" + image + ", password2=" + password2 + "]";
	}
	

	
	
	
	
	
	
	


}
