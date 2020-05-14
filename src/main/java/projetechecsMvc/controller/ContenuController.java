package projetechecsMvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import projetechec.repository.ContenuPedagogiqueRepository;

@Controller
@RequestMapping("/contenu")
public class ContenuController {

	@Autowired
	private ContenuPedagogiqueRepository contenuRepository;
}