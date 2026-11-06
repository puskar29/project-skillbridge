package com.puskar.skillbridge.controller;

import com.puskar.skillbridge.dao.OrganizerDao;
import com.puskar.skillbridge.dao.WorkshopDao;
import com.puskar.skillbridge.model.Organizer;
import com.puskar.skillbridge.model.Workshop;
import com.puskar.skillbridge.service.WorkshopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.security.Principal;
import java.time.LocalDate;

@Controller
public class WorkshopController {

    @Autowired
    private WorkshopService workshopService;

    @Autowired
    private WorkshopDao workshopDao;
    @Autowired
    private OrganizerDao organizerDao;

    @GetMapping("/organizer/workshop/add")
    public String openWorkshop(Principal principal){
        if (!isApproved(principal)) {
            return "redirect:/organizer/home?error=not-approved";
        }
        return "organizer/add-workshop";
    }

    @PostMapping("/organizer/workshop/add")
    public String addWorkshop(
            @ModelAttribute Workshop workshop, Principal principal
            ){

        Organizer currentOrganizer = organizerDao.findByEmailIgnoreCase(principal.getName()).orElse(null);
        workshop.setOrganizerAccount(currentOrganizer);
        if (currentOrganizer == null || !currentOrganizer.isApproved()) {
            return "redirect:/organizer/home?error=not-approved";
        }
        workshop.setOrganizer(currentOrganizer.getOrganizationName());

        workshop.setCreatedAt(LocalDate.now());
        workshopDao.save(workshop);
        return "redirect:/organizer/workshop/add?success";
    }

    @GetMapping("/organizer/workshop/manage")
    public String editWorkshop(Model model, Principal principal){
        Organizer currentOrganizer = organizerDao.findByEmailIgnoreCase(principal.getName()).orElse(null);
        if (currentOrganizer == null || !currentOrganizer.isApproved()) {
            return "redirect:/organizer/home?error=not-approved";
        }
        model.addAttribute("workshop_list", workshopService.getWorkshopByOrganizer(currentOrganizer));
        return "organizer/manage-workshops";
    }

    @GetMapping("/organizer/workshop/edit/{id}")
    public String editWorkshop(@PathVariable Long id, Model model, Principal principal){
        if (!isApproved(principal)) {
            return "redirect:/organizer/home?error=not-approved";
        }
        Workshop workshop = workshopService.getWorkshopById(id);
        model.addAttribute("workshop", workshop);
        model.addAttribute("edit", true);

        return "organizer/add-workshop";
    }

    @PostMapping("/organizer/workshop/edit/{id}")
    public String updateWorkshop(@PathVariable Long id,
                                 @ModelAttribute Workshop workshop,
                                 Principal principal){
        Organizer currentOrganizer = organizerDao.findByEmailIgnoreCase(principal.getName()).orElseThrow();
        if (!currentOrganizer.isApproved()) {
            return "redirect:/organizer/home?error=not-approved";
        }
        workshop.setId(id);
        workshop.setOrganizer(currentOrganizer.getOrganizationName());
        workshop.setOrganizerAccount(currentOrganizer);
        workshopService.updateWorkshop(workshop);
        return "redirect:/organizer/workshop/manage";
    }

    private boolean isApproved(Principal principal) {
        return principal != null
                && organizerDao.findByEmailIgnoreCase(principal.getName())
                .map(Organizer::isApproved)
                .orElse(false);
    }

    @GetMapping("/organizer/workshop/delete/{id}")
    public String deleteWorkshop(@PathVariable Long id){
        Workshop workshop = workshopService.getWorkshopById(id);
        workshopService.deleteWorkshop(workshop);
        return "redirect:/organizer/workshop/manage";
    }

}
