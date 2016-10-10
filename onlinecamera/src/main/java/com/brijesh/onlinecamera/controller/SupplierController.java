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

import com.brijesh.onlinecamera.model.Supplier;
import com.brijesh.onlinecamera.service.SupplierService;

@Controller
public class SupplierController {

	@Autowired
	SupplierService supplierService;
	
	//Return all Suppliers
			@RequestMapping(value = "/getAllSuppliers")
			@ResponseBody
			public List<Supplier> getAllSuppliers() {
				return supplierService.listAll();
			}
			
			@RequestMapping("/Addsupplier")
			public String detAddpage(){
				return "addSupplier";	
			}
			
			
			@ModelAttribute("save_supplier")
			public Supplier createFormModelAttribute() {
				return new Supplier();
			}
			
			//Add Supplier
			@RequestMapping(value = "/saveSupplier", method=RequestMethod.POST)
			public String getSaveSupplier(@Valid @ModelAttribute("save_supplier") Supplier supplierobj, BindingResult result, Model model)
			{
				if(result.hasErrors())
				{
					return "addSupplier";
				}
				try
				{
					supplierService.saveSupplier(supplierobj);
				}
				catch(Exception ex){
					model.addAttribute("error", ex.getMessage());
					return "addSupplier";
				}
				return "addSupplier";
			}
			
			//Edit Operation
			@RequestMapping(value = "/editSupplier")
			public ModelAndView getSupplier_Edit(@RequestParam("supplierId") int supplierId)
			{
				System.out.println(supplierId);
				Supplier getSupplier = supplierService.getSupplierByID(supplierId);
				return new ModelAndView("addSupplier","supplierData", getSupplier);
			}

			@ModelAttribute("save_edit_supplier")
			public Supplier createFormModelAttributeForEdit() {
				return new Supplier();
			}
			
			//Add Supplier
			@RequestMapping(value = "/saveEditSupplier", method=RequestMethod.POST)
			public String getEditSaveSupplier(@Valid @ModelAttribute("save_edit_supplier") Supplier supplierobj, BindingResult result, Model model)
			{
				if(result.hasErrors())
				{
					return "addSupplier";
				}
				try
				{
					supplierService.editSupplier(supplierobj);
				}
				catch(Exception ex){
					model.addAttribute("error", ex.getMessage());
					return "addSupplier";
				}
				return "addSupplier";
			}
			
			//Delete Operation
			@RequestMapping(value = "/delSupplier")
			public String removeSupplier(@RequestParam("supplierId") int supplierId){
				supplierService.removeSupplier(supplierId);
				return "addSupplier";
			}
		
}
