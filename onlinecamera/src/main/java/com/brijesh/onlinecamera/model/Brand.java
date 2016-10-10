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
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="Brand")
public class Brand {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int brandId;
	
	@NotEmpty(message="Brand name should not be null")
	@Length(max=30,message="Name should not be more then 30 characters")
	private String brandName;
	
	public int getBrandId() {
		return brandId;
	}
	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	
	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
    @JoinColumn(name="brandId")
    private Set<Category> category;
	
	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
    @JoinColumn(name="brandId")
    private Set<Product> product;

	public Set<Product> getProduct() {
		return product;
	}
	public void setProduct(Set<Product> product) {
		this.product = product;
	}
	public Set<Category> getCategory() {
		return category;
	}
	public void setCategory(Set<Category> category) {
		this.category = category;
	}
	
	private String brand_image;

	public String getBrand_image() {
		return brand_image;
	}
	public void setBrand_image(String brand_image) {
		this.brand_image = brand_image;
	}
	transient private MultipartFile brndfile;

	
	
	public MultipartFile getBrndfile() {
		return brndfile;
	}
	public void setBrndfile(MultipartFile brndfile) {
		this.brndfile = brndfile;
	}
	public String getFilePath(String path1,String contextPath)
	{
		String fileName=null;
		if(!brndfile.isEmpty())
		{
			try
			{
				fileName=brndfile.getOriginalFilename();
				byte[] bytes = brndfile.getBytes();
				String npath=path1+"\\resources\\"+fileName;
				System.out.print("path :" + npath);
				BufferedOutputStream buffStream = new BufferedOutputStream(new FileOutputStream(new File(npath)));
				buffStream.write(bytes);
	            buffStream.close();
	            String dbfilename=contextPath+"/resources/"+fileName;
	            setBrand_image(dbfilename);
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
