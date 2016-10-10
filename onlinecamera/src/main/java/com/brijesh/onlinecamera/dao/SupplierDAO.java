package com.brijesh.onlinecamera.dao;

import java.util.List;


import com.brijesh.onlinecamera.model.Supplier;

public interface SupplierDAO {

	public List<Supplier> listAll();

	public Supplier getSupplierByID(int supplierId);

	public void saveSupplier(Supplier supplier);
	
	public void editSupplier(Supplier supplier);

	public void removeSupplier(int supplierId);
}
