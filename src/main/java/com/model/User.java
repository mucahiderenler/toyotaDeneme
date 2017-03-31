package com.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


import org.hibernate.validator.constraints.NotEmpty;


@Entity
@Table(name="USERS")
public class User {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@NotEmpty(message="username boş olamaz!")
	private String username;
	@NotEmpty(message="şifre boş olamaz!")
	private String password;
	@NotEmpty(message="rol boş olamaz!")
	private String authority;
	private String seyehatZaman;
	private String seyehatGun;
	private int bolumId;
	private int enabled;
	
	/*@ManyToOne
	@JoinColumn(name="id", nullable=false , insertable=false, updatable = false)
	private Travel travel1;*/
	
	public User(){
		
	}
	
	public User(String username, String authority, String seyehatZaman, int id, int bolumId){
		this.id = id;
		this.authority = authority;
		this.username = username;
		this.seyehatZaman = seyehatZaman;
		this.bolumId = bolumId;
	}
	
	/*public Travel getTravel1(){
		return this.travel1;
	}
	
	public void setTravel1(Travel travel1){
		this.travel1 = travel1;
	}*/
	
	public int getBolumId(){
		return this.bolumId;
	}
	
	public void setBolumId(int bolumId){
		this.bolumId = bolumId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

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
	
	public String getAuthority() {
		return this.authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
	public String getSeyehatZaman() {
		return this.seyehatZaman;
	}

	public void setSeyehatZaman(String seyehatZaman) {
		this.seyehatZaman = seyehatZaman;
	}	
	
	public String getSeyehatGun() {
		return this.seyehatGun;
	}

	public void setSeyehatGun(String seyehatGun) {
		this.seyehatGun = seyehatGun;
	}	
	
	public int getEnabled() {
		return this.enabled;
	}
	
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	
}