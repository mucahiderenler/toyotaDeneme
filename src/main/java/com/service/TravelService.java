package com.service;

import java.util.List;

import com.model.Travel;

public interface TravelService {
	public void addTravel(Travel t);
	public void updateTravel(Travel t);
	public List<Travel> listTravels();
	public Travel getTravelById(int id);
	public void removeTravel(int id);
}
