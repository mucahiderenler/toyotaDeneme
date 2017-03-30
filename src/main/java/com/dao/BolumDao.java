package com.dao;

import java.util.HashMap;
import java.util.List;

import com.model.Bolum;



public interface BolumDao {
	public void addBolum(Bolum b);
	public void updateBolum(Bolum b);
	public Bolum getBolumById(int id);
	public List<Bolum> listBolums();
	public Bolum getBolumByName(String name);
	public List<Integer> listBolumId();
	public List<String> listBolumName();
	public HashMap <Integer,String> IdAndBolum();
}
