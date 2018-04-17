package com.mvc.controller;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mvc.model.Inventory;
import com.mvc.service.InventoryService;


@Controller
@RequestMapping("/inven")
public class InventoryController {
 
	@Autowired
	InventoryService inventoryService;
	
	@RequestMapping(value = { "/show-inven-list"}, method = RequestMethod.GET)
	public String showInvenList(ModelMap model, @ModelAttribute("success") String success) {
		List<Inventory> inven = inventoryService.findByAll();
		if(inven.size()==0) {
			model.addAttribute("count", true);	
		}
		else {
			model.addAttribute("count", false);
		}
		model.addAttribute("loggedinuser", getPrincipal());
		model.addAttribute("inven", inven);
		model.addAttribute("success", success);
		//BigDecimal bg = BigDecimal.valueOf(inven.get(0).getC_p()).setScale(2, RoundingMode.HALF_EVEN);
		//System.out.println(bg);
		return "inventory_list";
	}
	
	@RequestMapping(value={"/", "/add-inven"}, method = RequestMethod.GET)
	public String addInven(ModelMap model) {
		Inventory inven = new Inventory();
		model.addAttribute("inven", inven);
		return "inventory_add";
	}
	
	@RequestMapping(value = { "/add-inven" }, method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String saveUser(@Valid Inventory inven, BindingResult result,
			ModelMap model,RedirectAttributes redir) throws UnsupportedEncodingException {
			//byte[] bytes = inven.getItem_name().getBytes();
			String s2 = new String(inven.getItem_name().getBytes("ISO-8859-1"), "UTF-8");
			inven.setItem_name(s2);
			Double gross = inven.getCost_price();
			//inven.setC_p(inven.getC_p().setScale(2, RoundingMode.HALF_EVEN));
			System.out.println("Outside IF "+result);
			System.out.println(s2);
		if (result.hasErrors()) {
			System.out.println("Inside IF "+result);
			return "inventory_add";
		}
		
		else {
			System.out.println("Inside ELSE "+inven);
			inventoryService.saveInventory(inven);
			redir.addAttribute("success", "Inventory Added successfully");
			model.addAttribute("invn", true);
			return "redirect:/inven/show-inven-list";
		}
	}
	
	@RequestMapping(value = { "/edit-stock" }, method = RequestMethod.GET)
	public String editUser(ModelMap model) {
		Inventory inven = new Inventory();
		model.addAttribute("inven", inven);
		model.addAttribute("edit", true);
		return "add_inventory_stock";
	}
	
	/**
	 * This method will be called on form submission, handling POST request for
	 * updating user in database. It also validates the user input
	 */
	/*@RequestMapping(value = { "/edit-stock" }, method = RequestMethod.POST)
	public String updateStock(@Valid Inventory inven, BindingResult result,
			ModelMap model, RedirectAttributes redir) {

		if (result.hasErrors()) {
			return "add_inventory_stock";
		}
		else {
			System.out.println(inven);
			inventoryService.updateStock(inven);
			model.addAttribute("invn", true);
			redir.addAttribute("success", "Stock updated successfully");
			//return "registrationsuccess2";
			return "redirect:/inven/show-inven-list"; 
		}
	}*/
	
	@RequestMapping(value = { "/edit-inven-{item_id}" }, method = RequestMethod.GET)
	public String editInven(@PathVariable Integer item_id, ModelMap model) {
		Inventory inven = inventoryService.findById(item_id);
		model.addAttribute("inven", inven);
		model.addAttribute("edit", true);
		return "inventory_add";
	}
	
	/**
	 * This method will be called on form submission, handling POST request for
	 * updating user in database. It also validates the user input
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value = { "/edit-inven-{item_id}" }, method = RequestMethod.POST)
	public String updateInventory(@Valid Inventory inven, BindingResult result,
			ModelMap model,@PathVariable Integer item_id, RedirectAttributes redir) throws UnsupportedEncodingException {

		String s2 = new String(inven.getItem_name().getBytes("ISO-8859-1"), "UTF-8");
		inven.setItem_name(s2);
		Double gross = inven.getCost_price();
		if (result.hasErrors()) {
			return "inventory_add";
		}
		else {
			
			inventoryService.updateInventory(inven);
			model.addAttribute("invn", true);
			redir.addAttribute("success", "Inventory updated successfully");
			return "redirect:/inven/show-inven-list";
		}
	}
	
	@RequestMapping(value = { "/delete-inven-{item_id}" }, method = RequestMethod.GET)
	public String deleteUser(@PathVariable Integer item_id, RedirectAttributes redir) {
		inventoryService.deleteInventory(item_id);
		redir.addAttribute("success", "Inventory Deleted");
		return "redirect:/inven/show-inven-list";
	}
	
	private String getPrincipal(){
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails)principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}
	
}
