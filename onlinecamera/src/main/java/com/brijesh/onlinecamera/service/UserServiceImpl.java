package com.brijesh.onlinecamera.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.brijesh.onlinecamera.dao.UserDAO;
import com.brijesh.onlinecamera.model.User;

@Service
@Transactional
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserDAO userDAO;

	@Override
	public List<User> listAll() {
		return userDAO.listAll();
	}

	@Override
	public User getUserByID(String email) {
		return userDAO.getUserByID(email);
	}

	@Override
	public void saveUser(User user) {
		userDAO.saveUser(user);
	}

	@Override
	public void editUser(User user) {
		userDAO.editUser(user);
	}

	@Override
	public void removeUser(String email) {
		userDAO.removeUser(email);
	}

	@Override
	public User isValidUser(String email, String passWord) {
		return userDAO.isValidUser(email, passWord);
	}

}
