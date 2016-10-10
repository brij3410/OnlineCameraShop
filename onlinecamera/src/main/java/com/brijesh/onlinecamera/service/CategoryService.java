package com.brijesh.onlinecamera.service;

import java.util.List;

import com.brijesh.onlinecamera.model.Category;

public interface CategoryService {
	
	public List<Category> listAll1();

	public List<Category> listAll();

	public Category getCategoryByID(int categoryId);

	public void saveCategory(Category category);
	
	public void editCategory(Category category);

	public void removeCategory(int categoryId);
}
