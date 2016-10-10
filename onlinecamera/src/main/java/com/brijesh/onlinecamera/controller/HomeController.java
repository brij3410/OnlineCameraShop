package com.brijesh.onlinecamera.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.brijesh.onlinecamera.model.Brand;
import com.brijesh.onlinecamera.model.User;
import com.brijesh.onlinecamera.service.BrandService;
import com.brijesh.onlinecamera.service.CartService;
import com.brijesh.onlinecamera.service.CategoryService;
import com.brijesh.onlinecamera.service.ProductService;

@Controller
public class HomeController {
	
	@Autowired
	BrandService brandService;
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	ProductService  productService;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	HttpSession session;
	
	
	@RequestMapping(value="/admin",method=RequestMethod.GET)
	public ModelAndView adminhomepage(){
		ModelAndView mv = new ModelAndView("adminhome");
		mv.addObject("brandList", brandService.listAll());
		System.out.println("BrandSize:-"+brandService.listAll().size());
		mv.addObject("categoryList", categoryService.listAll());
		return mv;
	}
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public ModelAndView homepage(){
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("brandList", brandService.listAll());
		System.out.println("BrandSize:-"+brandService.listAll().size());
		mv.addObject("categoryList", categoryService.listAll());
		return mv;
	}
	
	@RequestMapping("/Aboutus")
	public String showAboutus() {
		return "Aboutus";
	}

	@RequestMapping("/Contactus")
	public String showContactus() {
		return "Contactus";
	}

	@RequestMapping(value = "/Home")
	public ModelAndView showHomeus(HttpServletRequest request) {
		ModelAndView m = new ModelAndView("index");
		m.addObject("brandList", brandService.listAll());
		m.addObject("categoryList", categoryService.listAll());
		return m;
	}
	@RequestMapping("/showProductList")
	public ModelAndView showporductlist(@RequestParam(value="id") int id){
		ModelAndView m = new ModelAndView("productList");
		m.addObject("brandList", brandService.getBrandByID(id));
		m.addObject("productShow", productService.getProductsByBrandId(id));
		return m;
	}
	@RequestMapping("/showFilterProductList")
	public ModelAndView showFilterporductlist(@RequestParam(value="id") int id,@RequestParam(value="bid") int bid){
		ModelAndView m = new ModelAndView("productList");
		m.addObject("categoryList", categoryService.getCategoryByID(id));
		m.addObject("brandList", brandService.getBrandByID(bid));
		return m;
	}
	@RequestMapping("/showProductdetail")
	public ModelAndView showporductdetail(@RequestParam(value="id") int id){
		ModelAndView m = new ModelAndView("productDetail");
		m.addObject("productList", productService.getProductByID(id));
		return m;
	}
	
	
	
}