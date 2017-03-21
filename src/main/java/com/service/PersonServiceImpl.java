package com.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.PersonDao;
import com.model.Person;

@Service
public class PersonServiceImpl implements PersonService {
	
	private PersonDao personDAO;

	public void setPersonDAO(PersonDao personDAO) {
		this.personDAO = personDAO;
	}

	@Override
	@Transactional
	public void addPerson(Person p) {
		this.personDAO.addPerson(p);
	}

	@Override
	@Transactional
	public void updatePerson(Person p) {
		this.personDAO.updatePerson(p);
	}

	@Override
	@Transactional
	public List<Person> listPersons() {
		return this.personDAO.listPersons();
	}

	@Override
	@Transactional
	public Person getPersonById(int id) {
		return this.personDAO.getPersonById(id);
	}

	@Override
	@Transactional
	public void removePerson(int id) {
		this.personDAO.removePerson(id);
	}
}
