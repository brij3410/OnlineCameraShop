package com.brijesh.onlinecamera.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.brijesh.onlinecamera.model.Supplier;
@Repository
public class SupplierDAOImpl implements SupplierDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Supplier> listAll() {
		return (List<Supplier>)sessionFactory.getCurrentSession().createQuery("from Supplier").list();
	}

	@Override
	public Supplier getSupplierByID(int supplierId) {
		String hql = "from Supplier where supplierId = '" + supplierId + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		
		@SuppressWarnings("unchecked")
		List<Supplier> listSupplier = (List<Supplier>) query.list();
		
		if (listSupplier != null && !listSupplier.isEmpty()) {
			return listSupplier.get(0);
		}
		
		return null;
	}

	@Override
	public void saveSupplier(Supplier supplier) {
		sessionFactory.getCurrentSession().save(supplier);

	}

	@Override
	public void editSupplier(Supplier supplier) {
		sessionFactory.getCurrentSession().update(supplier);
		sessionFactory.getCurrentSession().flush();

	}

	@Override
	public void removeSupplier(int supplierId) {
		String SQL = "delete from Supplier where supplierId = '" + supplierId + "'";
		sessionFactory.getCurrentSession().createQuery(SQL).executeUpdate();
		sessionFactory.getCurrentSession().flush();

	}

}
