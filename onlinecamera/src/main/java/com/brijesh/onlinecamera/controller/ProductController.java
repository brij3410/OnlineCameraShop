package com.brijesh.onlinecamera.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.brijesh.onlinecamera.model.Category;
import com.brijesh.onlinecamera.model.Product;
import com.brijesh.onlinecamera.service.BrandService;
import com.brijesh.onlinecamera.service.CategoryService;
import com.brijesh.onlinecamera.service.ProductService;
import com.brijesh.onlinecamera.service.SupplierService;

@Controller
public class ProductController {
	@Autowired
	ProductService productService;
	@Autowired
	CategoryService categoryService;
	@Autowired
	BrandService brandService;
	@Autowired 
	SupplierService supplierService;
	@Autowired
	ServletContext srv;
	
	//Return all Brand
			@RequestMapping(value = "/getAllProducts")
			@ResponseBody
			public List<Product> getAllProducts() {
				return productService.listAll();
			}

			
			@RequestMapping("/Addproduct")
			public ModelAndView detAddpage(){
				ModelAndView mv = new ModelAndView("addProduct");
				mv.addObject("brandList",brandService.listAll());
				mv.addObject("categoryList",categoryService.listAll1());
				mv.addObject("supplierList",supplierService.listAll());
				return mv;
			}
			
			//Add Product user screen
			@RequestMapping(value="/addProduct", method=RequestMethod.GET)
			public ModelAndView getProduct_Add(Model model){
				ModelAndView view = new ModelAndView("addProduct");
				view.addObject(new Product());
				view.addObject("brandList",brandService.listAll());
				view.addObject("categoryList",categoryService.listAll1());
				view.addObject("supplierList",supplierService.listAll());
				return view;
			}
			
			@ModelAttribute("save_product")
			public Product createFormModelAttribute() {
				return new Product();
			}
			
			//Add Product
			@RequestMapping(value = "/saveProduct", method=RequestMethod.POST)
			public ModelAndView getSaveProduct(@Valid @ModelAttribute("save_product") Product productobj, BindingResult result, Model model)
			{
				ModelAndView m = new ModelAndView("addProduct");
				if(result.hasErrors())
				{
					return m;
				}
				try
				{
					m.addObject("brandList",brandService.listAll());
					m.addObject("categoryList",categoryService.listAll1());
					m.addObject("supplierList",supplierService.listAll());
					String path = srv.getRealPath("/");
					String res = productobj.getFilePath(path, srv.getContextPath());
					productService.saveProduct(productobj);
				}
				catch(Exception ex){
					model.addAttribute("error", ex.getMessage());
					return m;
				}
				return m;
			}
			
			//Edit Operation
			@RequestMapping(value = "/editProduct")
			public ModelAndView getProduct_Edit(@RequestParam("productId") int productId)
			{
				System.out.println(productId);
				Product getProduct = productService.getProductByID(productId);
				ModelAndView view = new ModelAndView("addProduct","productData", getProduct);
				view.addObject("brandList",brandService.listAll());
				view.addObject("categoryList",categoryService.listAll1());
				view.addObject("supplierList",supplierService.listAll());
				return view;
			}
			
			@ModelAttribute("save_edit_product")
			public Product createFormModelAttributeForEdit() {
				return new Product();
			}
			
			//Add Product
			@RequestMapping(value = "/saveEditProduct", method=RequestMethod.POST)
			public ModelAndView getEditSaveProduct(@Valid @ModelAttribute("save_edit_product") Product productobj, BindingResult result, Model model)
			{
				ModelAndView m = new ModelAndView("addProduct");
				if(result.hasErrors())
				{
					return m;
				}
				try
				{
					m.addObject("brandList",brandService.listAll());
					m.addObject("categoryList",categoryService.listAll1());
					m.addObject("supplierList",supplierService.listAll());
					String path = srv.getRealPath("/");
					String res = productobj.getFilePath(path, srv.getContextPath());
					productService.editProduct(productobj);
				}
				catch(Exception ex){
					model.addAttribute("error", ex.getMessage());
					return m;
				}
				return m;
			}
			
			//Delete Operation
			@RequestMapping(value = "/delProduct") 
			public ModelAndView removeProduct(@RequestParam("productId") int productId){
				ModelAndView m = new ModelAndView("addProduct");
				m.addObject("brandList",brandService.listAll());
				m.addObject("categoryList",categoryService.listAll1());
				m.addObject("supplierList",supplierService.listAll());
				productService.removeProduct(productId);
				return m;
			}
}
