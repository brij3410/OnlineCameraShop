package com.brijesh.onlinecamera.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.brijesh.onlinecamera.dao.CartDAO;
import com.brijesh.onlinecamera.model.Cart;

@Service
@Transactional
public class CartServiceImpl implements CartService {
	
	@Autowired
	CartDAO cartDAO;
	
	@Override
	public List<Cart> listAll() {
		return cartDAO.listAll();
	}
	
	@Override
	public List<Cart> listByEmail(String email){
		return cartDAO.listByEmail(email);
	}

	@Override
	public Cart getCartByID(int cartId) {
		return cartDAO.getCartByID(cartId);
	}

	@Override
	public void saveCart(Cart cart) {
		cartDAO.saveCart(cart);
	}

	@Override
	public void editCart(Cart cart) {
		cartDAO.editCart(cart);
	}

	@Override
	public void removeCart(int cartId) {
		cartDAO.removeCart(cartId);

	}

}
