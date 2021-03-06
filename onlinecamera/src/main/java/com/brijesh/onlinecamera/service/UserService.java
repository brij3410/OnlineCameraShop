package com.brijesh.onlinecamera.service;

import java.util.List;

import com.brijesh.onlinecamera.model.User;

public interface UserService {
	
	public List<User> listAll();

	public User getUserByID(String email);

	public void saveUser(User user);
	
	public void editUser(User user);

	public void removeUser(String email);
	
	public User isValidUser(String email,String passWord);

}
