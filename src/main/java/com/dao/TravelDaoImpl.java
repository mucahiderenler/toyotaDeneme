package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.model.Travel;

public class TravelDaoImpl implements TravelDao {
	
	private static final Logger logger = LoggerFactory.getLogger(PersonDaoImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void addTravel(Travel t) {
		// TODO Auto-generated method stub
		
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(t);
		logger.info("Person saved successfully, Person Details="+t);
		
	}

	@Override
	public void updateTravel(Travel t) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.update(t);
		logger.info("Person updated successfully, Person Details="+t);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Travel> listTravels() {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Travel> personsList = session.createQuery("from travel").list();
		for(Travel t : personsList){
			logger.info("Travel List::"+t);
		}
		return personsList;
	}

	@Override
	public Travel getTravelById(int id) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();		
		Travel t = (Travel) session.load(Travel.class, new Integer(id));
		logger.info("Person loaded successfully, Person details="+t);
		return t;
	}

	@Override
	public void removeTravel(int id) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Travel t = (Travel) session.load(Travel.class, new Integer(id));
		if(null != t){
			session.delete(t);
		}
		logger.info("Person deleted successfully, person details="+t);
		
	}

}