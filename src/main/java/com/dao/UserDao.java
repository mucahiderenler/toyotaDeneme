package com.dao;

import java.util.HashMap;
import java.util.List;

import com.model.User;

public interface UserDao {
	public void addUser(User u);
	public void updateUser(User u);
	public List<User> listUsers();
	public User getUserByName(String name);
	public void removeUser(int id);
	public List<Integer> listUsersId();
	public List<String> listUsersName();
	public HashMap<Integer,String> hello();
	
}
