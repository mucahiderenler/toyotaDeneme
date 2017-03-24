package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="USERS")
public class User {

	@Id
	@Column(name="username")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String username;
	
	private String password;
	private String auth;
	private String seyehatBilgi;
	
	@ManyToOne
	@JoinColumn(name="username", nullable=false , insertable=false, updatable = false)
	private Travel travel1;
	
	public User(){
		
	}
	
	public User(String username, String auth, String seyehatBilgi){
		this.auth = auth;
		this.username = username;
		this.seyehatBilgi = seyehatBilgi;
	}
	
	public Travel getTravel1(){
		return this.travel1;
	}
	
	public void setTravel1(Travel travel1){
		this.travel1 = travel1;
	}

	/*public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}*/

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getAuth() {
		return this.auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}
	
	public String getSeyehatBilgi() {
		return this.seyehatBilgi;
	}

	public void setSeyehatBilgi(String seyehatBilgi) {
		this.seyehatBilgi = seyehatBilgi;
	}	
	
}