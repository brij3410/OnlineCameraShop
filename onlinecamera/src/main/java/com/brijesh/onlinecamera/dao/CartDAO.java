package com.brijesh.onlinecamera.dao;

import java.util.List;

import com.brijesh.onlinecamera.model.Cart;

public interface CartDAO {
	
	public List<Cart> listAll();

	public Cart getCartByID(int cartId);

	public void saveCart(Cart cart);
	
	public void editCart(Cart cart);

	public void removeCart(int cartId);
	
	public List<Cart> listByEmail(String email);

}
