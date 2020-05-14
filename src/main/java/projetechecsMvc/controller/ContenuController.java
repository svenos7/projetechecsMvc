package projetechecsMvc.controller;

import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import projetechec.entity.ContenuPedagogique;
import projetechec.entity.Livre;
import projetechec.entity.Video;
import projetechec.repository.ContenuPedagogiqueRepository;

@Controller
@RequestMapping("/contenu")
public class ContenuController {

	@Autowired
	private ContenuPedagogiqueRepository contenuRepository;

	@GetMapping(value = { "", "/" })
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView("contenu/list");
		mav.addObject("contenus", contenuRepository.findAll());
		return mav;
	}

	@GetMapping("/delete")
	public ModelAndView delete(@RequestParam Integer id) {
		contenuRepository.deleteById(id);
		return new ModelAndView("redirect:/contenu");
	}

	@GetMapping("/livre")
	public ModelAndView addLivre() {
		return goEdit(new Livre());
	}

	@GetMapping("/video")
	public ModelAndView addVideo() {
		return goEdit(new Video());
	}

	@GetMapping("/edit")
	public ModelAndView edit(@RequestParam Integer id, @RequestParam String type) {
		Optional<ContenuPedagogique> opt = contenuRepository.findById(id);
		if (opt.isPresent()) {
			return goEdit(opt.get());
		}

		return goEdit(new Livre());

	}

	private ModelAndView goEdit(ContenuPedagogique contenu) {
		ModelAndView mav = new ModelAndView("contenu/edit");
		mav.addObject("cp", contenu);
		return mav;
	}

	@PostMapping("/save/livre")
	public ModelAndView saveLivre(@Valid @ModelAttribute("cp") Livre livre, BindingResult br) {
		return save(livre, br);
	}

	@PostMapping("/save/video")
	public ModelAndView saveVideo(@Valid @ModelAttribute("cp") Video video, BindingResult br) {
		return save(video, br);
	}

	private ModelAndView save(ContenuPedagogique contenu, BindingResult br) {
		if (br.hasErrors()) {
			return goEdit(contenu);
		}
		contenuRepository.save(contenu);
		return new ModelAndView("redirect:/contenu");
	}

}