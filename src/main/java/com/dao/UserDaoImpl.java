package com.dao;

import java.util.HashMap;
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
	@Transactional
	@Override
	public User getUserByName(String name) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		User u = (User) session.load(User.class, new String(name));
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
	@Transactional
	@Override
	@SuppressWarnings("unchecked")
	public List<Integer> listUsersId() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Integer> listUsersName = session.createQuery("SELECT U.id FROM User U").list();
		return listUsersName;
	}

	@Transactional
	@Override
	@SuppressWarnings("unchecked")
	public List<String> listUsersName() {
		Session session = this.sessionFactory.getCurrentSession();
		List<String> listUsersName = session.createQuery("SELECT U.username FROM User U").list();
		return listUsersName;
	}
	
	@Override
	@Transactional
	@SuppressWarnings("unchecked")
	public User getUserById(int id) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();	
		List<User> u = session.createQuery("FROM User U WHERE U.id = '"+ id + "'").list();
		logger.info("Travel loaded successfully, Travel details="+u.get(0));
		return u.get(0);
	}

	@Override
	@Transactional
	public HashMap<Integer, String> IdAndUser() {
		// TODO Auto-generated method stub
		List <String> name = listUsersName();
		List <Integer> id = listUsersId();
		HashMap<Integer,String> hello = new HashMap<Integer,String>();
		
		for(int i = 0; i < name.size(); i++){
			hello.put(id.get(i), name.get(i));
		}
		
		return hello;
	}

	


}
