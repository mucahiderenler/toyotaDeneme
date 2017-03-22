package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="travel")
public class Travel {
	@Id
	@Column(name="ID")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int ID;
	
	private String bolum;
	private String isim;
	private String mudur;
	private String seyehatBas;
	private String seyehatSon;
	private String seyehatYeri;
	private String gidisAmac;
	private String seyehatMik;
	private String projeKod;
	
	public int getId() {
		return ID;
	}

	public void setId(int ID) {
		this.ID = ID;
	}
	
	public String getBolum(){
		return this.bolum;
	}
	
	public void setBolum(String bolum){
		this.bolum = bolum;
	}
	
	public String getMudur(){
		return this.mudur;
	}
	
	public void setMudur(String mudur){
		this.mudur = mudur;
	}
	
	public String getIsim(){
		return this.isim;
	}
	
	public void setIsim(String isim){
		this.isim = isim;
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
	
}
