package com.brijesh.onlinecamera.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.brijesh.onlinecamera.dao.SupplierDAO;
import com.brijesh.onlinecamera.model.Supplier;

@Service
@Transactional
public class SupplierServiceImpl implements SupplierService {

	@Autowired
	SupplierDAO supplierDAO;
	
	@Override
	public List<Supplier> listAll() {
		return supplierDAO.listAll();
	}

	@Override
	public Supplier getSupplierByID(int supplierId) {
		return supplierDAO.getSupplierByID(supplierId);
	}

	@Override
	public void saveSupplier(Supplier supplier) {
		supplierDAO.saveSupplier(supplier);
	}

	@Override
	public void editSupplier(Supplier supplier) {
		supplierDAO.editSupplier(supplier);
	}

	@Override
	public void removeSupplier(int supplierId) {
		supplierDAO.removeSupplier(supplierId);
	}

}
