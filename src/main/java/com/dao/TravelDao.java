package com.dao;

import java.util.Date;
import java.util.List;

import com.model.Travel;

public interface TravelDao {
	public void addTravel(Travel t);
	public void updateTravel(Travel t);
	public List<Travel> listTravels();
	public Travel getTravelById(int id);
	public void removeTravel(int id);
	public List<Travel> listTravelsByDate(Date start, Date end);
}
