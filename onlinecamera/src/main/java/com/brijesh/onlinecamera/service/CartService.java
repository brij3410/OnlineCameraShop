package com.brijesh.onlinecamera.service;

import java.util.List;

import com.brijesh.onlinecamera.model.Cart;

public interface CartService {
	
	public List<Cart> listAll();

	public Cart getCartByID(int cartId);

	public void saveCart(Cart cart);
	
	public void editCart(Cart cart);

	public void removeCart(int cartId);
	
	public List<Cart> listByEmail(String email);

}
