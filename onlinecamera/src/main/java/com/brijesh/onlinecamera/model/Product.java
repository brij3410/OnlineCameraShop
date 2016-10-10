package com.brijesh.onlinecamera.model;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="Product")
public class Product {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int productId;
	private String productName;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="brandId")
	@JsonIgnore
	private Brand brand;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="categoryId")
	@JsonIgnore
	private Category category;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="supplierId")
	@JsonIgnore
	private Supplier supplier;
	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
    @JoinColumn(name="product_id")
    private Set<Cart> cart;
	
	private int prise;
	private String proDesc;
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Brand getBrand() {
		return brand;
	}
	public void setBrand(Brand brand) {
		this.brand = brand;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public Supplier getSupplier() {
		return supplier;
	}
	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}
	public int getPrise() {
		return prise;
	}
	public void setPrise(int prise) {
		this.prise = prise;
	}
	public String getProDesc() {
		return proDesc;
	}
	public void setProDesc(String proDesc) {
		this.proDesc = proDesc;
	}
	private String product_image;
	transient private MultipartFile prdFile;
	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}
	
	public MultipartFile getPrdFile() {
		return prdFile;
	}
	public void setPrdFile(MultipartFile prdFile) {
		this.prdFile = prdFile;
	}
	public String getFilePath(String path1,String contextPath)
	{
		String fileName=null;
		if(!prdFile.isEmpty())
		{
			try
			{
				fileName=prdFile.getOriginalFilename();
				byte[] bytes = prdFile.getBytes();
				String npath=path1+"\\resources\\"+fileName;
				System.out.print("path :" + npath);
				BufferedOutputStream buffStream = new BufferedOutputStream(new FileOutputStream(new File(npath)));
				buffStream.write(bytes);
	            buffStream.close();
	            String dbfilename=contextPath+"/resources/"+fileName;
	            setProduct_image(dbfilename);
	            return dbfilename;
			}
			catch(Exception e)
			{
				System.out.println(e.getMessage());
				return "fail";
			}
		}
		else
		{
			return "fail";
		}
	}
}
