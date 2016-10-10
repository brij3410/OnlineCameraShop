package com.brijesh.onlinecamera.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.brijesh.onlinecamera.model.Category;
import com.brijesh.onlinecamera.model.Product;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Product> listAll() {
		String hql1 ="select product.productId as productId,product.productName as productName,product.prise as prise,product.product_image as product_image,brnd.brandId as brandId,brnd.brandName as brandName,cat.categoryId as categoryId,cat.categoryName as categoryName,sup.supplierId as supplierId,sup.supplierName as supplierName from Product product join product.brand brnd join product.category cat join product.supplier sup";
		Query query = sessionFactory.getCurrentSession().createQuery(hql1).setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		List<Product> list = query.list();
		return list;
	}

	@Override
	public Product getProductByID(int productId) {
		String hql = "from Product where productId = '" + productId + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		
		@SuppressWarnings("unchecked")
		List<Product> listProduct = (List<Product>) query.list();
		
		if (listProduct != null && !listProduct.isEmpty()) {
			return listProduct.get(0);
		}
		
		return null;
	}

	@Override
	public void saveProduct(Product product) {
		sessionFactory.getCurrentSession().save(product);

	}

	@Override
	public void editProduct(Product product) {
		sessionFactory.getCurrentSession().update(product);
		sessionFactory.getCurrentSession().flush();

	}

	@Override
	public void removeProduct(int productId) {
		String SQL = "delete from Product where productId = '" + productId + "'";
		sessionFactory.getCurrentSession().createQuery(SQL).executeUpdate();
		sessionFactory.getCurrentSession().flush();

	}
	
	@Override
	public List<Product> getProductsByBrandId (int brandId){
		String hql = "from Product where brandId = '" + brandId + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		List<Product> list = query.list();
		return list;
		
	}

}
