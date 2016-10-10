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

import com.brijesh.onlinecamera.model.Brand;
import com.brijesh.onlinecamera.service.BrandService;

@Controller
public class BrandController {

	@Autowired
	BrandService brandService;
	
	@Autowired
	ServletContext srv;
	
	//Return all Brand
		@RequestMapping(value = "/getAllBrands")
		@ResponseBody
		public List<Brand> getAllBrands() {
			return brandService.listAll();
		}
		
		@RequestMapping("/Add Brand")
		public String detAddpage(){
			return "addBrand";
			
		}
		
		@ModelAttribute("save_brand")
		public Brand createFormModelAttribute() {
			return new Brand();
		}
		
		//Add Category
		@RequestMapping(value = "/saveBrand", method=RequestMethod.POST)
		public String getSaveCategory(@Valid @ModelAttribute("save_brand") Brand brandobj, BindingResult result, Model model)
		{
			if(result.hasErrors())
			{
				return "addBrand";
			}
			try
			{
				String path = srv.getRealPath("/");
				String res = brandobj.getFilePath(path, srv.getContextPath());
				brandService.saveBrand(brandobj);
			}
			catch(Exception ex){
				model.addAttribute("error", ex.getMessage());
				return "addBrand";
			}
			return "addBrand";
		}
		
		//Edit Operation
		@RequestMapping(value = "/editBrand")
		public ModelAndView getBrand_Edit(@RequestParam("brandId") int brandId)
		{
			System.out.println(brandId);
			Brand getBrand = brandService.getBrandByID(brandId);
			return new ModelAndView("addBrand","brandData", getBrand);
		}

		@ModelAttribute("save_edit_brand")
		public Brand createFormModelAttributeForEdit() {
			return new Brand();
		}
		
		//Add Category
		@RequestMapping(value = "/saveEditBrand", method=RequestMethod.POST)
		public String getEditSaveCategory(@Valid @ModelAttribute("save_edit_brand") Brand brandobj, BindingResult result, Model model)
		{
			if(result.hasErrors())
			{
				return "addBrand";
			}
			try
			{
				String path = srv.getRealPath("/");
				String res = brandobj.getFilePath(path, srv.getContextPath());
				brandService.editBrand(brandobj);
			}
			catch(Exception ex){
				model.addAttribute("error", ex.getMessage());
				return "addBrand";
			}
			return "addBrand";
		}
		
		//Delete Operation
		@RequestMapping(value = "/delBrand")
		public String removeBrand(@RequestParam("brandId") int brandId){
			brandService.removeBrand(brandId);
			return "addBrand";
		}
		
}		
