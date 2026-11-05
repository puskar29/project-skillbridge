package com.puskar.skillbridge.controller;

import com.puskar.skillbridge.service.InternshipService;
import com.puskar.skillbridge.service.WorkshopService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    private final InternshipService internshipService;
    private final WorkshopService workshopService;

    public HomeController(InternshipService internshipService, WorkshopService workshopService) {
        this.internshipService = internshipService;
        this.workshopService = workshopService;
    }

    @GetMapping({"/", "/home", "/index"})
    public String home(Model model){
        model.addAttribute("internships", internshipService.getActiveInternships());
        model.addAttribute("workshops", workshopService.getActiveWorkshops());
        return "index";
    }

    @GetMapping("/about")
    public String about(){
        return "about";
    }

    @GetMapping("/contact")
    public String contact(){
        return "contact";
    }

    @GetMapping("/internship")
    public String internship(Model model){
        model.addAttribute("internships", internshipService.getActiveInternships());
        return "internship";
    }

    @GetMapping("/workshop")
    public String workshop(Model model){
        model.addAttribute("workshops", workshopService.getActiveWorkshops());
        return "workshop";
    }

    @GetMapping("/opportunity")
    public String opportunity(Model model){
        model.addAttribute("internships", internshipService.getActiveInternships());
        model.addAttribute("workshops", workshopService.getActiveWorkshops());
        return "opportunity";
    }

}
