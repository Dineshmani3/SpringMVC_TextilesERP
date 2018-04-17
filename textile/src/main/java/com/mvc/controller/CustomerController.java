package com.mvc.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.rememberme.PersistentTokenBasedRememberMeServices;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.mvc.dao.CustomerAccDao;
import com.mvc.dao.CustomerMasterDao;
import com.mvc.model.CustomerAccount;
import com.mvc.model.CustomerBean;
import com.mvc.model.CustomerTag;
import com.mvc.service.CustomerExcelDownloadService;
import com.mvc.service.CustomerMasterDaoService;
import com.mvc.service.UserService;

@Controller
@RequestMapping("/cus")
@SessionAttributes("roles")
public class CustomerController {
	
	@Autowired
	UserService userService;

	@Autowired
	CustomerMasterDaoService customerMasterDao;
	
	@Autowired
	CustomerMasterDao customerDao; 
	
	@Autowired
	CustomerAccDao customerAccDao; 
	
	@Autowired
	MessageSource messageSource;

	
	@Autowired
	PersistentTokenBasedRememberMeServices persistentTokenBasedRememberMeServices;
	
	@Autowired
	AuthenticationTrustResolver authenticationTrustResolver;
	 
	private static Logger logger = Logger.getLogger("controller");
	  

	@Resource(name="customerExcelDownloadService")
	private CustomerExcelDownloadService customerDownloadService;
	 

	@RequestMapping(value = "/xls", method = RequestMethod.GET)
		public void getXLS(HttpServletResponse response, Model model) throws ClassNotFoundException {
		logger.debug("Received request to download report as an XLS");
		customerDownloadService.downloadXLS(response);
	}
   
	
	@RequestMapping(value ={ "/cusNew"}, method = RequestMethod.GET)
	public String add(Model model){
		logger.info("cusNew");
		CustomerBean customerBean=new CustomerBean();
		model.addAttribute("customerBean",customerBean);
		model.addAttribute("loggedinuser", getPrincipal());
		model.addAttribute("edit", false);
		return "CustomerAdd"; 
	}
	

	@RequestMapping(value ={ "/cusNew"}, method = RequestMethod.POST)
	public String save(@Valid CustomerBean customerBean, BindingResult result, ModelMap model, RedirectAttributes redir) throws UnsupportedEncodingException {
		System.out.println("-------/-------/-------/-------/-------/-------/-------/-------/");
		String name = new String(customerBean.getCus_name().getBytes("ISO-8859-1"), "UTF-8");
		String adrs = new String(customerBean.getAddress().getBytes("ISO-8859-1"), "UTF-8");
		customerBean.setCus_name(name);
		customerBean.setAddress(adrs);
		customerMasterDao.saveCustomer(customerBean);
		System.out.println(customerBean);
		model.addAttribute("customerBean",customerBean);
		redir.addAttribute("success","Saved Successfully");
		model.addAttribute("loggedinuser", getPrincipal());
		model.addAttribute("edit", false);
		return "redirect:/cus/cuslist";
	}
	
	@RequestMapping(value ={ "/cusAddAcc"}, method = RequestMethod.GET)
	public String addAcc(Model model){
		logger.info("cusNew");
		CustomerAccount customerAcc=new CustomerAccount();
		model.addAttribute("customerAcc",customerAcc);
		model.addAttribute("loggedinuser", getPrincipal());
		model.addAttribute("edit", false);
		return "customer_add_acc"; 
	}
	

	@RequestMapping(value ={ "/cusAddAcc"}, method = RequestMethod.POST)
	public String saveAcc(@Valid CustomerAccount customerAcc, BindingResult result, ModelMap model, RedirectAttributes redir) {
		System.out.println("-------/-------/-------/-------/-------/-------/-------/-------/");
		
		Double bal = customerDao.findBalByCusId(customerAcc.getCus_id());
		if(bal==null) {
			bal=0.0;
		}
		System.out.println(bal);
		Double debit = customerAcc.getDebit();
		if(debit==null) {
			debit=0.0;
		}
		bal= bal+(debit-customerAcc.getCredit());
		System.out.println(bal);
		Integer id = customerAcc.getCus_id();
		customerDao.updateBalance(bal,id);
		customerAcc.setBalance(bal);
		customerAccDao.saveCustomerAcc(customerAcc);
		System.out.println(customerAcc);
		model.addAttribute("customerAcc",customerAcc);
		redir.addAttribute("success","Saved Successfully");
		model.addAttribute("loggedinuser", getPrincipal());
		model.addAttribute("edit", false);
		return "redirect:/cus/cuslist";
	}

	
	@RequestMapping(value = { "/delete-customer-{id}" }, method = RequestMethod.GET)
	public String deleteCustomer(@PathVariable int id, RedirectAttributes redir) {
		customerMasterDao.deleteCustomer(id);
		redir.addAttribute("success", "Deleted Successfully");
		return "redirect:/cus/cuslist";
	}
	
	@RequestMapping(value = { "/delete-customer-acc-{id}" }, method = RequestMethod.GET)
	public String deleteCustomerAcc(@PathVariable int id, RedirectAttributes redir) {
		CustomerAccount cusAcc = customerAccDao.findById(id);
		int cid= cusAcc.getCus_id(); 
		customerAccDao.deleteCustomerAcc(id);
		redir.addAttribute("success", "Deleted Successfully");
		
		return "redirect:/cus/cusAcclist-"+cid;
	}
	
	 
	@RequestMapping(value ={"/cuslist"}, method = RequestMethod.GET)
	public String viewCustomer(ModelMap model, @ModelAttribute("success") String success){
		System.out.println("view-customer/-------/-------/-------/-------/-------/-------/-------/");
		//List<CustomerBean> customerBean = customerDao.listPaginatedProductsUsingCriteria(0, 5);
		List<CustomerBean> customerBean = customerDao.findAllCustomer();
		model.addAttribute("customerBean", customerBean);
		model.addAttribute("success", success);
		model.addAttribute("loggedinuser", getPrincipal());
		return "CustomerList";
	}

		
		
	@RequestMapping(value = { "/cuslist-{id}" }, method = RequestMethod.GET)
	public String viewCustomer(@PathVariable int id, ModelMap model, @ModelAttribute("success") String success) {
		System.out.println("viewCustomer /-------/-------/-------/-------/-------/-------/-------/");
		CustomerBean customerBean = customerMasterDao.findByCustomerId(id);
		model.addAttribute("customerBean", customerBean);
		
		model.addAttribute("success", success);
		
		model.addAttribute("edit", true);
		return "CustomerAdd";
	}
		
	@RequestMapping(value = { "/cuslist-{id}" }, method = RequestMethod.POST)
	public String updateCustomer(@Valid CustomerBean customerBean, BindingResult result, ModelMap model, @PathVariable int id, RedirectAttributes redir) throws UnsupportedEncodingException {
		System.out.println("save-Customer-{id}-/-------/-------/-------/-------/-------/-------/-------/");
		String name = new String(customerBean.getCus_name().getBytes("ISO-8859-1"), "UTF-8");
		String adrs = new String(customerBean.getAddress().getBytes("ISO-8859-1"), "UTF-8");
		customerBean.setCus_name(name);
		customerBean.setAddress(adrs);
		customerMasterDao.updateCustomer(customerBean);
		model.addAttribute("customerBean", customerBean);
		redir.addAttribute("success", "Customer Details Updated Successfully");
		return "redirect:/cus/cuslist";
	}
		
	@RequestMapping(value = { "/cusAccEdit-{id}" }, method = RequestMethod.GET)
	public String editCustomerAcc(@PathVariable int id, ModelMap model, @ModelAttribute("success") String success) {
		System.out.println("editCustomerAcc /-------/-------/-------/-------/-------/-------/-------/");
		CustomerAccount CustomerAccount = customerAccDao.findById(id);
		model.addAttribute("customerAcc", CustomerAccount);
		
		model.addAttribute("success", success);
		model.addAttribute("CusAccEdit", true);
		model.addAttribute("edit", true);
		return "customer_add_acc";
	}
		
	@RequestMapping(value = { "/cusAccEdit-{id}" }, method = RequestMethod.POST)
	public String updateCustomerAcc(@Valid CustomerAccount CustomerAccount, BindingResult result, ModelMap model, @PathVariable int id, RedirectAttributes redir) {
		System.out.println("updateCustomerAcc-"+id+"-/-------/-------/-------/-------/-------/-------/-------/");
		customerAccDao.updateCusAcc(CustomerAccount);
		model.addAttribute("customerAcc", CustomerAccount);
		redir.addAttribute("success", "Customer Details Updated Successfully");
		return "redirect:/cus/cusAcclist-"+CustomerAccount.getCus_id();
	}
		
	/*@RequestMapping(value = { "/notifyListc" }, method = RequestMethod.GET)
	public String showNotify(ModelMap model) {
		
		List<CustomerBean> customerBean;
		customerBean = customerMasterDao.findAllNodify();
		model.addAttribute("customerBean", customerBean);
		model.addAttribute("edit", true);
		return "NotifyList";
	}*/
	
	//CustomerAutocomplete
	@RequestMapping(value = "/getCus", method = RequestMethod.GET)
	public @ResponseBody List<CustomerTag> getCus(@RequestParam String cusName,ModelMap model) {
		System.out.println(cusName+"...............................................................................");
		List<CustomerTag> result = new ArrayList<CustomerTag>();
		List<CustomerBean> customerBean = new ArrayList<CustomerBean>();
		
		List<CustomerBean> cus = customerDao.findByCustomerName(cusName);
		for(CustomerBean v:cus) {
			result.add(new CustomerTag(v.getCusId(), v.getCus_name()));
			System.out.println(""+v.getCusId()+" "+ ""+v.getCus_name()+"");
			customerBean.add(v);
		}
		model.addAttribute("customer", customerBean);
		
		return result;

	}
	
	
	@RequestMapping(value = { "/cusAcclist-{id}" }, method = RequestMethod.GET)
	public String viewCustomerAcc(@PathVariable int id, ModelMap model, @ModelAttribute("success") String success) {
		System.out.println("viewCustomer /-------/-------/-------/-------/-------/-------/-------/");
		CustomerBean customerBean = customerMasterDao.findByCustomerId(id);
		List<CustomerAccount> customerAcc=customerAccDao.findByCustomerId(id);
		model.addAttribute("customerAcc", customerAcc);
		model.addAttribute("customerBean", customerBean);
		model.addAttribute("success", success);
		
		model.addAttribute("edit", true);
		return "CusAccList";
	}
	
	private String getPrincipal(){
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails)principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return "Welcome";
	}
	
	
	
}