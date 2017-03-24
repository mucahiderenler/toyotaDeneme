package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;

import com.model.User;

public class UserDaoImpl implements UserDao {
	
	private static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void addUser(User u) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(u);
		
	}

	@Override
	public void updateUser(User u) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.update(u);
		
		
	}
	@Transactional
	@Override
	@SuppressWarnings("unchecked")
	public List<User> listUsers() {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List <User> listUsers= session.createQuery("from User").list();
		for(User u : listUsers){
			logger.info("Travel List::"+u);
		}
		return listUsers;
	}

	@Override
	public User getUserById(int id) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		User u = (User) session.load(User.class, new Integer(id));
		logger.info("User loaded, infos: " + u);
		return u;
	}

	@Override
	public void removeUser(int id) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		User u = (User) session.load(User.class, new Integer(id));
		
		if(u != null){
			session.delete(u);
		}
		logger.info("User deleted, infos: " + u);
	}

}
