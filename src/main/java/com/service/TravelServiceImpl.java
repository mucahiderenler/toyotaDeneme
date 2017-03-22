package com.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.dao.TravelDao;
import com.model.Travel;

public class TravelServiceImpl implements TravelService {
	
	private TravelDao travelDao;
	
	public void setTravelDao(TravelDao travelDao){
		this.travelDao = travelDao;
	}

	@Override
	@Transactional
	public void addTravel(Travel t) {
		// TODO Auto-generated method stub
		this.travelDao.addTravel(t);
		
	}
	
	@Override
	@Transactional
	public void updateTravel(Travel t) {
		// TODO Auto-generated method stub
		this.travelDao.updateTravel(t);
	}

	@Override
	@Transactional
	public List<Travel> listTravels() {
		// TODO Auto-generated method stub
		return this.travelDao.listTravels();
	}

	@Override
	@Transactional
	public Travel getTravelById(int id) {
		// TODO Auto-generated method stub
		return this.travelDao.getTravelById(id);
	}

	@Override
	@Transactional
	public void removeTravel(int id) {
		// TODO Auto-generated method stub
		this.travelDao.removeTravel(id);
		
	}

}
