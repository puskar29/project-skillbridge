package com.puskar.skillbridge.controller;

import com.puskar.skillbridge.dao.OrganizerDao;
import com.puskar.skillbridge.model.Organizer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.security.Principal;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

@Controller
public class OrganizerController {

    private final OrganizerDao organizerDao;

    public OrganizerController(OrganizerDao organizerDao) {
        this.organizerDao = organizerDao;
    }

    @GetMapping("/organizer/home")
    public String openOrganizerDashboard(Model model, Principal principal){
        String username = (principal != null) ? principal.getName() : "organizer";
        model.addAttribute("username", username);
        if (principal != null) {
            organizerDao.findByEmailIgnoreCase(principal.getName())
                    .ifPresent(org -> model.addAttribute("organizer", org));
        }
        return "organizer/dashboard";
    }

    @GetMapping("/organizer/pending")
    public String pending(){
        return "organizer/pending";
    }

    @GetMapping("/organizer/profile")
    public String organizerProfile(Model model, Principal principal) {
        if (principal == null) return "redirect:/login";
        Organizer organizer = organizerDao.findByEmailIgnoreCase(principal.getName()).orElseThrow();
        model.addAttribute("organizer", organizer);
        model.addAttribute("memberSince", organizer.getCreatedAt() == null ? null
                : organizer.getCreatedAt().format(DateTimeFormatter.ofPattern("MMM yyyy", Locale.ENGLISH)));
        return "organizer/profile";
    }

    @GetMapping("/organizer/profile/edit")
    public String editOrganizerProfile(Model model, Principal principal) {
        if (principal == null) return "redirect:/login";
        Organizer organizer = organizerDao.findByEmailIgnoreCase(principal.getName()).orElseThrow();
        model.addAttribute("organizer", organizer);
        return "organizer/edit-profile";
    }

    @PostMapping("/organizer/profile/update")
    public String updateOrganizerProfile(@ModelAttribute Organizer form, Principal principal) {
        if (principal == null) return "redirect:/login";
        Organizer organizer = organizerDao.findByEmailIgnoreCase(principal.getName()).orElseThrow();
        organizer.setFirstName(form.getFirstName());
        organizer.setLastName(form.getLastName());
        organizer.setPhone(form.getPhone());
        organizer.setOrganizationName(form.getOrganizationName());
        organizer.setOrganizationType(form.getOrganizationType());
        organizer.setPosition(form.getPosition());
        organizer.setWebsite(form.getWebsite());
        organizer.setOrganizationDescription(form.getOrganizationDescription());

        organizerDao.save(organizer);
        return "redirect:/organizer/profile?success";
    }

}
