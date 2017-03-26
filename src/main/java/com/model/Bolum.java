package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="BOLUMS")

public class Bolum {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String bolumAdi;
	
	private String bolumMudur;
	
	public int getId(){
		return this.id;
	}
	
	public void setId(int id){
		this.id = id;
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
