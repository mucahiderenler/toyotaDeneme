package com.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.model.Travel;

public class TravelDaoImpl implements TravelDao {
	
	private static final Logger logger = LoggerFactory.getLogger(TravelDaoImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void addTravel(Travel t) {
		// TODO Auto-generated method stub
		
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(t);
		logger.info("Travel saved successfully, Travel Details="+t);
		
	}

	@Override
	public void updateTravel(Travel t) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.update(t);
		logger.info("Travel updated successfully, Travel Details="+t);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Travel> listTravels() {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Travel> personsList = session.createQuery("from Travel").list();
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
		logger.info("Travel loaded successfully, Travel details="+t);
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
		logger.info("Travel deleted successfully, Travel details="+t);
		
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Travel> listTravelsByDate(Date start, Date end){
		Session session = this.sessionFactory.getCurrentSession();
		List<Travel> personsList = session.createQuery("from Travel T WHERE T.seyehatBas > '"+start+"' and T.seyehatSon > '" + end +"'").list();
		//System.out.println("from Travel T WHERE T.seyehatBas < '"+start+"' and T.seyehatSon > '" + end +"'");
		return personsList;
	}

}
