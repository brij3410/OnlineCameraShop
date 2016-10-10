package com.brijesh.onlinecamera.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.brijesh.onlinecamera.dao.BrandDAO;
import com.brijesh.onlinecamera.model.Brand;

@Service
@Transactional
public class BrandServiceImpl implements BrandService {

	@Autowired
	BrandDAO brandDAO;
	@Override
	public List<Brand> listAll() {
		return brandDAO.listAll();
	}

	@Override
	public Brand getBrandByID(int brandId) {
		return brandDAO.getBrandByID(brandId);
	}

	@Override
	public void saveBrand(Brand brand) {
		brandDAO.saveBrand(brand);
	}

	@Override
	public void editBrand(Brand brand) {
		brandDAO.editBrand(brand);
	}

	@Override
	public void removeBrand(int brandId) {
		brandDAO.removeBrand(brandId);
	}

}
