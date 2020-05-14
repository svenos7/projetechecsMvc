package projetechecsMvc.controller;

import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import projetechec.entity.Club;
import projetechec.repository.ClubRepository;

@Controller
@RequestMapping("/club")
public class ClubController {

	@Autowired
	private ClubRepository clubRepository;

	@GetMapping(value = { "", "/" })
	public ModelAndView list() {
		ModelAndView modelAndView = new ModelAndView("club/list");
		modelAndView.addObject("clubs", clubRepository.findAll());
		return modelAndView;
	}

	@GetMapping("/edit")
	public ModelAndView edit(@RequestParam Integer id) {
		Optional<Club> opt = clubRepository.findById(id) ;
		if (opt.isPresent()) {
			return goEdit(opt.get());
		}
		return goEdit(new Club());
	}

	private ModelAndView goEdit(Club club) {
		ModelAndView modelAndView = new ModelAndView("club/edit");
		modelAndView.addObject("c", club);
		return modelAndView;
	}

	@GetMapping("/delete")
	public ModelAndView delete(@RequestParam Integer id) {
		clubRepository.deleteById(id);
		return new ModelAndView("redirect:/club");
	}
	
	@PostMapping("/save")
	public String save(@Valid @ModelAttribute("club") Club club, BindingResult br, Model model) {
		if (br.hasErrors()) {
			return "club/edit";
		} else {
			clubRepository.save(club);
		}
		return "redirect:/club";
	}
}
