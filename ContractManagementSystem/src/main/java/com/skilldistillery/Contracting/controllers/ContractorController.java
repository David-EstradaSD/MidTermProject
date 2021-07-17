package com.skilldistillery.Contracting.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.Contracting.data.ContractorDAO;
import com.skilldistillery.Contracting.data.UserDAO;
import com.skilldistillery.Contracting.entities.Contractor;
import com.skilldistillery.Contracting.entities.User;

@Controller
public class ContractorController {

	@Autowired
	private ContractorDAO contractorDao;
	@Autowired
	private UserDAO userDao;
	
	
	@RequestMapping(path = "ContractorForm.do")
	public String contractorSignup(User user, Contractor contractor, Model model) {
//		userDao.someMethodName(user);
		contractor.setUser(user);
		contractorDao.addContractor(contractor);
		
		return "";
	}
	
	
}