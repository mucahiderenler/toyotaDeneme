package com.model;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name="travels")
public class Travel {
	@Id
	@Column(name="ID")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int ID;
	private int userId;
	@NotEmpty(message="Seyehat başlangıcı girilmelidir.")
	private String seyehatBas;
	@NotEmpty(message="Seyehat sonu girilmelidir.")
	private String seyehatSon;
	@NotEmpty(message="Seyehat yeri girilmelidir.")
	private String seyehatYeri;
	@NotEmpty(message="Gidiş amacınızı girilmelidir..")
	private String gidisAmac;
	@NotEmpty(message="Seyehat tutarı girilmelidir.")
	private String seyehatMik;
	@NotEmpty(message="Proje kodu girilmelidir.")
	private String projeKod;
	private String validErrorMessage;
	
	/*@OneToMany(mappedBy="travel1" ,cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private Set<User> user;*/
	
	public Travel(){}
	
	public Travel(int userId, String seyehatBas, String seyehatSon,
					String seyehatYeri, String gidisAmac, String seyehatMik, String projeKod){
		this.userId = userId;
		this.seyehatBas = seyehatBas;
		this.seyehatSon = seyehatSon;
		this.seyehatYeri = seyehatYeri;
		this.gidisAmac = gidisAmac;
		this.seyehatMik = seyehatMik;
		this.projeKod = projeKod;
	}
	
	/*public Set<User> getUser(){
		return this.user;
	}
	
	public void getUser(Set<User> user){
		this.user = user;
	}*/
	
	public int getId() {
		return ID;
	}

	public void setId(int ID) {
		this.ID = ID;
	}
	
	public int getUserId(){
		return this.userId;
	}
	
	public void setUserId(int userId){
		this.userId = userId;
	}
	
	public String getSeyehatBas(){
		return this.seyehatBas;
	}
	
	public void setSeyehatBas(String seyehatBas){
		this.seyehatBas = seyehatBas;
	}
	
	public String getSeyehatSon(){
		return this.seyehatSon;
	}
	
	public void setSeyehatSon(String seyehatSon){
		this.seyehatSon = seyehatSon;
	}
	
	public String getSeyehatYeri(){
		return this.seyehatYeri;
	}
	
	public void setSeyehatYeri(String seyehatYeri){
		this.seyehatYeri = seyehatYeri;
	}
	
	public String getgidisAmac(){
		return this.gidisAmac;
	}
	
	public void setgidisAmac(String gidisAmac){
		this.gidisAmac = gidisAmac;
	}
	
	public String getseyehatMik(){
		return this.seyehatMik;
	}
	
	public void setseyehatMik(String seyehatMik){
		this.seyehatMik = seyehatMik;
	}
	
	public String getProjeKod(){
		return this.projeKod;
	}
	
	public void setProjeKod(String projeKod){
		this.projeKod = projeKod;
	}
	
	public String getValidErrorMessage() {
		return this.validErrorMessage;
	}
	
	public void setValidErrorMessage(String msg) {
		this.validErrorMessage = msg;
	}
	
}
