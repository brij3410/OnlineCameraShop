package com.brijesh.onlinecamera.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.brijesh.onlinecamera.model.Brand;
@Repository
public class BrandDAOImpl implements BrandDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Brand> listAll() {
		return (List<Brand>)sessionFactory.getCurrentSession().createQuery("from Brand").list();
	}

	@Override
	public Brand getBrandByID(int brandId) {
		String hql = "from Brand where brandId = '" + brandId + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		
		@SuppressWarnings("unchecked")
		List<Brand> listBrand = (List<Brand>) query.list();
		
		if (listBrand != null && !listBrand.isEmpty()) {
			return listBrand.get(0);
		}
		
		return null;
	}

	@Override
	public void saveBrand(Brand brand) {
		sessionFactory.getCurrentSession().save(brand);
	}

	@Override
	public void editBrand(Brand brand) {
		sessionFactory.getCurrentSession().update(brand);
		sessionFactory.getCurrentSession().flush();
	}
	@Override
	public void removeBrand(int brandId) {
		String SQL = "delete from Brand where brandId = '" + brandId + "'";
		sessionFactory.getCurrentSession().createQuery(SQL).executeUpdate();
		sessionFactory.getCurrentSession().flush();
	}
}
