package com.puskar.skillbridge.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

    @GetMapping({"/admin/home", "/admin/dashboard"})
    public String adminDashboard(){
        return "super-admin/dashboard";
    }

    @GetMapping({"/admin/organizers", "admin/organizer"})
    public String manageOrganizer(){
        return "super-admin/manage-organizers";
    }
}
