package projetechecsMvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import projetechec.repository.ClubRepository;

@Controller
@RequestMapping("/club")
public class ClubController {

	@Autowired
	private ClubRepository clubRepository;
}
