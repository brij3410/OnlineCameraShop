package com.brijesh.onlinecamera.service;

import java.util.List;

import com.brijesh.onlinecamera.model.Brand;

public interface BrandService {
	
	public List<Brand> listAll();

	public Brand getBrandByID(int brandId);

	public void saveBrand(Brand brand);
	
	public void editBrand(Brand brand);

	public void removeBrand(int brandId);

}
