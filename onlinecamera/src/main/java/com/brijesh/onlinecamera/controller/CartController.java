package com.brijesh.onlinecamera.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.brijesh.onlinecamera.model.Cart;
import com.brijesh.onlinecamera.model.Product;
import com.brijesh.onlinecamera.model.User;
import com.brijesh.onlinecamera.service.CartService;
import com.brijesh.onlinecamera.service.ProductService;
import com.brijesh.onlinecamera.service.UserService;

@Controller
public class CartController {
	
	@Autowired 
	CartService cartService;
	
	@Autowired
	UserService userService;
	
	@Autowired 
	ProductService productService;
	
	
	@RequestMapping(value = "/addcart", method=RequestMethod.GET)
	public ModelAndView addtocart(@RequestParam(value = "id") int id , HttpServletRequest request){
		ModelAndView m = new ModelAndView("addcart");
		HttpSession session = request.getSession();
		User loguser = (User) session.getAttribute("loginuser");
		Cart cart = new Cart();
		Product product = productService.getProductByID(id);
		cart.setProduct(product);
		cart.setQuantity(1);
		cart.setUser(loguser);
		double total = (double)((product.getPrise())*(cart.getQuantity()));
		cart.setTotal(total);
		cartService.saveCart(cart);
		List <Cart> cartList = cartService.listByEmail(loguser.getEmail());
		m.addObject("cartList", cartList);
		m.addObject("cartSize", cartList.size());
		double grandtotal=0;
		for(int i = 0;i<=cartList.size()-1;i++)
		{
			grandtotal = grandtotal+cartList.get(i).getTotal();
		}
		m.addObject("grandtotal", grandtotal);
		session.setAttribute("grandtotal",grandtotal);
		return m;	
	}
	 
	@RequestMapping(value = "/delcart")
	public ModelAndView removecart(@RequestParam("id") int cartId,HttpServletRequest request){
		ModelAndView m = new ModelAndView("addcart");
		cartService.removeCart(cartId);
		HttpSession session = request.getSession();
		User loguser = (User) session.getAttribute("loginuser");
		List <Cart> cartList = cartService.listByEmail(loguser.getEmail());
		m.addObject("cartList", cartList);
		m.addObject("cartSize", cartList.size());
		double grandtotal=0;
		for(int i = 0;i<=cartList.size()-1;i++)
		{
			grandtotal = grandtotal+cartList.get(i).getTotal();
		}
		m.addObject("grandtotal", grandtotal);
		session.setAttribute("grandtotal",grandtotal);
		return m;
	}
	
	
	@RequestMapping(value = "/updatecart", method = RequestMethod.POST)
	public ModelAndView updatecarquantity(HttpServletRequest request,HttpSession session)throws Exception
	{
		
		int cartId = Integer.valueOf(request.getParameter("id"));
		int productId = Integer.valueOf(request.getParameter("pid"));
		int quantity = Integer.valueOf(request.getParameter("quantity"));
		User loguser = (User) session.getAttribute("loginuser");
		ModelAndView mv = new ModelAndView("addcart");
		mv.addObject("cart", new Cart());
		
		Cart cart= new Cart();
		cart.setCartId(cartId);
		Product product = productService.getProductByID(productId);
		cart.setProduct(product);
		cart.setQuantity(quantity);
		cart.setUser(loguser);
		double total = (double) (product.getPrise()*quantity);
		cart.setTotal(total);
		cartService.editCart(cart);
		List <Cart> cartList = cartService.listByEmail(loguser.getEmail());
		
		mv.addObject("cartList", cartList);
		mv.addObject("cartSize", cartList.size());
		double grandtotal=0;
		for(int i = 0;i<=cartList.size()-1;i++)
		{
			grandtotal = grandtotal+cartList.get(i).getTotal();
		}
		mv.addObject("grandtotal", grandtotal);
		session.setAttribute("grandtotal",grandtotal);
		return mv;
	}
	
	@RequestMapping(value = "/mycart", method=RequestMethod.GET)
	public ModelAndView mycart(HttpServletRequest request){
		ModelAndView m = new ModelAndView("addcart");
		HttpSession session = request.getSession();
		User loguser = (User) session.getAttribute("loginuser");
		List <Cart> cartList = cartService.listByEmail(loguser.getEmail());
		m.addObject("cartList", cartList);
		m.addObject("cartSize", cartList.size());
		double grandtotal=0;
		for(int i = 0;i<=cartList.size()-1;i++)
		{
			grandtotal = grandtotal+cartList.get(i).getTotal();
		}
		m.addObject("grandtotal", grandtotal);
		session.setAttribute("grandtotal",grandtotal);
		return m;
	
	}

}
