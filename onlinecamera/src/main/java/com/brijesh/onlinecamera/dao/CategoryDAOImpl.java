package com.brijesh.onlinecamera.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.brijesh.onlinecamera.model.Brand;
import com.brijesh.onlinecamera.model.Category;

@Repository
public class CategoryDAOImpl implements CategoryDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Category> listAll1() {
		return (List<Category>)sessionFactory.getCurrentSession().createQuery("from Category").list();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Category> listAll() {
		String hql1 = "select category.categoryId as categoryId,category.categoryName as categoryName,category.catDesc as catDesc,brnd.brandId as brandId,brnd.brandName as brandName from Category category join category.brand brnd";
		Query query = sessionFactory.getCurrentSession().createQuery(hql1).setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		List<Category> list = query.list();
		return list;
	}

	@Override
	public Category getCategoryByID(int categoryId) {
		String hql = "from Category where categoryId = '" + categoryId + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		
		@SuppressWarnings("unchecked")
		List<Category> listCategory = (List<Category>) query.list();
		
		if (listCategory != null && !listCategory.isEmpty()) {
			return listCategory.get(0);
		}
		
		return null;
	}

	@Override
	public void saveCategory(Category category) {
		sessionFactory.getCurrentSession().save(category);

	}

	@Override
	public void editCategory(Category category) {
		sessionFactory.getCurrentSession().update(category);
		sessionFactory.getCurrentSession().flush();

	}

	@Override
	public void removeCategory(int categoryId) {
		String SQL = "delete from Category where categoryId = '" + categoryId + "'";
		sessionFactory.getCurrentSession().createQuery(SQL).executeUpdate();
		sessionFactory.getCurrentSession().flush();

	}

}
