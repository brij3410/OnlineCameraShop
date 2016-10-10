package com.brijesh.onlinecamera.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.brijesh.onlinecamera.dao.ProductDAO;
import com.brijesh.onlinecamera.model.Product;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductDAO productDAO;

	@Override
	public List<Product> listAll() {
		return productDAO.listAll();
	}

	@Override
	public Product getProductByID(int productId) {
		return productDAO.getProductByID(productId);
	}

	@Override
	public void saveProduct(Product product) {
		productDAO.saveProduct(product);
		}

	@Override
	public void editProduct(Product product) {
		productDAO.editProduct(product);
	}

	@Override
	public void removeProduct(int productId) {
		productDAO.removeProduct(productId);
	}
	
	@Override
	public List<Product> getProductsByBrandId (int brandId){
		return productDAO.getProductsByBrandId(brandId);
	}
}
