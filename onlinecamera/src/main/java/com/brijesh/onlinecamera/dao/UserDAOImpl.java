package com.brijesh.onlinecamera.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.brijesh.onlinecamera.model.User;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<User> listAll() {
		return (List<User>)sessionFactory.getCurrentSession().createQuery("from User").list();
	}

	@Override
	public User getUserByID(String email) {
		String hql = "from User where email = '" + email + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		
		@SuppressWarnings("unchecked")
		List<User> listUser = (List<User>) query.list();
		
		if (listUser != null && !listUser.isEmpty()) {
			return listUser.get(0);
		}
		
		return null;
	}

	@Override
	public void saveUser(User user) {
		sessionFactory.getCurrentSession().save(user);
	}

	@Override
	public void editUser(User user) {
		sessionFactory.getCurrentSession().update(user);
		sessionFactory.getCurrentSession().flush();

	}

	@Override
	public void removeUser(String email) {
		String SQL = "delete from User where email = '" + email + "'";
		sessionFactory.getCurrentSession().createQuery(SQL).executeUpdate();
		sessionFactory.getCurrentSession().flush();

	}

	@Override
	public User isValidUser(String email, String passWord) {
		String hql = "from User where email = '" + email + "'" + "and passWord='" + passWord + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		
		@SuppressWarnings("unchecked")
		List<User> listUser = (List<User>) query.list();
		
		if (listUser != null && !listUser.isEmpty()) {
			return listUser.get(0);
		}
		
		return null;
	}

}
