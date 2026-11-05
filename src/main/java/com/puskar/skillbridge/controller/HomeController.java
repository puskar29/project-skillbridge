package com.puskar.skillbridge.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping({"/", "/home", "/index"})
    public String home(){
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
    public String internship(){
        return "internship";
    }

    @GetMapping("/workshop")
    public String workshop(){
        return "workshop";
    }

    @GetMapping("/opportunity")
    public String opportunity(){
        return "opportunity";
    }

}
