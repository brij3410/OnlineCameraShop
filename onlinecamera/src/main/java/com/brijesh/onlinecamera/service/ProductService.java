package com.brijesh.onlinecamera.service;

import java.util.List;

import com.brijesh.onlinecamera.model.Product;

public interface ProductService {
	
	public List<Product> listAll();

	public Product getProductByID(int productId);

	public void saveProduct(Product product);
	
	public void editProduct(Product product);

	public void removeProduct(int productId);
	
	public List<Product> getProductsByBrandId (int brandId);

}
