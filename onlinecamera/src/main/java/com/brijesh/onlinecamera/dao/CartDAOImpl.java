package com.brijesh.onlinecamera.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.brijesh.onlinecamera.model.Cart;
import com.brijesh.onlinecamera.model.Product;

@Repository
public class CartDAOImpl implements CartDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Cart> listAll() {
		return (List<Cart>)sessionFactory.getCurrentSession().createQuery("from Cart").list();
	}
	
	@Override
	public List<Cart> listByEmail(String email){
		String hql = "from Cart where USER_ID = '" + email +"'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		List<Cart> list = query.list();
		return list;
	}
	@Override
	public Cart getCartByID(int cartId) {
		String hql = "from Cart where cartId = '" + cartId + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		
		
		@SuppressWarnings("unchecked")
		List<Cart> listCart = (List<Cart>) query.list();
		
		if (listCart != null && !listCart.isEmpty()) {
			return listCart.get(0);
		}
		
		return null;
	}

	@Override
	public void saveCart(Cart cart) {
		sessionFactory.getCurrentSession().save(cart);

	}

	@Override
	public void editCart(Cart cart) {
		sessionFactory.getCurrentSession().update(cart);
		sessionFactory.getCurrentSession().flush();

	}

	@Override
	public void removeCart(int cartId) {
		String SQL = "delete from Cart where cartId = '" + cartId + "'";
		sessionFactory.getCurrentSession().createQuery(SQL).executeUpdate();
		sessionFactory.getCurrentSession().flush();

	}

}
