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
    public String openWorkshop(){
        return "organizer/add-workshop";
    }

    @PostMapping("/organizer/workshop/add")
    public String addWorkshop(
            @ModelAttribute Workshop workshop, Principal principal
            ){

        Organizer currentOrganizer = organizerDao.findByEmailIgnoreCase(principal.getName()).orElse(null);
        workshop.setOrganizerAccount(currentOrganizer);
        if (workshop.getOrganizer() ==  null || workshop.getOrganizer().isBlank()){
            if (currentOrganizer != null){
                workshop.setOrganizer(currentOrganizer.getOrganizationName());
            }
        }

        workshop.setCreatedAt(LocalDate.now());
        workshopDao.save(workshop);
        return "redirect:/organizer/workshop/add?success";
    }

    @GetMapping("/organizer/workshop/manage")
    public String editWorkshop(Model model, Principal principal){
        Organizer currentOrganizer = organizerDao.findByEmailIgnoreCase(principal.getName()).orElse(null);
        model.addAttribute("workshop_list", workshopService.getWorkshopByOrganizer(currentOrganizer));
        return "organizer/manage-workshops";
    }

    @GetMapping("/organizer/workshop/edit/{id}")
    public String editWorkshop(@PathVariable Long id, Model model){
        Workshop workshop = workshopService.getWorkshopById(id);
        model.addAttribute("workshop", workshop);
        model.addAttribute("edit", true);

        return "organizer/add-workshop";
    }

    @PostMapping("/organizer/workshop/edit/{id}")
    public String updateWorkshop(@PathVariable Long id,
                                 @ModelAttribute Workshop workshop){
        workshop.setId(id);
        workshopService.updateWorkshop(workshop);
        return "redirect:/organizer/workshop/manage";
    }

    @GetMapping("/organizer/workshop/delete/{id}")
    public String deleteWorkshop(@PathVariable Long id){
        Workshop workshop = workshopService.getWorkshopById(id);
        workshopService.deleteWorkshop(workshop);
        return "redirect:/organizer/workshop/manage";
    }

}
