package com.dao;

import java.util.HashMap;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import com.model.Bolum;

public class BolumDaoImpl implements BolumDao {
	

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}


	@Override
	public void addBolum(Bolum b) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(b);
		
	}

	@Override
	public void updateBolum(Bolum b) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.update(b);
		
	}

	@Override
	@Transactional
	public Bolum getBolumById(int id) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Bolum b = (Bolum) session.load(Bolum.class, new Integer(id));
		return b;
	}

	@Override
	@Transactional
	@SuppressWarnings("unchecked")
	public List<Bolum> listBolums() {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Bolum> bolumList = session.createQuery("from Bolum").list();
		return bolumList;
	}
	
	@Override
	@Transactional
	@SuppressWarnings("unchecked")
	public Bolum getBolumByName(String name) {
		Session session = this.sessionFactory.getCurrentSession();
		List<Bolum> bolum = session.createQuery("FROM Bolum b WHERE b.bolumAdi='" + name +"'").list();
		return bolum.get(0);
	}
	
	@Override
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Integer> listBolumId(){
		Session session = this.sessionFactory.getCurrentSession();
		List <Integer> ids = session.createQuery("SELECT b.id FROM Bolum b").list();
		return ids;
	}
	@Override
	@Transactional
	@SuppressWarnings("unchecked")
	public List<String> listBolumName(){
		Session session = this.sessionFactory.getCurrentSession();
		List <String> names = session.createQuery("SELECT b.bolumAdi FROM Bolum b").list();
		return names;
	}
	
	@Override
	@Transactional
	public HashMap <Integer,String> IdAndBolum(){
		
		List <Integer> ids = listBolumId();
		List <String> names = listBolumName();
		HashMap<Integer,String> hello = new HashMap<Integer,String>();
		
		for(int i = 0; i < ids.size(); i++) {
			hello.put(ids.get(i), names.get(i));
		}
		return hello;
	}

}
