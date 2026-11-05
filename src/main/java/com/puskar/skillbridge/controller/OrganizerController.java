package com.puskar.skillbridge.controller;

import com.puskar.skillbridge.model.Organizer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;

@Controller
public class OrganizerController {

    private final OrganizerDao organizerDao;


    @GetMapping("/organizer/home")
    public String openOrganizerDashboard(Model model, Principal principal){
        String username = (principal != null) ? principal.getName() : "organizer";
        model.addAttribute("username", username);
        return "organizer/dashboard";
    }

    @GetMapping("/organizer/pending")
    public String pending(){
        return "organizer/pending";
    }

}