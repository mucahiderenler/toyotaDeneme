package com.dao;

import com.model.Bolum;
import java.util.List;



public interface BolumDao {
	public void addBolum(Bolum b);
	public void updateBolum(Bolum b);
	public Bolum getBolumById(int id);
	public List<Bolum> listBolums();
	public Bolum getBolumByName(String name);
}
