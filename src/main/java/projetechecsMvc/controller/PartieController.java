package projetechecsMvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import projetechec.repository.PartieRepository;

@Controller
@RequestMapping("/partie")
public class PartieController {

	@Autowired
	private PartieRepository partieRepository;
}
