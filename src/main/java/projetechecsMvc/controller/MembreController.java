package projetechecsMvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import projetechec.repository.MembreRepository;

@Controller
@RequestMapping("/membre")
public class MembreController {

	@Autowired
	private MembreRepository membreRepository;
}
