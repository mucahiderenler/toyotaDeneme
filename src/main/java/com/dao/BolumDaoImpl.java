package com.dao;

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

}
