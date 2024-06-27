package com.spring5legacy.ourpro00.common.security;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ToLoginLogoutPageController {

	@GetMapping("/login")
	public String toLoginPage(String error, String logout, Model model) {
		
		return null;
	}
	
	@GetMapping("/logout")
	public String toLogoutPage() {
		return null;
	}
}
