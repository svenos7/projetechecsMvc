package projetechecsMvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import projetechec.repository.TournoiRepository;

@Controller
@RequestMapping("/tournoi")
public class TournoiController {

	@Autowired
	private TournoiRepository tournoiRepository;
}
