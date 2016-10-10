package com.brijesh.onlinecamera.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.brijesh.onlinecamera.dao.CategoryDAO;
import com.brijesh.onlinecamera.model.Category;
@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@Override
	public List<Category> listAll1(){
		return categoryDAO.listAll1();
	}
	@Override
	public List<Category> listAll() {
		return categoryDAO.listAll();
	}

	@Override
	public Category getCategoryByID(int categoryId) {
		return categoryDAO.getCategoryByID(categoryId);
	}

	@Override
	public void saveCategory(Category category) {
		categoryDAO.saveCategory(category);

	}

	@Override
	public void editCategory(Category category) {
		categoryDAO.editCategory(category);

	}

	@Override
	public void removeCategory(int categoryId) {
		categoryDAO.removeCategory(categoryId);

	}

}
