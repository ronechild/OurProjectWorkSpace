package com.spring5legacy.ourpro00.common.security;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AccessForbiddenController {

	@GetMapping("/accessFobiddenError")
	public String accessForbidden(Model model, Authentication authentication) {
		System.out.println("접근금지됨");

		return "redirect:/board/homepage";
	}
}
