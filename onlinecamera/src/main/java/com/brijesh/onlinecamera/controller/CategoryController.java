package com.brijesh.onlinecamera.controller;

import java.util.List;

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
import com.brijesh.onlinecamera.service.BrandService;
import com.brijesh.onlinecamera.service.CategoryService;

@Controller
public class CategoryController {
	@Autowired
	CategoryService categoryService;
	@Autowired
	BrandService brandService;
	
	//Return all Brand
		@RequestMapping(value = "/getAllCategorys")
		@ResponseBody
		public List<Category> getAllCategorys() {
			return categoryService.listAll();
		}
		
		//@RequestMapping("/Addcategory")
		//public ModelAndView detAddpage(){
		//	ModelAndView mv = new ModelAndView("addCategory");
		//	mv.addObject("brandList",brandService.listAll());
		//	return mv;
		//}
		
		
		//Add Category user screen
		@RequestMapping(value="/Addcategory", method=RequestMethod.GET)
		public ModelAndView getCategory_Add(Model model){
			ModelAndView view = new ModelAndView("addCategory");
			view.addObject(new Category());
			view.addObject("brandList",brandService.listAll());
			return view;
		}
		
		@ModelAttribute("save_category")
		public Category createFormModelAttribute() {
			return new Category();
		}
		
		//Add Category
		@RequestMapping(value = "/saveCategory", method=RequestMethod.POST)
		public ModelAndView getSaveCategory(@Valid @ModelAttribute("save_category") Category categoryobj, BindingResult result, Model model)
		{
			ModelAndView m = new ModelAndView("addCategory");
			m.addObject("brandList",brandService.listAll());
			if(result.hasErrors())
			{
				return m;
			}
			try
			{
				categoryService.saveCategory(categoryobj);
			}
			catch(Exception ex){
				model.addAttribute("error", ex.getMessage());
				return m;
			}
			return m;
		}
		
		//Edit Operation
		@RequestMapping(value = "/editCategory")
		public ModelAndView getBrand_Edit(@RequestParam("categoryId") int categoryId)
		{
			System.out.println(categoryId);
			Category getCategory = categoryService.getCategoryByID(categoryId);
			ModelAndView view = new ModelAndView("addCategory","categoryData", getCategory);
			view.addObject("brandList",brandService.listAll());
			return view;
		}

		@ModelAttribute("save_edit_category")
		public Category createFormModelAttributeForEdit() {
			return new Category();
		}
		
		//Add Category
		@RequestMapping(value = "/saveEditCategory", method=RequestMethod.POST)
		public ModelAndView getEditSaveCategory(@Valid @ModelAttribute("save_edit_category") Category categoryobj, BindingResult result, Model model)
		{
			ModelAndView m = new ModelAndView("addCategory");
			m.addObject("brandList",brandService.listAll());
			if(result.hasErrors())
			{
				return m;
			}
			try
			{
				categoryService.editCategory(categoryobj);
			}
			catch(Exception ex){
				model.addAttribute("error", ex.getMessage());
				return m;
			}
			return m;
		}
		
		//Delete Operation
		@RequestMapping(value = "/delCategory")
		public ModelAndView removeCategory(@RequestParam("categoryId") int categoryId){
			ModelAndView m = new ModelAndView("addCategory");
			m.addObject("brandList",brandService.listAll());
			categoryService.removeCategory(categoryId);
			return m;
		}
		
}
