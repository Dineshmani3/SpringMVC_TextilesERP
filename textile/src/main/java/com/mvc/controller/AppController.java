package com.mvc.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.lang.math.Fraction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.rememberme.PersistentTokenBasedRememberMeServices;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.apache.commons.lang3.StringEscapeUtils;

import com.mvc.model.Invoice;
import com.mvc.model.BillDate;
import com.mvc.model.CustomerAccount;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mvc.dao.CustomerAccDao;
import com.mvc.dao.CustomerMasterDao;
import com.mvc.dao.InventoryDao;
import com.mvc.dao.InvoiceDao;
import com.mvc.dao.InvoiceItemsDao;
import com.mvc.model.CustomerBean;
import com.mvc.model.Inventory;
import com.mvc.model.InvoiceItems;
import com.mvc.model.InvoiceItemsArray;
import com.mvc.model.ProductsTag;
import com.mvc.model.User;
import com.mvc.model.UserProfile;
import com.mvc.service.CustomerMasterDaoService;
import com.mvc.service.InventoryService;
import com.mvc.service.InvoiceExcelDownloadService;
import com.mvc.service.UserProfileService;
import com.mvc.service.UserService;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;



@SuppressWarnings("deprecation")
@Controller
@RequestMapping("/")
@SessionAttributes("roles")
public class AppController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	UserProfileService userProfileService;
	
	@Autowired
	InvoiceDao invoiceDao;
	
	@Autowired
	CustomerMasterDao customerDao; 
	
	@Autowired
	CustomerAccDao customerAccDao;
	
	@Autowired
	InventoryService inventoryService;
	
	@Autowired
	InvoiceItemsDao invoiceItemsDao;
	
	@Autowired
	InvoiceExcelDownloadService invoiceExcelDownloadService;
	
	@Autowired
	MessageSource messageSource;

	@Autowired
	PersistentTokenBasedRememberMeServices persistentTokenBasedRememberMeServices;

	@Autowired
	CustomerMasterDaoService customerMasterDao;
	
	@Autowired
	AuthenticationTrustResolver authenticationTrustResolver;
	
		/**
		 * @param model
		 * @return
		 */
	@RequestMapping(value = {"/"}, method = RequestMethod.GET)
	public String login() {
			if (isCurrentAuthenticationAnonymous()) {
				System.out.println("loggedin user "+ getPrincipal());
				return "login";
		    } else {
		    	return "redirect:/list";  
		    }
	}
	
		@RequestMapping(value = {"/dashboard"}, method = RequestMethod.GET)
		public String list(ModelMap model) {
	
			model.addAttribute("loggedinuser", "Welcome");
			model.addAttribute("count", invoiceDao.findBillCount());
			Double bill_total = invoiceDao.findBillTotal();
			
			Double credit_total = customerAccDao.findCreditTotal();
		
			if(bill_total==null) {
				bill_total = 0.0;
			}
			if(credit_total==null) {
				credit_total = 0.0;
			}
			model.addAttribute("bill_total", bill_total);
			model.addAttribute("credit_total", credit_total);
			model.addAttribute("total", bill_total+credit_total);
			
			return "index1";
		}
	
	 @RequestMapping(value = { "/invoice"}, method = RequestMethod.GET)
	    public String invoice(ModelMap model) {
		 	//model.addAttribute("loggedinuser", getPrincipal());
		 	
		 	InvoiceItemsArray igs = new InvoiceItemsArray();
		    List<InvoiceItems> ig = new ArrayList<InvoiceItems>();
		    Invoice inv = new Invoice();
		    for(int i=0; i<20; i++) {
		    	ig.add(new InvoiceItems());
		    }
		    igs.setIgs(ig);
		    System.out.println(ig);
		    
		    Invoice invoice = invoiceDao.findInvoiceNo();
			if(invoice==null){
				System.out.println("NULL Returned");
				model.addAttribute("billno", 1);
				
			}
			else{
				Integer serial = invoice.getBill_no();
				System.out.println("billno"+serial);
				model.addAttribute("billno", serial+1);
			}
			
			List<Inventory> inven = inventoryService.findByAll();
			model.addAttribute("inven", inven); 
			
			model.put("igs", igs);
			model.addAttribute("inv", inv);
	        return "invoice";
	    }
	 
	 @RequestMapping(value = { "/sample"}, method = RequestMethod.GET)
	    public String sample(ModelMap model) {
		 	
		 	InvoiceItemsArray igs = new InvoiceItemsArray();
		    List<InvoiceItems> ig = new ArrayList<InvoiceItems>();
		    for(int i=0; i<3; i++) {
		    	ig.add(new InvoiceItems());
		    }
		    igs.setIgs(ig);
		    System.out.println(ig);
		    
			model.put("igs", igs);
	        return "sample";
	    }
	 
	 @RequestMapping(value = { "/bills"}, method = RequestMethod.GET)
	    public String BillView(ModelMap model) {
		 	BillDate date = new BillDate();
		 	
			model.addAttribute("date", date);
	        return "index";
	    }
	 
	 @RequestMapping(value = { "/viewBills" }, method = RequestMethod.POST)
		public String ViewBills(ModelMap model,@Valid BillDate date, HttpServletResponse response) throws ClassNotFoundException {
		 	Date date1=date.getDate1();
			System.out.println(date1+" "+date.getDate2());
			List<Invoice> inv = invoiceDao.findAllByDate(date1);
			model.addAttribute("inv", inv);
			model.addAttribute("date", date1);
			
			//Date date1=date.getDate1();
			return "invoiceList";
			
		}
	 
	 @RequestMapping(value = { "/exportBills" }, method = RequestMethod.POST)
		public void exportBills(ModelMap model,@Valid BillDate date, HttpServletResponse response) throws ClassNotFoundException {
			
			System.out.println(date.getDate1()+" "+date.getDate2());
			Date date1=date.getDate1();
			Date date2=date.getDate2();
			invoiceExcelDownloadService.downloadXLS(response,date1,date2);
		}
	 

	 @RequestMapping(value = { "/open-inv-{id}" }, method = RequestMethod.GET)
		public String openInv(@PathVariable int id, ModelMap model) {
			Invoice inv = invoiceDao.findById(id);
			List<InvoiceItems> igs = invoiceItemsDao.findByAllId(id);
			for(InvoiceItems i:igs) {
				System.out.println(i);
			}
			BillDate date = new BillDate();
			model.addAttribute("date", date);
			model.addAttribute("inv", inv);
			model.addAttribute("igs", igs);
			return "invoiceView";
		}
	 
	 @RequestMapping(value = { "/delete-inv-{id}" }, method = RequestMethod.GET)
		public void deleteInv(@PathVariable int id, RedirectAttributes redir) {
			invoiceDao.deleteInvoice(id);
			redir.addAttribute("success", "Deleted Successfully");
		}
	
	 @RequestMapping(value = { "/add-sample" }, method = RequestMethod.GET)
		
		public String saveSample(@RequestParam("items")String[] items,@RequestParam("qty") String[] qty, @RequestParam("sell_p") String[] sell_p, @RequestParam("MRP") String[] MRP) {
			//AttendanceArray emp_atn = new AttendanceArray();
			System.out.println("Add-Sample Goods ");
			
			for (int i = 0; i < items.length; i++) {
			
				System.out.println(items[i]+" "+qty[i]+" "+sell_p[i]+" "+MRP[i]);
					
				}
				//model.addAttribute("edit", true);
				return "redirect:/sample";
			
		}
	 
	 @RequestMapping(value = { "/add-invoice" }, method = RequestMethod.POST)
		public void saveInvoice(@Valid Invoice inv, BindingResult result,
				ModelMap model) {
			//AttendanceArray emp_atn = new AttendanceArray();
				System.out.println("Outside IF "+inv.getCusId());
				
				Integer cusId = inv.getCusId();
				if(cusId!=null) {
					
					Double bal = customerDao.findBalByCusId(cusId);
					if(bal==null) {
						bal=0.0;
					}
					System.out.println(bal);
					Double debit = inv.getBill_amount();
					System.out.println(bal);
					CustomerAccount customerAcc = new CustomerAccount();
					customerAcc.setBill_no(inv.getBill_no());
					customerAcc.setCus_id(cusId);
					customerAcc.setDebit(debit);
					customerAcc.setDate(inv.getDate());
					customerAcc.setBalance(bal);
					customerAccDao.saveCustomerAcc(customerAcc);
					customerDao.updateBalance(bal,cusId); 
				}
				
				System.out.println(inv.getBill_no()+" "+inv.getDate()+" "+inv.getBill_amount());
				invoiceDao.saveInvoice(inv);
				System.out.println("saved");
		}
		
		
		
		@RequestMapping(value = { "/add-items" }, method = RequestMethod.GET)
		
		public String saveInvoiceGoods(@RequestParam("bill_no")String bill_no, @RequestParam("items")String[] items,@RequestParam("qty") String[] qty, @RequestParam("sell_p") String[] sell_p, @RequestParam("MRP") String[] MRP) {
		//public String saveInvoiceGoods(@Valid InvoiceItemsArray igs, BindingResult result, ModelMap model) {
			System.out.println("Add-Invoice Goods ");
			
			System.out.println(bill_no);
			for (int i = 0; i < items.length; i++) {
				
				if(items[i].equals("")||items[i].equals(null)){
		        	   //System.out.println("qut------- "+ig);
		           }
		           else{
		        	   InvoiceItems ig = new InvoiceItems();
						ig.setBill_no(Integer.parseInt(bill_no));
						ig.setItems(items[i]);
						ig.setMRP(Double.parseDouble(MRP[i]));
						ig.setSell_p(Double.parseDouble(sell_p[i]));
						Fraction fraction = Fraction.getFraction(qty[i]);
						Float q = fraction.floatValue();
						ig.setQty(q);
						invoiceItemsDao.saveInvoiceGoods(ig);
		           }
				System.out.println(items[i]+" "+qty[i]+" "+sell_p[i]+" "+MRP[i]);
				
					
				}
				
				System.out.println("Saved");
				//model.addAttribute("edit", true);
				return "redirect:/invoice";
			
		}
		
		@RequestMapping(value = { "/invoiceEdit-{bill_no}"}, method = RequestMethod.GET)
	    public String invoiceEdit(@PathVariable String bill_no, ModelMap model) {
		 	//model.addAttribute("loggedinuser", getPrincipal());
		 	

		 	InvoiceItemsArray igs = new InvoiceItemsArray();
		 	List<InvoiceItems> ig = invoiceItemsDao.findByAllId(Integer.parseInt(bill_no));
		    igs.setIgs(ig);
		    
		    
		    
		    Invoice inv = invoiceDao.findById(Integer.parseInt(bill_no));
			
		    model.addAttribute("billno", inv.getBill_no());
			
		    
			List<Inventory> inven = inventoryService.findByAll();
			model.addAttribute("inven", inven); 
			
			model.put("igs", igs);
			model.addAttribute("inv", inv);
	        return "invoice";
	    }
		
		@RequestMapping(value = "/getTags", method = RequestMethod.GET)
		public @ResponseBody List<ProductsTag> getTags(@RequestParam String tagName,ModelMap model) throws UnsupportedEncodingException {
			System.out.println(tagName);
			//String tag = StringEscapeUtils.escapeXml10(tagName);
			System.out.println("...............................................................................");
			List<ProductsTag> result = new ArrayList<ProductsTag>();
			//System.out.println(entty);
			//String tag = new String(tagName.getBytes("ISO-8859-1"), "UTF-8");
			//System.out.println(tag);
			List<Inventory> itemForm = inventoryService.findAllByName(tagName);
			for(Inventory v:itemForm) {
				result.add(new ProductsTag(v.getItem_id(), v.getItem_name()));
				System.out.println(""+v.getItem_id()+" "+v.getItem_name()+"");
			}
			model.addAttribute("result", result);
			return result;

		}
		
		
	/**
	 * This method will list all existing users.
	 */
	@RequestMapping(value = {"/list" }, method = RequestMethod.GET)
	public String listUsers(ModelMap model) {

		List<User> users = userService.findAllUsers();
		model.addAttribute("users", users);
		System.out.println("loggedin user "+ getPrincipal());
		model.addAttribute("loggedinuser", getPrincipal());
		return "userslist";
	}

	/**
	 * This method will provide the medium to add a new user.
	 */
	@RequestMapping(value = { "/newuser" }, method = RequestMethod.GET)
	public String newUser(ModelMap model) {
		User user = new User();
		model.addAttribute("user", user);
		model.addAttribute("edit", false);
		model.addAttribute("loggedinuser", getPrincipal());
		return "registration";
	}

	/**
	 * This method will be called on form submission, handling POST request for
	 * saving user in database. It also validates the user input
	 */
	@RequestMapping(value = { "/newuser" }, method = RequestMethod.POST)
	public String saveUser(@Valid User user, BindingResult result,
			ModelMap model) {

		if (result.hasErrors()) {
			System.out.println("Errors at first "+result.getFieldError());
			return "registration";
		}
		
		/*
		 * Preferred way to achieve uniqueness of field [sso] should be implementing custom @Unique annotation 
		 * and applying it on field [sso] of Model class [User].
		 * 
		 * Below mentioned peace of code [if block] is to demonstrate that you can fill custom errors outside the validation
		 * framework as well while still using internationalized messages.
		 * 
		 */
		if(!userService.isUserSSOUnique(user.getId(), user.getSsoId())){
			FieldError ssoError =new FieldError("user","ssoId",messageSource.getMessage("non.unique.ssoId", new String[]{user.getSsoId()}, Locale.getDefault()));
		    result.addError(ssoError);
		    System.out.println("Errors "+ result.getFieldError());
			return "registration";
		}
		
		userService.saveUser(user);
		System.out.println("success "+user.getSsoId());
		model.addAttribute("success", "User " + user.getSsoId() + " registered successfully");
		model.addAttribute("loggedinuser", getPrincipal());
		//return "success";
		return "registrationsuccess";
	}

	/**
	 * This method will provide the medium to update an existing user.
	 */
	@RequestMapping(value = { "/edit-user-{ssoId}" }, method = RequestMethod.GET)
	public String editUser(@PathVariable String ssoId, ModelMap model) {
		User user = userService.findBySSO(ssoId);
		model.addAttribute("user", user);
		model.addAttribute("edit", true);
		model.addAttribute("loggedinuser", getPrincipal());
		return "registration";
	}
	
	
	/**
	 * This method will be called on form submission, handling POST request for
	 * updating user in database. It also validates the user input
	 */
	@RequestMapping(value = { "/edit-user-{ssoId}" }, method = RequestMethod.POST)
	public String updateUser(@Valid User user, BindingResult result,
			ModelMap model, @PathVariable String ssoId) {

		if (result.hasErrors()) {
			return "registration";
		}

		/*//Uncomment below 'if block' if you WANT TO ALLOW UPDATING SSO_ID in UI which is a unique key to a User.
		if(!userService.isUserSSOUnique(user.getId(), user.getSsoId())){
			FieldError ssoError =new FieldError("user","ssoId",messageSource.getMessage("non.unique.ssoId", new String[]{user.getSsoId()}, Locale.getDefault()));
		    result.addError(ssoError);
			return "registration";
		}*/


		userService.updateUser(user);

		model.addAttribute("success", "User " + user.getSsoId() + " updated successfully");
		model.addAttribute("loggedinuser", getPrincipal());
		return "registrationsuccess";
	}


	/**
	 * This method will delete an user by it's SSOID value.
	 */
	@RequestMapping(value = { "/delete-user-{ssoId}" }, method = RequestMethod.GET)
	public String deleteUser(@PathVariable String ssoId) {
		userService.deleteUserBySSO(ssoId);
		return "redirect:/list";
	}
	

	/**
	 * This method will provide UserProfile list to views
	 */
	@ModelAttribute("roles")
	public List<UserProfile> initializeProfiles() {
		return userProfileService.findAll();
	}
	
	/**
	 * This method handles Access-Denied redirect.
	 */
	@RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
	public String accessDeniedPage(ModelMap model) {
		model.addAttribute("loggedinuser", getPrincipal());
		return "accessDenied";
	}

	/**
	 * This method handles login GET requests.
	 * If users is already logged-in and tries to goto login page again, will be redirected to list page.
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage() {
		if (isCurrentAuthenticationAnonymous()) {
			return "login";
	    } else {
	    	return "redirect:/list";  
	    }
	}
	/**
	 * This method handles logout requests.
	 * Toggle the handlers if you are RememberMe functionality is useless in your app.
	 */
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logoutPage (HttpServletRequest request, HttpServletResponse response){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null){    
			//new SecurityContextLogoutHandler().logout(request, response, auth);
			persistentTokenBasedRememberMeServices.logout(request, response, auth);
			SecurityContextHolder.getContext().setAuthentication(null);
		}
		return "redirect:/login?logout";
	}

	/**
	 * This method returns the principal[user-name] of logged-in user.
	 */
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

	/**
	 * This method returns true if users is already authenticated [logged-in], else false.
	 */
	private boolean isCurrentAuthenticationAnonymous() {
	    final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    return authenticationTrustResolver.isAnonymous(authentication);
	}


}