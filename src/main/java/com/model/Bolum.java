package com.model;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="BOLUMS")

public class Bolum {
	
	private String bolumAdi;
	
	private String bolumMudur;
	
	private String username;
	
	public String getUsername(){
		return this.username;
	}
	public void setUsername(String username){
		this.username = username;
	}
	
	public String getBolumAdi(){
		return this.bolumAdi;
	}
	
	public void setBolumAdi(String bolumAdi){
		this.bolumAdi = bolumAdi;
	}
	
	public String getBolumMudur(){
		return this.bolumMudur;
	}
	
	public void setBolumMudur(String bolumMudur){
		this.bolumMudur = bolumMudur;
	}
}
